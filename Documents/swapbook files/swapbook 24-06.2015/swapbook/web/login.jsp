<%-- 
    Document   : login
    Created on : Feb 8, 2015, 5:04:31 PM
    Author     : can
--%>

<%@page import="pck.Bean.Session"%>
<%@page import="pck.Bean.Person"%>
<%@page import="pck.Bean.LoginControl"%>
<%@page import="pck.database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String log_user=null;
        String log_password=null;
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");  
        if(request.getParameter("email")==null || request.getParameter("sifre2")==null)
        {
            response.sendRedirect("index.jsp");
        }
        else
        {
            
            
        log_user=request.getParameter("email").toString();
        log_password=request.getParameter("sifre2").toString();
            LoginControl log=new LoginControl(request);
            Person person=log.Login(log_user, log_password);
            Session ses=new Session(request);
            try
            {
            ses.createSession(person);
            response.sendRedirect("index.jsp");
            }catch(Exception e)
            {
                response.sendRedirect("index.jsp?login=false");
            }
        }
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
