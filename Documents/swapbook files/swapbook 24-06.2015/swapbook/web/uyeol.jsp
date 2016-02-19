<%-- 
    Document   : uyeol
    Created on : Feb 2, 2015, 4:00:58 PM
    Author     : can
--%>





<%@page import="pck.Bean.Session"%>
<%@page import="pck.database.Database"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="pck.Bean.Person" %>
<%
    request.setCharacterEncoding("utf-8");
    String adsoyad=request.getParameter("adsoyad");
    String kullanici=request.getParameter("kullanici");
    String sifre=request.getParameter("sifre");
    String email=request.getParameter("email");
    String universite=request.getParameter("universite");
    String bolum=request.getParameter("universite_bolum");
    String cinsiyet=request.getParameter("cinsiyet");
    
  
    DateFormat format=new SimpleDateFormat("yyyy/mm/dd");
    Date date=null;
    java.sql.Date tarih=null;
    //request lerin boş olma durumu postback anı
    if(request.getParameter("dogum_gun")!=null && request.getParameter("dogum_ay")!=null&&request.getParameter("dogum_yil")!=null )    
        {
            String gun=request.getParameter("dogum_gun");
            String ay=request.getParameter("dogum_ay");
            String yil=request.getParameter("dogum_yil");            
            String zaman=yil+"/"+ay+"/"+gun;            
            date=format.parse(zaman);
            tarih=new java.sql.Date(date.getTime());
                
        }
    

    
