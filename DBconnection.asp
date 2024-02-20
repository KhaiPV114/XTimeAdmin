<%
    ConnectionString = "Provider=SQLOLEDB;Data Source=MyLaptop\KHAIPHAN;Initial Catalog=KhaiTime;User Id=sa; Password = sa;"
    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open ConnectionString
%>  