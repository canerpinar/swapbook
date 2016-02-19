<%@page import="pck.database.Database"%>
<%@page import="pck.Bean.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Swap Book</title>
<meta name="keywords" content="kitap" />
<meta name="description" content="Kitap Paylaştıkça Güzel...." />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="jquery/scripts.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
</head>
<%
Session oturum=new Session(request);
HttpSession req=oturum.getHttpSession();
%>
<body>
<div id="templatemo_container">

      <div id="templatemo_header">
     <%
    if(req.getAttribute("session_id")==null)
    {
    %>
      <form action="login.jsp" class="form" method="post" id="userLogin">
			<p style="float:left">
                            <input class="input" name="email" onblur="if (value =='') {value = 'Kullanıcı adı'}" onfocus="if (value == 'Kullanıcı adı') {value =''}" type="text" value="Kullanıcı adı" id="kullaniciadi" />
			
                            <input class="input" name="sifre2" onblur="if (value =='') {value = 'Şifre'}" onfocus="if (value == 'Şifre') {value =''}" type="password" value="Şifre" id="sifre2" /> 			  
      	
			</p><button class="buton" type="submit">Giriş Yap </button>
	</form>
                        <div id="uyeol"><a href="uyeol.jsp">Üye Ol</a></div>
                        <div id="sifremiunuttum"><a href="sifremiunuttum.jsp">Şifremi Unuttum !</a></div>
   <%  
    }
    else
    {
        try
        {
    %>
    <div>SwapBook'a hosgeldiniz,<a href="profil.jsp"> <%=req.getAttribute("session_name").toString() %></a><br/>
        <a href="logout.jsp">Oturumunuzu sonlandıralım mı?</a>
    </div>
    <%
        }
        catch(Exception e)
        {
        response.sendRedirect("exception.jsp");
        }
    }
    %>
  </div> 
	<!-- end of header -->

	<div id="templatemo_top_panel">
    
    	<div id="templatemo_menu">
            <ul>
                <li><a href="index.jsp" class="current">SwapBOOK.Net Bilgi</a></li>
                <li><a href="#">Biz Kimiz ?</a></li>               
                <li><a href="index.jsp">SwapBOOK'da Bugün</a></li>                
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
  <div class="arama">
      
                        <ul>
			<li><a class="current" title="Tüm Takas Listesi" href="index.jsp?takaslist=true">Tüm Takas Listesi </a></li>
			<li><a class="current" title="Tüm Satış Listesi" href="index.jsp?satislist=true">Tüm Satış Listesi</a></li>									
			</ul>
						
			<form action="#" class="formara" method="post">
			<p style="float:left;">
			<input class="input" name="sifre2" onblur="if (value =='') {value = 'Yazar & Kitap Adı Ara'}" onfocus="if (value == 'Yazar & Kitap Adı Ara') {value =''}" type="text" value="Yazar & Kitap Adı Ara" /> 			  
      	
			</p><button class="buton" type="submit">BUL</button>
	</form>	
</div>	  
	<!--end liste paneli-->
    <div id="templatemo_content">
        <div id="template_content_div_index" onload="deneme()">
  <%
    if(request.getParameter("satislist")==null)//satilik list true olmadıgı sürece takas kitapları
    {
                    try
                {
              if(req.getAttribute("session_name")!=null)
              {
                String connect=request.getServletContext().getInitParameter("connection");
                String user=request.getServletContext().getInitParameter("User");
                String password=request.getServletContext().getInitParameter("Password");
                String driver=request.getServletContext().getInitParameter("Driver");
                Class.forName(driver);
                Database data=new Database();
                data.getConnection(connect, user, password);
                data.SelectSwapBook();
                int sayac=0;
                while(sayac<data.swapbook.size())
                    {
                        data.SelectPerson(data.swapbook.get(sayac).getProid());
              %>


                  <div class="column_w220">  
                       <div id="products">
                                                                    <div class="product">
                                                                        <a href="kitapbilgi.jsp?id=<%=data.swapbook.get(sayac).getId() %>" title="Product 1">
                                                                                <span class="title"><%=data.swapbook.get(sayac).getAdi() %></span>
                                                                                    <img src="images/product-img1.jpg" height="250" width="210" alt="Product Image 1" />
                                                                                    <span class="number"><%=data.swapbook.get(sayac).getYazar() %></span>
                                                                                    <span class="price"><span>#</span><%=data.person.getAdsoyad() %> </span>	</a>
                                                                    </div>
                    </div>
                      </div>   

                    <%
                              sayac++;
                          }
                    }
                }
                catch(Exception e)
                {
                response.sendRedirect("index.jsp?status=false");

                }
    }
    
    

    
    if(request.getParameter("satislist")!=null)//satişlistesine tıklandıktan sonrası gerçekleşecek yada listelenecek
    {
        
                String connect=request.getServletContext().getInitParameter("connection");
                String user=request.getServletContext().getInitParameter("User");
                String password=request.getServletContext().getInitParameter("Password");
                String driver=request.getServletContext().getInitParameter("Driver");
                Class.forName(driver);
                Database data=new Database();
                data.getConnection(connect, user, password);
                data.selectSatilikBook();
                int satilikBookSayici=0;
        
        while(satilikBookSayici<data.satiliBookListe.size())
        {
        %>
                    <div class="column_w220">  
                        <div id="products">
                                                              <div class="product">
                                                                  <a href="kitapbilgi.jsp?id=<%=data.satiliBookListe.get(satilikBookSayici).getKitapID() %>" title="Product 1">
                                                                                <span class="title"><%=data.satiliBookListe.get(satilikBookSayici).getAdi() %></span>
                                                                                    <img src="images/product-img1.jpg" height="250" width="210" alt="Product Image 1" />
                                                                                    <span class="number"><%=data.satiliBookListe.get(satilikBookSayici).getFiyat() %></span>
                                                                                    	</a>
                                                                    </div>
                        </div>
                </div>
        
        <%
            
        satilikBookSayici++;        
        }
        
    }
    
    
        %>
        </div>
    </div> <!-- end of content -->
  
    <div id="home-boxes" style="font-family: arial;">
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



</div>
</body>
</html>