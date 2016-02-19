/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pck.Bean.Book;
import pck.Bean.Session;
import pck.database.Database;

/**
 *
 * @author can
 */
public class kitapYukle extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        
        String connect=request.getServletContext().getInitParameter("connection");
        String user=request.getServletContext().getInitParameter("User");
        String password=request.getServletContext().getInitParameter("Password");
        String driver=request.getServletContext().getInitParameter("Driver");
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(kitapYukle.class.getName()).log(Level.SEVERE, null, ex);
        }
        Database data=new Database();
        data.getConnection(connect, user, password);
        
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Session ses=new Session(request);        
        String id=ses.getHttpSession().getAttribute("session_id").toString();        
        int proid=Integer.valueOf(id);
        
        String adi=request.getParameter("kitap_adi");
        String kategori=request.getParameter("kitap_kategori");
        String yazar=request.getParameter("kitap_yazar");
        String kitapYorum=request.getParameter("kitap_yorum");
        Book book=new Book();
        book.setAdi(adi);
        book.setProid(proid);
        book.setKategori(kategori);
        book.setYazar(yazar);
        book.setYorum(kitapYorum);                
        data.InsertBook(book);
        response.sendRedirect("profil.jsp");
    }
    
}
