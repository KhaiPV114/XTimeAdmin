<!--#include file="DBconnection.asp"-->

<%    
    cateId = Request.QueryString("cateId")
    articleName = Request.QueryString("articleName")
    articleDescription = Request.QueryString("articleDescription")
    articleBody = Request.QueryString("articleBody")
    articleLargePic = Request.QueryString("articleLargePic")
    articleSmallPic = Request.QueryString("articleSmallPic")


    sql = "Insert into Article (articleTitle, articleBody, articleDescription) values " 
    sql = sql & "("
    sql = sql & "'" & articleName & "'"
    sql = sql & ",'" & articleBody & "'"
    sql = sql & ",'" & articleDescription &"'"
    sql = sql & ")"
    
    On Error Resume Next
    conn.execute sql
    Response.Write sql
    If Err <> 0 Then
        Response.Write "Can't insert information."
        Response.Write Err.Description  
    Else
        sql1 = "Insert into Category_Article (categoryID, articleId) values "
        sql1 = sql1 & "("
        sql1 = sql1 & cateId & ", "
        sql1 = sql & articleId
        sql1 = sql1 & ")"
        conn.execute sql1
        Response.Write sql1
        If Err <> 0 Then
            Response.Write "Can't insert informationzzzz."
            Response.Write Err.Description  

        Else
            Response.Write "Successfully inserted."
        End If
        Response.Write "Successfully inserted."
    End If
    conn.close

    ' sql2 = "Insert into Category_Article (categryId, articleId) values "
    ' sql2 = sql2 & "("
    ' sql2 = sql2 & cateId
    ' sql2 = sql2 & "," &  

%>
