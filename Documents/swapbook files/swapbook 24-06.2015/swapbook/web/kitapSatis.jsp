<%-- 
    Document   : kitapSatis
    Created on : 07.Haz.2015, 23:03:39
    Author     : can
--%>

<%@page import="pck.database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
    <h1>Satışınız Sisteminize eklenmiştir.Sayfa Kapanıyor.</h1>
<script>
    

    setInterval(function ()
        {              
          window.close();
          
        },3000);   
</script>

<%

int kitapID=Integer.parseInt(request.getParameter("kitapID"));

            Database data=new Database();
            String connect=request.getServletContext().getInitParameter("connection");
            String user=request.getServletContext().getInitParameter("User");
            String password=request.getServletContext().getInitParameter("Password");
            String driver=request.getServletContext().getInitParameter("Driver");
            data.getConnection(connect, user, password);
            data.BookInformation(kitapID);
            data.SatilikKitapEkle(data.bookKitapBilgi.getId(), data.bookKitapBilgi.getAdi(), request.getParameter("fiyat"));
            out.print(data.bookKitapBilgi.getAdi());
            out.print(data.bookKitapBilgi.getYazar());
            out.print(data.bookKitapBilgi.getProid());
            out.print("ve son olarak fiyat " +request.getParameter("fiyat"));           
%>
</body>
</html>
