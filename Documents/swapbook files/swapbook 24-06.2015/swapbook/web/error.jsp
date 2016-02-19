<%-- 
    Document   : error
    Created on : Mar 13, 2015, 2:41:52 PM
    Author     : can
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script type="text/javascript">
    
    function sayici()
    {        
            location.href='index.jsp';

    }
    
    $(document).ready(function ()
    {           
      
        setInterval(sayici,2000);
            
    }); 
        
        
    </script>
    </head>

    <body>
        <h1>Beklenmedik hata oluştu yönlendiriliyorsunuz.</h1>
    </body>
</html>
