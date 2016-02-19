/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pck.Bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import pck.database.Database;

/**
 *
 * @author can
 */
public class LoginControl {
    
    HttpServletRequest servletRequest;
    public LoginControl(HttpServletRequest servletRequest)
    {
    this.servletRequest=servletRequest;
    }
    
    //Login kontrolü yapmak için database sınıfına bakacak eğer true ise personu dolduracak session created
    public Person Login(String user,String password) throws ClassNotFoundException, SQLException
    {
        Person person=null;
        
            if(user != null && password!=null)//gelen parametreler boş değilse
            {   
                try
                {
                Database data=new Database();
                String driver=servletRequest.getServletContext().getInitParameter("Driver");
                String connection=servletRequest.getServletContext().getInitParameter("connection");
                String con_user=servletRequest.getServletContext().getInitParameter("User");
                String con_password=servletRequest.getServletContext().getInitParameter("Password");
                Class.forName(driver);
                Connection connect=data.getConnection(connection, con_user, con_password);
                Statement st=connect.createStatement();
                ResultSet set=st.executeQuery("select *from user where email='"+user+"' and password='"+password+"' collate utf8_bin");
                set.next();
                person=new Person();
                int id=Integer.parseInt(st.getResultSet().getString("id"));
                String avatar=set.getString("avatar");
                String adsoyad=set.getString("adsoyad");
                String email=set.getString("email");
                String okul=set.getString("okul");
                String bolum=set.getString("bolum");
                Date dogumtarih=set.getDate("dogumtarih");
                String cinsiyet=set.getString("cinsiyet");//person degerlerini doldurmak için yapıldı
                person.setId(id);
                person.setAdsoyad(adsoyad);
                person.setBolum(bolum);
                person.setCinsiyet(cinsiyet);
                person.setDogumtarih(dogumtarih);
                person.setEmail(email);
                person.setOkul(okul);
                person.setPassword(password);
                person.setAvatar(avatar);
                //person.setUsername(username);
                return person;
                }catch(Exception e)
                {                                    
                return person;
                }
           
            }
            else
            {
            return person;
            }
    }
    
}
