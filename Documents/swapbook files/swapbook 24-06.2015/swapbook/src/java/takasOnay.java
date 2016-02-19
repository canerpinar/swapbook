
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
public class takasOnay extends HttpServlet {//takas onay sayfası takas isteğinin onaylanması aşaması
    //direk mesaj atma evresine geçilebilir.
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
                request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
            Database data=new Database();
            String connect=request.getServletContext().getInitParameter("connection");
            String user=request.getServletContext().getInitParameter("User");
            String password=request.getServletContext().getInitParameter("Password");
            String driver=request.getServletContext().getInitParameter("Driver");

        try {
            Class.forName(driver);
            data.getConnection(connect, user, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(takasOnay.class.getName()).log(Level.SEVERE, null, ex);
        }  
        if(request.getParameter("mesajGonder")!=null)
        {
            //response.getWriter().println("mesaj gönderilecek");
                try {
            
            int mesajAtan=Integer.parseInt(request.getParameter("mesajatan"));
            int mesajalan=Integer.parseInt(request.getParameter("mesajalan"));
            String mesaj=request.getParameter("mesajYaz");
            data.chatSend(mesajalan, mesajAtan, mesaj);
                } catch (SQLException ex) {
                    Logger.getLogger(takasOnay.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
        else
        {

        try {
            int kitapid=Integer.parseInt(request.getParameter("id"));
            int mesajAlan=Integer.parseInt(request.getParameter("mesajalan"));
            int kitapSahip=Integer.parseInt(request.getParameter("kitapsahibi"));
            int swapid=Integer.parseInt(request.getParameter("swapid"));
            data.MessageSend(swapid,kitapid,mesajAlan,kitapSahip);  //takas onaylandıktan sonra kitapların veritabanından pasif olması gerek          
            data.updateBookSwapOK(kitapid,mesajAlan);//mesajalan takasonay numarasına eklenecek takas isteği onaylanan üye.
        }catch (SQLException ex) {
            Logger.getLogger(takasOnay.class.getName()).log(Level.SEVERE, null, ex);
        }

        }
        response.sendRedirect("profil.jsp");
         
    }
    
    
}
