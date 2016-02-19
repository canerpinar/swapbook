
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pck.Bean.Session;
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
public class takasRequest extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        Database data=new Database();
        Session req=new Session(request);
        
        int kitapSahibi=Integer.parseInt(request.getParameter("id"));
        int kitapid=Integer.parseInt(request.getParameter("book"));
        int istekSahibi=Integer.parseInt(req.getHttpSession().getAttribute("session_id").toString());
        String kitapadi=request.getParameter("adi");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
 
        String connect=request.getServletContext().getInitParameter("connection");
        String user=request.getServletContext().getInitParameter("User");
        String password=request.getServletContext().getInitParameter("Password");
        String driver=request.getServletContext().getInitParameter("Driver");
            try {
                Class.forName(driver);                
                data.getConnection(connect, user, password);

                
                data.takasRequest(kitapSahibi, kitapid, istekSahibi,kitapadi);
                response.sendRedirect("index.jsp");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(takasRequest.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {  
            Logger.getLogger(takasRequest.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        response.sendRedirect("index.jsp");
    }
}
