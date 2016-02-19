<%-- 
    Document   : logout
    Created on : Feb 7, 2015, 11:47:16 PM
    Author     : can
--%>

<%@page import="pck.Bean.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Session oturum=new Session(request);
        HttpSession req=oturum.getHttpSession();
        req.invalidate();
        response.sendRedirect("index.jsp");
        
        %>
    </body>
</html>
