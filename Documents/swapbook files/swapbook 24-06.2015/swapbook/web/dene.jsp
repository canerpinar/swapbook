<%-- 
    Document   : dene
    Created on : Feb 11, 2015, 10:54:25 AM
    Author     : can
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pck.database.Database"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>        
        <%
        if(ServletFileUpload.isMultipartContent(request))
        {
            ServletFileUpload servletFileUpload=new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> items=servletFileUpload.parseRequest(request);            
            String directory=getServletContext().getRealPath("");
            FileItem fileItem=items.get(0);
            FileItem files=fileItem;
            
        File file=new File(directory+"/jpeg/"+session.getAttribute("session_id")+"_res.png");
        file.setWritable(true);
        file.getParentFile().mkdirs();
        files.write(file);
        ServletContext servletRequest=getServletContext();
        String connection=servletRequest.getInitParameter("connection");
        String user=servletRequest.getInitParameter("User");
        String password=servletRequest.getInitParameter("Password");
        String driver=servletRequest.getInitParameter("Driver");
        Database data=new Database();
        Class.forName(driver);
        Connection con=data.getConnection(connection, user, password);
        Statement st=con.createStatement();
        st.execute("update user set avatar='"+session.getAttribute("session_id")+"_res.png"+"' where email='"+session.getAttribute("session_email")+"'");        
        session.setAttribute("session_avatar",session.getAttribute("session_id")+"_res.png");        
        response.sendRedirect("profil.jsp");
                    
        }       
        else
        {
            out.print("request gerçekleşmedi");
        }        
        %>
    </body>
</html>
