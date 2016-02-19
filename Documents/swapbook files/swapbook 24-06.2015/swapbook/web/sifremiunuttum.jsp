<%-- 
    Document   : sifremiunuttum
    Created on : Feb 2, 2015, 3:59:53 PM
    Author     : can
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Swap Book</title>
<meta name="keywords" content="kitap" />
<meta name="description" content="Kitap Paylaştıkça Güzel...." />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
</head>
<body>
<div id="templatemo_container">
  <div id="templatemo_header">
 
  	<form action="#" class="form" method="post">
			<p style="float:left">
			<input class="input" name="kullaniciadi" onblur="if (value =='') {value = 'Kullanıcı adı'}" onfocus="if (value == 'Kullanıcı adı') {value =''}" type="text" value="Kullanıcı adı" />
			
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
 
	  
	<!--end liste paneli-->
    <div id="sifremiunuttumduvar">
        	

		 <form action="#" class="formsifremiunuttum" method="post">
		
			
			 <input class="input" name="sifre2" onblur="if (value =='') {value = 'E-mail Giriniz !'}" onfocus="if (value == 'E-mail Giriniz !') {value =''}" type="text" value="E-mail Giriniz !" /> 			  
      	
			<button class="buton" type="submit">Gönder</button>
	</form>	
		    
		    
	   
    	<div class="cleaner"></div>
	
  </div> <!-- end of content -->
  
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
								<p>İletişim Açıklaması</p>
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

<div id="sabit">
   
   <div id="tem">
            <ul>
                <li><a href="#" class="current">Tüm Liste</a></li>
				<li><a href="#">My Friends Swap</a></li>
                <li><a href="#">My Listem</a></li>
                <li><a href="#">My Üniversitem</a></li>                
                
            </ul>
    </div> 
  </div>

</div>
</body>
</html>