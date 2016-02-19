
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pck.database.Database;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author can
 */
public class kitapTakas extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String[] takaslar=request.getParameterValues("takaslar");
    Database data=new Database();
    String connect=request.getServletContext().getInitParameter("connection");
    String user=request.getServletContext().getInitParameter("User");
    String password=request.getServletContext().getInitParameter("Password");
    String driver=request.getServletContext().getInitParameter("Driver");
        try {
            Class.forName(driver);
            data.getConnection(connect, user, password);
            data.updateBookSwap(takaslar);
            response.sendRedirect("profil.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(kitapTakas.class.getName()).log(Level.SEVERE, null, ex);
        }
        //response.sendRedirect("index.jsp");
    }
}
