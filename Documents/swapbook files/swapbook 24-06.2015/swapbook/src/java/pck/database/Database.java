/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pck.database;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pck.Bean.Book;
import pck.Bean.Person;
import pck.Bean.SatilikBook;
import pck.Bean.SwapView;

/**
 *
 * @author can
 */

//veritabanı katmanı
public class Database implements ImpDatabase
{

    Connection connect=null;
   public  Person person=null;
   public List<Book> bookListe=new ArrayList<Book>();//login kullanıcının kitapları buraya atılacak
   public List<Book> swapbook=new ArrayList<Book>() ;//takas durumundaki kitaplar
   public Book bookKitapBilgi=new Book();   //profil sayfasındaki sıralanan kitap bilgileri
   public int takascount=0;
   public List<SwapView> listSwapView=new ArrayList<SwapView>();   
   public List<String> takasGonderenString=new ArrayList<String>();//takas isteği gönderenler
   public List<String> mesajlar=new ArrayList<String>();//mesajın kimden geldiğini öğrenmek için int id tutulacak
   public List<Integer> messagewhom=new ArrayList<Integer>();
   public List<String> mesajwhomname=new ArrayList<String>();
   public int messageCount;
   public List<Integer> universityFriends=new ArrayList<Integer>();
  
   public List<Integer> mesajId=new ArrayList<Integer>();
   public String mesajAtan="";
   public List<String> mesajViewer=new ArrayList<String>();
   
   public List<Boolean> personMesajStatus=new ArrayList<Boolean>();
   public List<Integer> mesajyollayan=new ArrayList<Integer>();
   
   public int guvenenSayici;//bir profile guvenen insan sayısı
   public boolean guvenStatus;//login kullanıcının bir profile guvenip guvenmediği
   public boolean kitapCountControl=false;//kitapCountControl 4 ten büyükse başka kitap eklemyemez.
   public List<SatilikBook> satiliBookListe;//satilikKitapların listesi index sayfasında gözükmesi için
           
