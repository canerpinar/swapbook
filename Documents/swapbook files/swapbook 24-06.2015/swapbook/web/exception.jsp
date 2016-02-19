<%-- 
    Document   : exception
    Created on : Mar 3, 2015, 1:03:08 PM
    Author     : can
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Kullanıcı adınız ve şifreniz hatalı</h1>
        <%response.sendRedirect("logout.jsp");             %>
    </body>
</html>
