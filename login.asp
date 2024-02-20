<%@  language="VBSCRIPT" codepage="65001" %>
<!--#include file="DBconnection.asp"-->

<%
    set rs = CreateObject("ADODB.recordset")
    username = Request.Form("username")
    password = Request.Form("password")

    sql = "Select * from Account where email = '" & username & "'" & " And password = '" & password & "'"

    rs.open sql, conn

    If (not rs.eof) Then
        Response.Redirect "/homepage"
    Else
        Response.Redirect "/login"
    End If

%>