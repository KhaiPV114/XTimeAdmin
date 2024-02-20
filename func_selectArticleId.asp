<!--#include file="DBconnection.asp"-->

<%
        Dim articleId
        rsArticleId = CreateObject("ADODB.recordset")
        sql = "Select Max(articleId) from Article"
        rsArticleId.open sql, conn
        articleId = rs(0)
        rsArticleId.close
%>

