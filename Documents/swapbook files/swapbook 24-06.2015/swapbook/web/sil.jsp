<%-- 
    Document   : sil
    Created on : Jun 19, 2015, 3:20:19 PM
    Author     : caner
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="jquery/kitapSatisForm.js" type="text/javascript"></script>
    </head>
    <body>
        <%
        String kitapID=request.getParameter("bookid");
        
        %>
        <form action="kitapSatis.jsp">
            
            <span>Fiyat</span>
            <input type="text" name="fiyat" id="fiyatText"></input>
            <span style="font-size: small;" id="fiyatLabel"></span>
            <input type="hidden" name="kitapID" value=<%=kitapID %>></input>
            </br>
            <input type=submit value=Satış></input>
        </form>  
        
    </body>
</html>