%>
<!DOCTYPE html>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Swap Book</title>
<meta name="keywords" content="kitap" />
<meta name="description" content="Kitap Paylaştıkça Güzel...." />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
<script src="jquery/uyeolscript.js" type="text/javascript"></script>
</head>
<body>
<div id="templatemo_container">
  <div id="templatemo_header"> 
      <form action="login.jsp" class="form" method="post">
			<p style="float:left">
			<input class="input" name="email" onblur="if (value =='') {value = 'Kullanıcı adı'}" onfocus="if (value == 'Kullanıcı adı') {value =''}" type="text" value="Kullanıcı adı" />
			
			<input class="input" name="sifre2" onblur="if (value =='') {value = 'Şifre'}" onfocus="if (value == 'Şifre') {value =''}" type="text" value="Şifre" /> 			  
      	
			</p><button class="buton" type="submit">Giriş Yap </button>
	</form>
      <div id="uyeol"><a href="uyeol.jsp">Üye Ol</a></div>
      <div id="sifremiunuttum"><a href="sifremiunuttum.jsp">Şifremi Unuttum !</a></div>

  </div> 

	<!-- end of header -->

	<div id="templatemo_top_panel">
    
    	<div id="templatemo_menu">
            <ul>
                <li><a href="index.jsp" class="current">SwapBOOK.Net Bilgi</a></li>
                <li><a href="#">Biz Kimiz ?</a></li>                
                <li><a href="#">SwapBOOK'da Bugün</a></li>                
                <li><a href="#">İletişim</a></li>
            </ul>
	    </div> 
        
      <div id="templatemo_banner">
	
       <div id="topust">
	   
	   
	   </div>
		
		
      </div>
        
        <div id="template_rss_twitter">
        
        	<div class="section_rss_twitter twitter">
            	<a href="#">Takip Et <span>on Twitter</span></a>
            </div>
            
            <div class="margin_bottom_30"></div>
            
            <div class="section_rss_twitter rss">
            	<a href="#">Beğen <span>on Facebook</span></a>
            </div>
        </div>
        
    </div> <!-- end of top panel -->
  
  
  <!-- liste paneli -->
 
	  <div id="uyeolduvar">  
	<!--end liste paneli-->
  <div id="uye-ol">
	<span> Üye Olunuz ! </span>
        <form action="uyeol.jsp" class="formuyeol" method="post" id="formuyeol">
			<p>
                            <input style="float:left;" class="input" name="adsoyad" onblur="if (value =='') {value = 'Adın Soyadın'}" onfocus="if (value == 'Adın Soyadın') {value =''}" type="text" value="Adın Soyadın" id="adsoyad" /></p>

			<p>
			<input  style="float:left;" class="input" name="sifre" onblur="if (value =='') {value = 'Şifre'}" onfocus="if (value == 'Şifre') {value =''}" type="text" value="Şifre" id="sifre2" /></p>
			<p>
                            <input  class="input" name="tekrarsifre" onblur="if (value =='') {value = 'Tekrar Şifre'}" onfocus="if (value == 'Tekrar Şifre') {value =''}" type="text" value="Tekrar Şifre" id="sifretekrar" /></p>
			<p>
			<input style="float:left;" class="input" name="mail" onblur="if (value =='') {value = 'E-Posta'}" onfocus="if (value == 'E-Posta') {value =''}" type="text" value="E-Posta"/></p>
			
					<p>
                                            <input class="input" name="mailtekrar" onblur="if (value =='') {value = 'Tekrar E-Posta'}" onfocus="if (value == 'Tekrar E-Posta') {value =''}" type="text" value="Tekrar E-Posta"/></p>
			
				<p>Üniversite : </p>
			<p style="float:left;" >
        <select name="universite" id="universite_adi" aria-label="Gün" class="dtarih">
          <option value="-1">Üniversite</option>
          <option value="Abant İzzet Baysal Üniversitesi">Abant İzzet Baysal Üniversitesi</option> 
          <option value="Abdullah Gül Üniversitesi">Abdullah Gül Üniversitesi</option>
          <option value="Adana Bilim ve Teknoloji Üniversitesi">Adana Bilim ve Teknoloji Üniversitesi</option> 
          <option value="Adıyaman Üniversitesi">Adıyaman Üniversitesi</option> 
          <option value="Adnan Menderes Üniversitesi">Adnan Menderes Üniversitesi</option> 
          <option value="Afyon Kocatepe Üniversitesi">Afyon Kocatepe Üniversitesi</option> 
          <option value="Ağrı İbrahim Çeçen Üniversitesi">Ağrı İbrahim Çeçen Üniversitesi</option> 
          <option value="Ahi Evran Üniversitesi">Ahi Evran Üniversitesi</option>
          <option value="Akdeniz Üniversitesi">Akdeniz Üniversitesi</option>
          <option value="Aksaray Üniversitesi">Aksaray Üniversitesi</option>
          <option value="Amasya Üniversitesi">Amasya Üniversitesi</option>
          <option value="Anadolu Üniversitesi">Anadolu Üniversitesi</option>
          <option value="Ankara Üniversitesi">Ankara Üniversitesi</option>
          <option value="Ardahan Üniversitesi">Ardahan Üniversitesi</option>
          <option value="Artvin Çoruh Üniversitesi">Artvin Çoruh Üniversitesi</option>
          <option value="Atatürk Üniversitesi">Atatürk Üniversitesi</option>
          <option value="Balıkesir Üniversitesi">Balıkesir Üniversitesi</option>    
          <option value="Bartın Üniversitesi">Bartın Üniversitesi</option>
          <option value="Batman Üniversitesi">Batman Üniversitesi</option>
          <option value="Bayburt Üniversitesi">Bayburt Üniversitesi</option>
          <option value="Bilecik Şeyh Edebali Üniversitesi">Bilecik Şeyh Edebali Üniversitesi</option>
          <option value="Bingöl Üniversitesi">Bingöl Üniversitesi</option>
          <option value="Bitlis Eren Üniversitesi">Bitlis Eren Üniversitesi</option>
          <option value="Boğaziçi Üniversitesi">Boğaziçi Üniversitesi</option>
          <option value="Bozok Üniversitesi">Bozok Üniversitesi</option>
          <option value="Bursa Teknik Üniversitesi">Bursa Teknik Üniversitesi</option>
          <option value="Bülent Ecevit Üniversitesi">Bülent Ecevit Üniversitesi</option>
          <option value="Celal Bayar Üniversitesi">Celal Bayar Üniversitesi</option> 
          <option value="Cumhuriyet Üniversitesi">Cumhuriyet Üniversitesi</option>
          <option value="Çanakkale Onsekiz Mart Üniversitesi">Çanakkale Onsekiz Mart Üniversitesi</option> 
          <option value="Çankırı Karatekin Üniversitesi">Çankırı Karatekin Üniversitesi</option> 
          <option value="Çukurova Üniversitesi">Çukurova Üniversitesi</option> 
          <option value="Afyon Kocatepe Üniversitesi">Deniz Harp Okulu</option> 
          <option value="Dicle Üniversitesi">Dicle Üniversitesi</option> 
          <option value="Dokuz Eylül Üniversitesi">Dokuz Eylül Üniversitesi</option>
          
          <option value="Dumlupınar Üniversitesi">Dumlupınar Üniversitesi</option>
          <option value="Düzce Üniversitesi">Düzce Üniversitesi</option>
          <option value="Ege Üniversitesi">Ege Üniversitesi</option>
          <option value="Erciyes Üniversitesi">Erciyes Üniversitesi</option>
          <option value="Erzincan Üniversitesi">Erzincan Üniversitesi</option>
          <option value="Erzurum Teknik Üniversitesi">Erzurum Teknik Üniversitesi</option>
          <option value="Eskişehir Osmangazi Üniversitesi">Eskişehir Osmangazi Üniversitesi</option>
          <option value="Fırat Üniversitesi">Fırat Üniversitesi</option>
          <option value="Galatasaray Üniversitesi">Galatasaray Üniversitesi</option>    
          <option value="Gazi Üniversitesi">Gazi Üniversitesi</option>
          <option value="Gaziantep Üniversitesi">Gaziantep Üniversitesi</option>
          <option value="Gaziosmanpaşa Üniversitesi">Gaziosmanpaşa Üniversitesi</option>
          <option value="Gebze Yüksek Teknoloji Enstitüsü">Gebze Yüksek Teknoloji Enstitüsü</option>
          <option value="Giresun Üniversitesi">Giresun Üniversitesi</option>
          <option value="Gümüşhane Üniversitesi">Gümüşhane Üniversitesi</option>
          <option value="Hacettepe Üniversitesi">Hacettepe Üniversitesi</option>
          <option value="Hakkari Üniversitesi">Hakkari Üniversitesi</option>
          <option value="Harran Üniversitesi">Harran Üniversitesi</option>
          
          
          
          <option value="Hitit Üniversitesi">Hitit Üniversitesi</option>
          <option value="Iğdır Üniversitesi">Iğdır Üniversitesi</option>
          <option value="İnönü Üniversitesi">İnönü Üniversitesi</option>
          <option value="İstanbul Medeniyet Üniversitesi">İstanbul Medeniyet Üniversitesi</option>
          <option value="İstanbul Üniversitesi">İstanbul Üniversitesi</option>
          
          <option value="İstanbul Teknik Üniversitesi">İstanbul Teknik Üniversitesi</option>
          <option value="İzmir Kâtip Çelebi Üniversitesi">İzmir Kâtip Çelebi Üniversitesi</option>
          <option value="İzmir Yüksek Teknoloji Enstitüsü">İzmir Yüksek Teknoloji Enstitüsü</option>
          <option value="Kafkas Üniversitesi">Kafkas Üniversitesi</option>
          <option value="Kahramanmaraş Sütçü İmam Üniversitesi">Kahramanmaraş Sütçü İmam Üniversitesi</option>
          
          <option value="Karabük Üniversitesi">Karabük Üniversitesi</option>
          <option value="Karadeniz Teknik Üniversitesi">Karadeniz Teknik Üniversitesi</option>
          <option value="Karamanoğlu Mehmetbey Üniversitesi">Karamanoğlu Mehmetbey Üniversitesi</option>
          <option value="Kastamonu Üniversitesi">Kastamonu Üniversitesi</option>
          <option value="Kırıkkale Üniversitesi">Kırıkkale Üniversitesi</option>
          
          <%-- --%>  
          <option value="Kırklareli Üniversitesi">Kırklareli Üniversitesi</option>
          <option value="Kilis 7 Aralık Üniversitesi">Kilis 7 Aralık Üniversitesi</option>
          <option value="Kocaeli Üniversitesi">Kocaeli Üniversitesi</option>
          <option value="Necmettin Erbakan Üniversitesi">Necmettin Erbakan Üniversitesi</option>
          <option value="Mardin Artuklu Üniversitesi">Mardin Artuklu Üniversitesi</option>
          
          <option value="Marmara Üniversitesi">Marmara Üniversitesi</option>
          <option value="Mehmet Akif Ersoy Üniversitesi">Mehmet Akif Ersoy Üniversitesi</option>
          <option value="Mersin Üniversitesi">Mersin Üniversitesi</option>
          <option value="Mimar Sinan Güzel Sanatlar">Mimar Sinan Güzel Sanatlar</option>
          <option value="Muğla Üniversitesi">Muğla Üniversitesi</option>
          
          <%-- --%>  
          <option value="Mustafa Kemal Üniversitesi">Mustafa Kemal Üniversitesi</option>
          <option value="Muş Alparslan Üniversitesi">Muş Alparslan Üniversitesi</option>
          <option value="Namık Kemal Üniversitesi">Namık Kemal Üniversitesi</option>
          <option value="Nevşehir Hacı Bektaş Veli Üniversitesi">Nevşehir Hacı Bektaş Veli Üniversitesi</option>
          <option value="Niğde Üniversitesi">Niğde Üniversitesi</option>
          
          <option value="Ondokuz Mayıs Üniversitesi">Ondokuz Mayıs Üniversitesi</option>
          <option value="Ordu Üniversitesi">Ordu Üniversitesi</option>
          <option value="Orta Doğu Teknik Üniversitesi">Orta Doğu Teknik Üniversitesi</option>
          <option value="Osmaniye Korkut Ata Üniversitesi">Osmaniye Korkut Ata Üniversitesi</option>
          <option value="Pamukkale Üniversitesi">Pamukkale Üniversitesi</option>
          
          <%-- --%>  
          <option value="Polis Akademisi">Polis Akademisi</option>
          <option value="Recep Tayyip Erdoğan Üniversitesi">Recep Tayyip Erdoğan Üniversitesi</option>
          <option value="Sakarya Üniversitesi">Sakarya Üniversitesi</option>
          <option value="Selçuk Üniversitesi">Selçuk Üniversitesi</option>
          <option value="Siirt Üniversitesi">Siirt Üniversitesi</option>
          
          <option value="Sinop Üniversitesi">Sinop Üniversitesi</option>
          <option value="Süleyman Demirel Üniversitesi">Süleyman Demirel Üniversitesi</option>
          <option value="Şırnak Üniversitesi">Şırnak Üniversitesi</option>
          <option value="Trakya Üniversitesi">Trakya Üniversitesi</option>
          <option value="Tunceli Üniversitesi">Tunceli Üniversitesi</option>          
          
          <%-- --%>  
          <option value="Türk Alman Üniversitesi">Türk Alman Üniversitesi</option>
          <option value="Türkiye Sağlık Bilimleri Üniversitesi">Türkiye Sağlık Bilimleri Üniversitesi</option>
          <option value="Uludağ Üniversitesi">Uludağ Üniversitesi</option>
          <option value="Uşak Üniversitesi">Uşak Üniversitesi</option>
          <option value="Yalova Üniversitesi">Yalova Üniversitesi</option>
          
          <option value="Yıldız Teknik Üniversitesi">Yıldız Teknik Üniversitesi</option>
          <option value="Yıldırım Beyazıt Üniversitesi">Yıldırım Beyazıt Üniversitesi</option>
          <option value="Yüzüncü Yıl Üniversitesi">Yüzüncü Yıl Üniversitesi</option>
                           
        </select>
		</p>
		
			<p style="margin-left:235px;">
                            <select name="universite_bolum" id="universite_bolum" aria-label="Gün" class="dtarih">
          <option value="-1">Üniversite Bölüm</option>
          <option value="karabük">Bilgisayar Öğretmenliği</option>
          <option value="Ankara">Avukatlık</option>
        
        </select>
		</p>
			<p>Doğum Tarihin : </p>
			<p>
                            <select name="dogum_gun" id="dogum_gun" aria-label="Gün" class="dtarih">
          <option value="-1">Gün:</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
        </select>
          
          <select name="dogum_ay" id="dogum_ay" aria-label="Ay" class="dtarih">
          <option value="-1">Ay:</option>
          <option value="1">Ocak</option>
          <option value="2">Subat</option>
          <option value="3">Mart</option>
          <option value="4">Nisan</option>
          <option value="5">Mayis</option>
          <option value="6">Haziran</option>
          <option value="7">Temmuz</option>
          <option value="8">Agustos</option>
          <option value="9">Eylül</option>
          <option value="10">Ekim</option>
          <option value="11">Kasim</option>
          <option value="12">Aralik</option>
        </select>
                            <select name="dogum_yil" id="dogum_yil" aria-label="Yil" class="dtarih">
          <option value="-1">Yil:</option>
          <option value="2013">2013</option>
          <option value="2012">2012</option>
          <option value="2011">2011</option>
          <option value="2010">2010</option>
          <option value="2009">2009</option>
          <option value="2008">2008</option>
          <option value="2007">2007</option>
          <option value="2006">2006</option>
          <option value="2005">2005</option>
          <option value="2004">2004</option>
          <option value="2003">2003</option>
          <option value="2002">2002</option>
          <option value="2001">2001</option>
          <option value="2000">2000</option>
          <option value="1999">1999</option>
          <option value="1998">1998</option>
          <option value="1997">1997</option>
          <option value="1996">1996</option>
          <option value="1995">1995</option>
          <option value="1994">1994</option>
          <option value="1993">1993</option>
          <option value="1992">1992</option>
          <option value="1991">1991</option>
          <option value="1990">1990</option>
          <option value="1989">1989</option>
          <option value="1988">1988</option>
          <option value="1987">1987</option>
          <option value="1986">1986</option>
          <option value="1985">1985</option>
          <option value="1984">1984</option>
          <option value="1983">1983</option>
          <option value="1982">1982</option>
          <option value="1981">1981</option>
          <option value="1980">1980</option>
          <option value="1979">1979</option>
          <option value="1978">1978</option>
          <option value="1977">1977</option>
          <option value="1976">1976</option>
          <option value="1975">1975</option>
          <option value="1974">1974</option>
          <option value="1973">1973</option>
          <option value="1972">1972</option>
          <option value="1971">1971</option>
          <option value="1970">1970</option>
          <option value="1969">1969</option>
          <option value="1968">1968</option>
          <option value="1967">1967</option>
          <option value="1966">1966</option>
          <option value="1965">1965</option>
          <option value="1964">1964</option>
          <option value="1963">1963</option>
          <option value="1962">1962</option>
          <option value="1961">1961</option>
          <option value="1960">1960</option>
          <option value="1959">1959</option>
          <option value="1958">1958</option>
          <option value="1957">1957</option>
          <option value="1956">1956</option>
          <option value="1955">1955</option>
          <option value="1954">1954</option>
          <option value="1953">1953</option>
          <option value="1952">1952</option>
          <option value="1951">1951</option>
          <option value="1950">1950</option>
        </select>
			</p>
			<p>Cinsiyet : </p>
			<p><select name="cinsiyet" id="cinsiyet" aria-required="true" class="dtarih">
          <option value="0">Seç:</option>
          <option value="Kadin">Kadin</option>
          <option value="Erkek">Erkek</option>
      </select> </p>			
      <p><button class="buton gonder" type="submit" name="btnGonder" id="btnGonder">GÖNDER</button></p>
		</form>
                
                <jsp:useBean id="person" class="pck.Bean.Person" scope="session" type="Person"></jsp:useBean>
                    <jsp:setProperty name="person" property="adsoyad" value='<%=request.getParameter("adsoyad") %>' />                                                
                    <jsp:setProperty name="person" property="password" value='<%=request.getParameter("sifre") %>' /> 
                        <jsp:setProperty name="person" property="email" value='<%= request.getParameter("mail")%>' /> 
                        <jsp:setProperty name="person" property="okul" value='<%= request.getParameter("universite")%>' /> 
                        <jsp:setProperty name="person" property="bolum" value='<%= request.getParameter("universite_bolum")%>' />
                        <jsp:setProperty name="person" property="dogumtarih" value="<%=tarih%>"/>
                        <jsp:setProperty name="person" property="cinsiyet" value='<%= request.getParameter("cinsiyet")%>' />  
	</div>
		    <div class="cleaner"></div>
		    </div>
					  <div id="home-boxes">
						<!-- Begin Box -->
						<div class="box first">
							<div class="box-title">
								<img src="images/box-img1.png" alt="First Box Image" width="54" height="32" />
								<h4>Gizlilik Gözleşmesi</h4>
                                                                
								<div class="cl">&nbsp;</div>
						  </div>
							<div class="box-entry">
								<p>Gizlilik sözleşmesi kısa açıklama.Gizlilik sözleşmesi kısa açıklama.Gizlilik sözleşmesi kısa açıklama.Gizlilik sözleşmesi kısa açıklama.</p>
								<p class="more"><a href="#" title="Devam">Devam</a></p>
							</div>
						</div>
						<!-- End Box -->
						<!-- Begin Box -->
						<div class="box">
							<div class="box-title">
								<img src="images/box-img2.png" alt="Second Box Image" width="50" height="32" />
								<h4>Üyelik Sözleşmesi</h4>
								<div class="cl">&nbsp;</div>
						  </div>
							<div class="box-entry">
								<p>Üyelik Sözleşmesi Kısa açıklama.Üyelik Sözleşmesi Kısa açıklama.Üyelik Sözleşmesi Kısa açıklama.Üyelik Sözleşmesi Kısa açıklama</p>
								<p class="more"><a href="#" title="Devam">Devam</a></p>
						  </div>
						</div>
						<!-- End Box -->
						<!-- Begin Box -->
						<div class="box">
							<div class="box-title">
								<img src="images/box-img3.png" alt="Third Box Image" width="50" height="32" />
								<h4>Swapbook.Net Nedir?</h4>
								<div class="cl">&nbsp;</div>
						  </div>
							<div class="box-entry">
								<p>Swapbook.net Nedir ? </p>
								<p class="more"><a href="#" title="Devam">Devam</a></p>
							</div>
						</div>
						<!-- End Box -->
						<!-- Begin Box -->
						<div class="box">
							<div class="box-title">
								<img src="images/box-img4.png" alt="Fourth Box Image" width="50" height="32" />
								<h4>İletişim</h4>
								<div class="cl">&nbsp;</div>
						  </div>
							<div class="box-entry">
								<p>İletişim Açıklaması
