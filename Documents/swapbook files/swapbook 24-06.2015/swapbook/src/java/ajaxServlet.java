
import java.io.IOException;
import java.sql.SQLException;
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
public class ajaxServlet extends HttpServlet{
    
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        String isim=request.getParameter("isim");
        String guvenSahibiRequest=request.getParameter("guvensahibi");
        String guvenVerenRequest=request.getParameter("guvenveren");

        int guvensahibi=Integer.parseInt(guvenSahibiRequest);
        int guvenveren=Integer.parseInt(guvenVerenRequest);
            Database data=new Database();
            String connect=request.getServletContext().getInitParameter("connection");
            String user=request.getServletContext().getInitParameter("User");
            String password=request.getServletContext().getInitParameter("Password");
            String driver=request.getServletContext().getInitParameter("Driver");
            data.getConnection(connect, user, password);            
        try {
            Class.forName(driver);
            data.InsertGuvenilirlik(guvensahibi, guvenveren);
            data.GuvenSayisi(guvensahibi, guvenveren);
            response.getWriter().println(data.guvenenSayici);
        } catch (SQLException ex) {
            Logger.getLogger(ajaxServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ajaxServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
    
    
}
