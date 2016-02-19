<%-- 
    Document   : kitapbilgi
    Created on : Feb 2, 2015, 3:58:25 PM
    Author     : can
--%>

<%@page import="pck.Bean.Session"%>
<%@page import="pck.database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Swap Book</title>
<meta name="keywords" content="kitap" />
<meta name="description" content="Kitap Paylaştıkça Güzel...." />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="kitapbilgi.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="jquery/kitapbilgi.js"/>
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
      <%                            
          Session req=new Session(request);//kitap sahibi ile session aynı ise
          HttpSession oturum=req.getHttpSession();
      %>

      <div>SwapBook'a hosgeldiniz,<a href="profil.jsp"> <%=oturum.getAttribute("session_name").toString() %></a><br/>
        <a href="logout.jsp">Oturumunuzu sonlandıralım mı?</a>
        </div>      
  </div> 

	<!-- end of header -->

	<div id="templatemo_top_panel">
    	       
    	<div id="templatemo_menu">
            <ul>
                <li><a href="#" class="current">SwapBOOK.Net Bilgi</a></li>
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
    <%     
    String connect=request.getServletContext().getInitParameter("connection");
    String user=request.getServletContext().getInitParameter("User");
    String password=request.getServletContext().getInitParameter("Password");
    String driver =request.getServletContext().getInitParameter("Driver");
    Class.forName(driver);
    Database data=new Database();
    data.getConnection(connect, user, password);
    data.BookInformation(Integer.parseInt(request.getParameter("id")));
    data.SelectPerson(data.bookKitapBilgi.getProid());
    %>
	  
    <div id="kitapbilgiduvar">
  
		<div class="kitapresimdis">
		          <div id="kitapresim">
							<div class="product">
																
									<img src="images/product-img1.jpg" height="250" width="210" alt="Product Image 1" />
							
									   <a href="#" >	<span class="price"><span>#</span></span> </a>
							<!-- 		<div id="ryazar"><span>Yazan</span> Elif Şafak</div>  -->
									
							</div>
							<div id="resimalti">
					 	        <div id="ryazar"><span>Yazan  :</span><%=data.bookKitapBilgi.getYazar() %></div>
                                                        <div id="ryayinevi"><span>Adı : </span><%=data.bookKitapBilgi.getAdi() %></div>
							<div id="rdurum"><span>Kategori :</span><%=data.bookKitapBilgi.getKategori() %></div>
				                     	<div id="risbn"><span>Sahip Profil</span> <%=data.person.getAdsoyad() %></div>
							     		<div id="rbegen"><span>Üniversite</span> 	<a href="#" ><%=data.person.okul %></a> </div> 
									</div>
                  </div>
				
            		
      </div> 
        
      <div class="kitapbilgidis">  
	   <div id="kitapbilgi">
							<div class="product">
							
							<span class="yazaradi">Kitap</span>
        					   <span class="title"><%=data.bookKitapBilgi.getAdi() %></span>
									 
	<span class="metin"> 
            <p><span class="ozetbaslik"><%=data.bookKitapBilgi.getAdi() %></span>,<%=data.bookKitapBilgi.getYorum() %>  </p>         
        
    </span>
                                                   
                                                   
   
                                                   
                                                   
									
							</div>							
							<div id="kitapbutongrup">
                                                            <%
                                                            if(req.getHttpSession().getAttribute("session_name").toString().equals(data.person.getAdsoyad()))
                                                            {
                                                            %>
                                                            <div style="text-decoration: underline; font-family: Arial; color:#3399FF;">Kitap size ait.</div>
                                                            <%
                                                            }
                                                            else 
                                                            {
                                                                
                                                            %>
                                                            <div id="begenButton"><button id="butonbegen" type="submit">Beğen</button></div>
                                                            <div id="takasButton"><form method="POST" action="takasRequest?book=<%=data.bookKitapBilgi.getId() %>&id=<%=data.bookKitapBilgi.getProid() %>&adi=<%=data.bookKitapBilgi.getAdi() %>"><button id="butontakasla" type="submit">Takas'la</button></form></div>                                                          
                                                            <%
                                                            }
                                                            %>
							  
							</div>
                                                            
                                                                                                            	<span class="metin"> 

                                                            
                  </div>
                                                            
                                                            <div style="font-family: Arial;"><b><%=data.person.getAdsoyad() %> kimdir?</b></div>
                                                            
                   <div><img class="avatar" src="jpeg/<%=data.person.getAvatar() %>" width="50" height="50" alt="" /></div>
                   <div style="width: 100px; font-family: Arial;"><%=data.person.getAdsoyad() %></div>
                   <div style="font-family: Arial;"><%=data.person.getDogumtarih() %></div>
                   <div style="font-family: Arial;"><%=data.person.getOkul() %></div>
                   <div style="font-family: Arial;"><%=data.person.getBolum() %></div>
                   <%
                   if(Integer.parseInt(req.getHttpSession().getAttribute("session_id").toString())==data.bookKitapBilgi.getProid())
                   {
                   %>
                   <div style="text-decoration: underline; font-family: Arial; color:#3399FF;">Profil size ait.</div>
                   <%
                   }
                   else 
                   {
                   data.guvenStatus=true;
                   data.GuvenSayisi(data.bookKitapBilgi.getProid(),Integer.parseInt(req.getHttpSession().getAttribute("session_id").toString()));
                   %>
                   <div style="font-family: Arial; height: 60px; margin-top: 20px; "><div style="float: left; color: white;" id="GuvenSayisi">Güven Sayısı:<b><%=data.guvenenSayici%></b></div>
                       <div style="height: 40px; width: 110px;">
                       <%
                       if(data.guvenStatus!=false)
                       {
                       %>    
                       <input id="guvenilirlikButton" type="button" name="guven" value="Güvenilirlik Onay" onclick="Guvenilirlik(<%=data.bookKitapBilgi.getProid()%>,<%=req.getHttpSession().getAttribute("session_id").toString() %>)"></input>
                       <%
                       }
                       else
                       {
                               
                        %>
                        <div id="BegenilmisPro" style="text-decoration: underline; font-family: Arial; color:#3399FF;">Begenilmiş Profil</div>
                        <%
                               
                       }
                       %>
                       </div> 
                   </div>
                   <%
                   }
                   %>
                                                                                                                                                              
	  	  </div>     
    	<div class="cleaner"></div>
		
<div id="comments">
        <h2>Yorumlar</h2>
        <ul class="commentlist">
          <li class="comment_odd">
            <div class="author"><img class="avatar" src="images/avatar.gif" width="32" height="32" alt="" /><span class="name"><a href="#">Pitigum</a></span> <span class="wrote">Yetiş Şakiroğlu</span></div>
            <div class="submitdate"><a href="#">August 4, 2009 at 8:35 am</a></div>
            <p>Çok güzel kitaptır.</p>
          </li>
         
        </ul>
      </div>
      <h2>Yorum Yaz</h2>
      <div id="respond">
        <form action="#" method="post">
        <textarea name="comment" id="comment" cols="130%" rows="4"></textarea>
        <div id=""><button id="butonyorumgndr" type="submit">Gönder</button></div>
        </form>
	  
         </div>
		 <div class="cleaner"></div>
	</br>	
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



</div>

</body>
</html>