</p>
								<p class="more"><a href="#" title="Devam">Devam</a></p>
							</div>
						</div>
						<!-- End Box -->
	
	
	
    <div id="templatemo_footer">
	</br>
        Copyright © 2015 <a href="#"> Swapbook.com </a> | Designed by <a href="#"> Yetiş Şakiroğlu & Caner Pınar ( Can Dostum ) </a>
    </div> 
    <!-- end of footer -->    

</div> <!-- end of container -->
<%

if(request.getParameter("btnGonder")!=null)
{
response.setContentType("text/html; utf-8");
    ServletContext servletRequest=getServletContext();
    String connection=servletRequest.getInitParameter("connection");
    String user=servletRequest.getInitParameter("User");
    String password=servletRequest.getInitParameter("Password");
    String driver=servletRequest.getInitParameter("Driver");        
    Database data=new Database();
    Class.forName(driver);
    data.getConnection(connection, user, password);//burada mail kontrolü yapılması gerek
    boolean emailControl=data.MailControl(person.email);
    if(emailControl==true)
    {
    data.InsertPerson(person);//girilen mail database de varmı    
    Session ses=new Session(request);
    ses.createSession(person);
    request.getRequestDispatcher("profil.jsp").forward(request, response);        
    }
    if(emailControl!=true)
    {
        request.getRequestDispatcher("uyeol.jsp?deneme=denem").forward(request, response); 
    }
    
    
}
%>
</div>                
</body>
</html>