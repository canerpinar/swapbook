/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pck.Bean;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import pck.database.Database;

/**
 *
 * @author can
 */
public class Session{
    
     HttpSession httpSession;
    HttpServletRequest request;
    public Session(HttpServletRequest servletRequest)
    {
    httpSession=servletRequest.getSession(true);
    request=servletRequest;
    }
 
    public  HttpSession getHttpSession()
    {    
    return httpSession;
    }
    
    public void createSession(Person person) throws ClassNotFoundException, SQLException
    {   
        Database data=new Database();
            String connect=request.getServletContext().getInitParameter("connection");
            String user=request.getServletContext().getInitParameter("User");
            String password=request.getServletContext().getInitParameter("Password");
            String driver=request.getServletContext().getInitParameter("Driver");
            data.getConnection(connect, user, password);
            Class.forName(driver);
        String id=data.SelectPersonId(person.email);                
        httpSession.setAttribute("session_id", id);
        httpSession.setAttribute("session_avatar", person.avatar);
        httpSession.setAttribute("session_name", person.adsoyad);
        httpSession.setAttribute("session_email", person.email);
        httpSession.setAttribute("session_scholl", person.okul);
        httpSession.setAttribute("session_bolum", person.bolum);
        httpSession.setAttribute("session_sex", person.cinsiyet);
        httpSession.setAttribute("session_date", person.dogumtarih);
        
    }
    public void closeSession()
    {
    httpSession.invalidate();  
    }    
}
