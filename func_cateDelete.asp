<!--#include file="DBconnection.asp"-->

<%
    set rs = CreateObject("ADODB.recordset")
    cateId = Request.QueryString("cateId")

    sql = "Delete from Category where categoryId = " & cateId 

    On Error Resume Next
    conn.execute sql
    If err<> 0 Then
        Response.Write "Can't not delete"
    Else
        Response.Redirect "/cate-manage"
    End if
    conn.close
%>