    @Override
    public Connection getConnection(String connection, String user, String password) {        
        try {
            connect=DriverManager.getConnection(connection+"?useunicode=true&characterEncoding=UTF-8", user, password);
            
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }        
       return connect;        
    }
    @Override    
    public boolean InsertPerson(Person person) {
        Statement st;       
        this.person=person;        
        try {
            st = connect.createStatement();
            st.execute("insert into user(password,adsoyad,email,okul,bolum,dogumtarih,cinsiyet) values('"+this.person.password+"','"+this.person.adsoyad+"','"+this.person.email+"','"+this.person.okul+"','"+this.person.bolum+"','"+this.person.dogumtarih+"','"+this.person.cinsiyet+"')");                        
           return true;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }   
    }
    public void InsertGuvenilirlik(int guvensahibi,int guvenveren) throws SQLException
    {
        Statement st=connect.createStatement();
        st.execute("insert into guvenilirlik(guven_sahibi,guven_veren) values('"+guvensahibi+"','"+guvenveren+"')");
        st.close();
    }
    public void GuvenSayisi(int guvenSahibi,int guvenVeren) throws SQLException//baktığı kitabın sahibinin ID 'si bookInformation.getproid=guvensahibi
    {
        //guven sahibi guvenen sayısını saymak adına property guvenveren tekrar guvenememsi adına
        //güven sahibi session ID ye eşit ise güven verememesi gerekiyor.
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select guven_sahibi,guven_veren from guvenilirlik where guven_sahibi='"+guvenSahibi+"'");
        while(set.next())
        {
            guvenenSayici++;
            if(guvenVeren==set.getInt("guven_veren") && guvenStatus!=false)
            {
                guvenStatus=false;
            }
            
        }
        
    }
    @Override
    public void InsertBook(Book book) {
        Statement st=null;
        try
        {
        st=connect.createStatement();
        st.execute("insert into kitaplar(proid,adi,kategori,yazar,yorum) values("+book.proid+",'"+book.adi+"','"+book.kategori+"','"+book.yazar+"','"+book.getYorum()+"')");
        
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    @Override
    public void SelectBook(int id) {//profil sayfasındaki kitap bilgileri
        
        Statement st=null;
        try
        {
        st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from kitaplar where proid="+id+"");        
        while(set.next())
        {            
            Book book=new Book();
            int book_id=Integer.parseInt(set.getString("id"));
            String proid=set.getString("proid");
            String durum=set.getString("takasdurum");
            String adi=set.getString("adi");
            String kategori=set.getString("kategori");
            String yazar=set.getString("yazar");
            String satilikStatus=set.getString("satilikdurum");
            String takasOnay=set.getString("takasonay");
            
            book.setId(book_id);
            book.setProid(Integer.valueOf(proid));
            book.setAdi(adi);
            book.setKategori(kategori);
            book.setYazar(yazar); 
            if(takasOnay!=null)
            {
            book.setTakasOnay(Integer.parseInt(takasOnay));
            }
            else
            {
            book.setTakasOnay(0);
            }
            
                if(satilikStatus==null)
                {
                    book.setSatilikdurum(false);
                }
                else if(satilikStatus.equals("1"))//satılık onayı verildiyse
                {
                    book.setSatilikdurum(true);
                }
                if(durum==null)//takas 1 ise takasta true 
                {
                    book.setTakasStatus(false);                
                }
                else if(durum.equals("1"))
                {
                book.setTakasStatus(true);
                }
            bookListe.add(book);
        }        
        }catch(SQLException ex)
        {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }         
    }
    public void updateBookSwap(String[] parameter)
    {
    Statement st=null;
    try
    {
    st=connect.createStatement();
        for(String book:parameter)
        {
        st.execute("update kitaplar set takasdurum=1 where id='"+Integer.parseInt(book)+"'");//takas durum1 yapar            
        }    
    }catch(SQLException ex)
    {
    Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
    }
    }
    
    public void SelectSwapBook()//index.jsp sayfasında listelenecek metod
    {
    Statement st=null;
        try
        {
            st=connect.createStatement();
            ResultSet set=st.executeQuery("select *from kitaplar where takasdurum=1 AND takasonay is NULL");
                while(set.next())
                {
                Book book=new Book();
                int book_id=Integer.parseInt(set.getString("id"));
                String proid=set.getString("proid");            
                String adi=set.getString("adi");
                String kategori=set.getString("kategori");
                String yazar=set.getString("yazar");
                book.setId(book_id);
                book.setProid(Integer.valueOf(proid));
                book.setAdi(adi);
                book.setKategori(kategori);
                book.setYazar(yazar);
                swapbook.add(book);
                }
                set.close();                
        }catch(SQLException ex)
        {
        Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void BookInformation(int id) throws SQLException//profil sayfasında kitap kontrolü gerçekleştirme
    {        
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from kitaplar where id='"+id+"'");
        set.next();
                String proid=set.getString("proid");            
                String adi=set.getString("adi");
                String kategori=set.getString("kategori");
                String yazar=set.getString("yazar"); 
                String yorum=set.getString("yorum");
                boolean satilikStatus=set.getBoolean("satilikdurum");
                
                bookKitapBilgi.setId(id);
                bookKitapBilgi.setProid(Integer.parseInt(proid));
                bookKitapBilgi.setAdi(adi);
                bookKitapBilgi.setKategori(kategori);
                bookKitapBilgi.setYazar(yazar);
                bookKitapBilgi.setYorum(yorum);
                bookKitapBilgi.setSatilikdurum(satilikStatus);
                set.close();               
    }    
    public void SelectPerson(int id) throws SQLException
    {
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from user where id="+id+"");
        set.next();
        String adsoyad=set.getString("adsoyad");
        String okul=set.getString("okul");
        String cinsiyet=set.getString("cinsiyet");
        String avatar=set.getString("avatar");
        String bolum=set.getString("bolum");
        String dogum=set.getString("dogumtarih");
        person=new Person();
        person.setAdsoyad(adsoyad);
        person.setOkul(okul);
        person.setBolum(bolum);
        person.setDogumtarih(Date.valueOf(dogum));
        person.setCinsiyet(cinsiyet);
        person.setAvatar(avatar);
        set.close();        
    }
    public void takasRequest(int kitapSahib,int kitap_id,int istek_sahibi,String kitapadi) throws SQLException
    {
        try
        {
        Statement st=connect.createStatement();
        st.execute("insert into takaslar(kitapsahibi,kitapid,kitapadi,isteksahibi) values('"+kitapSahib+"','"+kitap_id+"','"+kitapadi+"','"+istek_sahibi+"')");        
        }catch(Exception e)
        {
        e.printStackTrace();
        }                
    }
    public void takasCount(int id) throws SQLException
    {
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from takaslar where kitapsahibi='"+id+"' and viewdurum=0");
        while(set.next())
        {
            takascount++;
        }
        set.close();         
    }    
    public void takasView(int id) throws SQLException//takas isteklerinin gösterilme metodu
    {
    Statement st=connect.createStatement();
    ResultSet set=st.executeQuery("select *from takaslar where kitapsahibi="+id+" and viewdurum=0");
        while(set.next())
        {
            SwapView swapview=new SwapView();         
            int kitapid=set.getInt("kitapid");
            int kitapsahibi=id;
            //int swapid=set.getInt("id");
            int isteksahibi=set.getInt("isteksahibi");
            String kitapadi=set.getString("kitapadi");
            swapview.setSwapid(set.getInt("id"));
            swapview.setIstekSahibi(isteksahibi);
            swapview.setKitapSahibi(kitapsahibi);
            swapview.setKitapid(kitapid);
            swapview.setKitapadi(kitapadi);
            listSwapView.add(swapview);
        }
            set.close();            
    }
    public void TakasGonderenInformation(int id) throws SQLException//takas isteklerini gönderen herkes ad soyad bilgileri
    {
   
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from user where id="+id+"");        
        while(set.next())
        {            
            takasGonderenString.add("Adı :"+set.getString("adsoyad")+ " bulunduğu konum :"+set.getString("okul")+" ve bölüm ,"+set.getString("bolum"));            
        }
        set.close();        
    }    
    public void MessageSend(int swapid,int kitapid,int mesajAl,int kitapsahip) throws SQLException//mesajın kime yollanacağı gelen id kitapid 'si/Whom is message send?
    {
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select kitaplar.adi,user.adsoyad from kitaplar INNER JOIN user on kitaplar.id='"+kitapid+"' and user.id='"+kitapsahip+"'");
        set.next();
        String kitapadi=set.getString("adi");
        String kitapsahibi=set.getString("adsoyad");
        String mesaj=kitapadi+" adlı kitabımız "+kitapsahibi+" tarafından takas isteğiniz onaylanmışstır.";        
        st.execute("insert into mesajlar(mesajsahibi,mesajatan,mesaj) values('"+mesajAl+"','"+kitapsahip+"','"+mesaj+"')");
        st.execute("update takaslar set viewdurum=1 where id='"+swapid+"'");
        set.close();
        
    }    
    public void selectPersonName(int id) throws SQLException
    {
        
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from user where id="+id+"");
        while(set.next())
        { 
            mesajwhomname.add(set.getString("adsoyad"));
        }
        set.close();
    }    
    public void MessageView(int userid) throws SQLException
    {
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select mesaj,mesajatan from mesajlar where mesajsahibi="+userid+"");
        while(set.next())
        {
            String mesaj="";            
            mesaj=set.getString("mesaj");           
            mesajlar.add(mesaj);    
            messagewhom.add(set.getInt("mesajatan"));
            selectPersonName(set.getInt("mesajatan"));
        }
        set.close();
    }    
    public void MessageCount(int userid) throws SQLException
    {
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from mesajlar where mesajsahibi='"+userid+"' and viewstatus=1");
        while(set.next())
        {
            messageCount++;            
        }
        set.close(); 
    }    
    public void chatSend(int mesajalan,int mesajatan,String mesaj) throws SQLException
    {
        Statement st=connect.createStatement();
        st.execute("insert into mesajlar(mesajsahibi,mesajatan,mesaj) values('"+mesajalan+"','"+mesajatan+"','"+mesaj+"')");
        st.close();
    }    
    public void UniversityBooks(String okuladi,String proid) throws SQLException
    {
        swapbook.clear();
        Statement st=connect.createStatement();
        int id=Integer.parseInt(proid);
        ResultSet set=st.executeQuery("select id from user where okul='"+okuladi+"' and id !='"+id+"'");        
        while(set.next())
        {
            universityFriends.add(set.getInt("id"));//aynı okuldaki kişilerin ID'si                       
        }        
        set.close();        
        
        int sayac=0;
        
        for(int s=0;s<universityFriends.size();s++)
        {
                ResultSet set_2=st.executeQuery("select id,adi,kategori,yazar from kitaplar where proid='"+universityFriends.get(s)+"'");            
                    while(set_2.next())
                    {            
                        Book book=new Book();
                        book.setId(set_2.getInt("id"));
                        book.setAdi(set_2.getString("adi"));
                        book.setKategori(set_2.getString("kategori"));
                        book.setYazar(set_2.getString("yazar"));                        
                        swapbook.add(book);
                    }
                set_2.close();
        }  
    }
    public void Message(int id) throws SQLException
    {
        int Count=0;
        //mesajwhomname.clear();
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select mesajid,viewstatus,mesajatan from mesajlar where mesajsahibi='"+id+"' group by  mesajatan");
        mesajlar.clear();
        while(set.next())
        {            
           //   mesajlar.add(set.getString("adsoyad"));
                mesajlar.add(set.getString("mesajatan"));
                selectPersonName(set.getInt("mesajatan"));
                mesajId.add(set.getInt("mesajid"));
                mesajyollayan.add(set.getInt("mesajatan"));       
        }        
        set.close();              
        for (Integer mesajyollayan1 : mesajyollayan) //for(int s=0;s<mesajyollayan.size();s++) en sonunki durum
        {
            int mesajsayici=0;
            ResultSet mesajState = st.executeQuery("select viewstatus from mesajlar where mesajatan='" + mesajyollayan1 + "'");
            while(mesajState.next())
            {
                int Status=mesajState.getInt("viewstatus");
                
                if(Status==1)
                {
                    mesajsayici++;
                }

            }
            if(mesajsayici>=1)
                {
                    personMesajStatus.add(Boolean.TRUE);
                }
            else if(mesajsayici==0)
            {
                personMesajStatus.add(Boolean.FALSE);
            }
            mesajState.close();
        }
    }
        public void MessageUpdate(int id) throws SQLException
        {
            Statement st=connect.createStatement();
            st.execute("update mesajlar set viewstatus=0 where mesajatan='"+id+"'");
            st.close();
        }
        public void mesajAtan(int id) throws SQLException
        {
            Statement st=connect.createStatement();
            ResultSet set=st.executeQuery("select adsoyad from user where id='"+id+"'");
            set.next();
            mesajAtan=set.getString("adsoyad");
            set.close();
        }
        public void MesajV(int mesajSahibi,int mesajAtan) throws SQLException
        {
            Statement st=connect.createStatement();
            ResultSet set=st.executeQuery("select mesaj from mesajlar where mesajsahibi='"+mesajSahibi+"' and mesajatan='"+mesajAtan+"'");
            while(set.next())
            {
                mesajViewer.add(set.getString("mesaj"));
            }
            set.close();        
        }   
        public String SelectPersonId(String email) throws SQLException
        {
            String return_Email;
            Statement st=connect.createStatement();
            ResultSet set=st.executeQuery("select id from user where email='"+email+"'");
            set.next();
            return_Email=set.getString("id");            
            set.close();
            return return_Email;
        }
        public boolean MailControl(String email) throws SQLException//üyeolan kullanıcının email adresi veritabanında varmı
        {
            //eger email adresi bulunursa false döndürecek
            boolean status=true;
            Statement st=connect.createStatement();
            ResultSet set=st.executeQuery("select email from user");
            while(set.next())
            {
                if(email.equals(set.getString("email")))
                {
                    status=false;
                }                
            }
            
            if(status==false)
            {
                set.close();
                return false;
                
            }
            else
            {
                set.close();
                return true;
            }
            
        }
        
        public void SatilikKitapEkle(int kitapID,String ad,String fiyat) throws SQLException//Satılık olarak işaretleme
        {
            Statement st=connect.createStatement();
            st.execute("insert into satilikbook(kitapID,kitapAD,fiyat) values('"+kitapID+"','"+ad+"','"+fiyat+"TL"+"')");
            st.close();
            SatilikStatusOnay(kitapID);
        }
        public void SatilikStatusOnay(int ID) throws SQLException//kitaplar tablosunda satılık durumu 1 işaretlenir
        {
            Statement st=connect.createStatement();
            st.executeUpdate("update kitaplar set satilikdurum=1 where id='"+ID+"'");            
            st.close();
                    
        }
    //mesajAlan database de kitaplar takasonay alanına yazılacak
    public void updateBookSwapOK(int parameter,int mesajAlan) throws SQLException//takas isteği onaylandıktan sonra takasın listeden çıkması gerek.
    {
    Statement st=null;
    try
    {
    st=connect.createStatement();

        st.execute("update kitaplar set takasdurum=0 where id="+parameter+"");//takas durum1 yapar            
        st.execute("update kitaplar set takasonay="+mesajAlan+" where id="+parameter+"");//takas durum1 yapar
    }catch(SQLException ex)
    {
    Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
    }
    st.close();
    }
    
    public boolean kitapCountControl(int proID) throws SQLException
    {
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from kitaplar where proid="+proID+""); 
        set.last();        
        int kitapSayisi=set.getRow();
        if(kitapSayisi>=4)//kitap sayısı 4 ten küçük olmalı
        {
            kitapCountControl=true;//kitapControlCount 4 ten büyükse Control devreye girecek true oluacak
        }
        return kitapCountControl;
    }
    
    public void selectSatilikBook() throws SQLException
    {
        Statement st=connect.createStatement();
        ResultSet set=st.executeQuery("select *from satilikbook");
        int ID;
        int kitapID;
        String kitapAd;
        String fiyat;
        this.satiliBookListe=new ArrayList<SatilikBook>();
            while(set.next())
            {
                ID=set.getInt("id");
                kitapID=set.getInt("kitapID");
                kitapAd=set.getString("kitapAD");
                fiyat=set.getString("fiyat");
                SatilikBook satilikBook=new SatilikBook();
                
                satilikBook.setId(ID);
                satilikBook.setKitapID(kitapID);
                satilikBook.setAdi(kitapAd);
                satilikBook.setFiyat(fiyat);
                satiliBookListe.add(satilikBook);                
            }
            
       set.close();
       st.close();
        
    }
    
}