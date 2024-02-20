<!--#include file="DBconnection.asp"-->

<%
    cateId = Request.QueryString("cateEditId")
    cateName = Request.QueryString("cateNameEdit")
    cateOrder = Request.QueryString("cateOrder")
    cateEditBody = Request.QueryString("cateEditBody")

    sql = "Update Category set " 
    sql = sql & " categoryName= '" & cateName 
    sql = sql & "', categoryBody= '" & cateEditBody
    sql = sql & "', updateDate = '" & Now
    sql = sql & "', categoryOrder = " & cateOrder
    sql = sql & " where categoryId = " & cateId

    
    On Error Resume Next
    Response.Write sql
    conn.execute sql
    If Err <> 0 Then
        Response.Write "Can't update category information."
        Response.Write Err.Description  

    Else
        Response.Redirect "/cate-manage"
        Response.Write "Successfully updated category."
    End If
    conn.close
%>
