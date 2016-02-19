<%-- 
    Document   : profil
    Created on : Feb 2, 2015, 3:56:46 PM
    Author     : can
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pck.Bean.Book"%>
<%@page import="pck.Bean.Book"%>
<%@page import="java.sql.Connection"%>
<%@page import="pck.database.Database"%>
<%@page import="pck.Bean.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");  
Session oturum=new Session(request);
HttpSession req=oturum.getHttpSession();
%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
<script src="jquery/profilscript.js" type="text/javascript"></script>
</head>
 <%
            Database data=new Database();
            String connect=request.getServletContext().getInitParameter("connection");
            String user=request.getServletContext().getInitParameter("User");
            String password=request.getServletContext().getInitParameter("Password");
            String driver=request.getServletContext().getInitParameter("Driver");
            data.getConnection(connect, user, password);
            data.takasCount(Integer.parseInt(req.getAttribute("session_id").toString()));
            data.MessageCount(Integer.parseInt(req.getAttribute("session_id").toString()));
 %>                
<body>
<div id="templatemo_container">
  <div id="profil_ust">
  <div id="profil_ust_avatar">      
  <a title="Profil Resmi"><img class="avatar" src="jpeg/<%=req.getAttribute("session_avatar")%>" width="32" height="32" alt="" /></a>
  </div>
           <div id="profil_ust_nick">
               <form action="logout.jsp" method="post">
               <p><span>Welcome, </span><a href="profil.jsp" title="Pitigum"><%= req.getAttribute("session_name").toString() %></a></p>
               <button name="logout" class="butoncikis" type="submit">Çıkış</button></form>
    </div>
  </div> 
	<!-- end of header -->
	<div id="profil_panel">
	 <div id="profilyonet" style="display:none;">
	  <div id="profil_menu">
            <ul>
              <li><a href="#">Profil </a></li>                
                <li><a href="#">Mesajlar </a></li>
		<li><a href="#" >Kitap Ekle</a></li>
                 <li><a href="#" >Ayarlar</a></li>                
                 <li><a href="#" >Çıkış</a></li>     
            </ul>
	    </div></div>
	<div id="profil_panel_alt">
	     <div id="profil">
                 <form id="pro_change" method="POST" action="dene.jsp" enctype="multipart/form-data">
                     <input type="file" id="photo_upload" name="file_name" style="display: none;"/>
                     <a id="file_upload" title="Profil Resim"><img src="jpeg/<%=req.getAttribute("session_avatar")%>" id="profilresim"/></a>
                 </form>		         
        </div>
        <div id="profilbilgi_panel">
		          <div id="profilbilgi">
                              <a title="Pitigum">  <p class="style7"><%=req.getAttribute("session_name").toString() %></p>  </a>
                              <p class="style5"><%= req.getAttribute("session_date") %>/ <%=req.getAttribute("session_sex").toString() %></p>
                              <p class="style2"><%= req.getAttribute("session_scholl").toString() %></p>
                              <p class="style6"><%= req.getAttribute("session_bolum").toString() %> </p>				 
				  </div>   
      </div>
	  <div id="takasbilgimenu">
	  <a class="" title="Takas Kabul" href="profil.jsp?takasface=face"> <div id="kabultakas"> <div class="takassayi">10</div>   </div> </a>  
          <a class="" title="Gelen Takas" href="profil.jsp?gelentakas=takas">  <div id="gelentakas"><div class="takassayi"><%=data.takascount %></div></div> 	 </a> 
          <%
          boolean kitapCountControl=data.kitapCountControl(Integer.parseInt(req.getAttribute("session_id").toString()));
          if(kitapCountControl)
          {
          %>
          <div id="kitapekle" class="kitapControlDiv" title="En fazla 5 kitap ekleyebilirsiniz."></div>					
          <%
          }
          else
          {
          %>
          <a id="kitapekle_a" class="" title="Kitap Ekle" href="profil.jsp?kitapekle=kitapekle">  <div id="kitapekle"></div> 	 </a> 	
				
          <%
          }
          
          %>
                      
                                  <a class="" title="Mesajlar" href="profil.jsp?mesaj=mesaj">  <div id="mesaj"><div class="takassayi"><%=data.messageCount%></div></div> 	 </a>				 			        
	  </div>
	  </div>	  	  	  
    </div> <!-- end of top panel -->    
  <!-- liste paneli -->
  <div class="profilmenu">
						<ul>
                                                    <li><a  title="Takas Listesi" href="profil.jsp">Swap Listesi </a></li>
							<li><a title="Üniversity's Swaps" href="profil.jsp?universityswap=true">Üniversity's Swaps</a></li>	
							
                                                        <li><a href="index.jsp">Tüm Takastaki Kitapları Gör</a></li>
						</ul>
  </div>
	  
	<!--end liste paneli-->
    <div id="templatemo_content"> 
        

        
        
        <%
        if(request.getParameter("kitapekle")!=null)//kitap ekleme alanı
        {
        %>
                    <h2 style="color: #018C33;">Kitap Bilgilerini Giriniz.</h2>
            <form id="kitap_yukle" method="POST" action="kitapYukle">
                <div id="kitap_yukle_div" onload="kitap_Yukle()">
            <div style="float: left; color: #018C33; width: 100px; margin-top: 10px;">Kitap Adı:</div><input type="text" name="kitap_adi" style="margin-top: 10px; width: 170px;"/><br/>
                <div style="float: left; color: #018C33; width: 100px; margin-top: 10px;">Kitap Kategori:</div>
                <select name="kitap_kategori" id="kitap_kategori" style="margin-top: 10px; width: 170px;">
                    <option value="-1">Kategori Seçiniz.</option>
                    <option value="Felsefe">Felsefe</option>
                    <option value="Siyaset">Siyaset</option>
                    <option value="Ekonomi">Ekonomi</option>
                    <option value="Mühendislik">Mühendislik</option>
                    <option value="Roman">Roman</option>                     
                </select>
                <br/>
                <div style="float: left; color: #018C33; width: 100px; margin-top: 10px;">Yazar:</div><input type="text" name="kitap_yazar" style="margin-top: 10px; width: 170px;"/><br/>
                <div style="float: left; color: #018C33; width: 100px; margin-top: 10px;">Yorum yazabilirsiniz.</div><textarea id="bookYorum" name="kitap_yorum" rows="5" style="margin-top: 10px; width: 170px;"></textarea><br/>                             
                        <div style="width: 900px;"><input type="submit" value="Gönder"/></div>
                </div>
                </form>
        

         
        <%
        }
        else if(request.getParameter("universityswap")!=null)
        {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");        
            //div açılacak
            %>
            <div id="template_content_div"  onload="deneme()">  
            <%
            
            data.UniversityBooks(req.getAttribute("session_scholl").toString(),req.getAttribute("session_id").toString());
            
            
                                  
                %>
                
                
                <div><!-- üniversite arkadaş sayısı kadat dönmesi gerek a.q-->
                    <%=data.universityFriends.size() %>
                <%
                int kitapCount=0;
                    while(kitapCount<data.swapbook.size())
                    {
                        //aynı üniversitede ki arkadaşların kitapları listelenecek
                    %>
                <div class="column_w220">
                     <div id="products">
                                  <div class="product">
                                          <a href="kitapbilgi.jsp?id=<%=data.swapbook.get(kitapCount).getId() %>" title="Product 1">
                                          <span class="title"><%=data.swapbook.get(kitapCount).getAdi() %></span>
                                          <img src="images/product-img1.jpg" height="250" width="210" alt="Product Image 1" />
                                          <span class="number">Yazar: <%=data.swapbook.get(kitapCount).getYazar() %></span>
                                          <span class="price"><span>#</span><%=data.swapbook.get(kitapCount).getKategori() %></span>	</a>                                                        
                                    </div>
                            </div>            
                      </div>
                    
                    <%
                    kitapCount++;
                    }
                
                %>
                </div>
                <%  
                    //bundan sonra div kapanmalı
                    %>
            </div>
                    <%
                    
        }                
        else if(request.getParameter("takasface")!=null)        
        {
            %>
            <div>Takas Face</div>
            <%
        }
        
        
        
        
        else if(request.getParameter("gelentakas")!=null)//gelen takasların gösterileceği alan
        {
            int swapListSayac=0;
            data.takasView(Integer.parseInt(req.getAttribute("session_id").toString()));
            
            while(swapListSayac<data.takascount)
            {
                data.TakasGonderenInformation(data.listSwapView.get(swapListSayac).getIstekSahibi());//takas isteğini yapan
                %>
                <div style="color: black; width: 600px;">
                    <li>
                        <ul>
                            Takas gönderen :<%=data.takasGonderenString.get(swapListSayac) %> kitap <%=data.listSwapView.get(swapListSayac).getKitapadi() %>
                            <form method="POST" action="takasOnay?id=<%=data.listSwapView.get(swapListSayac).getKitapid() %>&mesajalan=<%=data.listSwapView.get(swapListSayac).getIstekSahibi() %>&kitapsahibi=<%=data.listSwapView.get(swapListSayac).getKitapSahibi() %>&swapid=<%=data.listSwapView.get(swapListSayac).getSwapid() %>">><input type="submit" value="Onayla">
                    </input></form>
                    </ul>
                    </li>                    
                </div>
                <%
            swapListSayac++;
            }            
        }
        else if(request.getParameter("mesaj")!=null)
        {
              int mesajCount=0;
            
            data.Message(Integer.parseInt(req.getAttribute("session_id").toString()));
            %>
            <div style="float: left; width: 900px;">
            <%
            while(mesajCount<data.mesajlar.size())
            {
                if(data.personMesajStatus.get(mesajCount)==true)
                {
            %>
            
            <div style="color:white; font-family: arial; float: left; width: 100px;"><a href="profil.jsp?mesajuser=<%=data.mesajlar.get(mesajCount) %>&mesajId=<%=data.mesajId.get(mesajCount) %>" style="color:white;" title="Yeni Mesaj"><%=data.mesajwhomname.get(mesajCount) %></a></div>
            
            <%
                }
                else if(data.personMesajStatus.get(mesajCount)!=true)
                {
                %>

                <div style="color:black; font-family: arial; float: left; width: 100px;"><a href="profil.jsp?mesajuser=<%=data.mesajlar.get(mesajCount) %>&mesajId=<%=data.mesajId.get(mesajCount) %>" style="color:black;"><%=data.mesajwhomname.get(mesajCount) %></a></div>

               <%
                
                }
                mesajCount++;
            }
            
            %>
            </div>
            <%
        }        
                else if(request.getParameter("mesajuser")!=null)
                {
                    
                    
                    data.Message(Integer.parseInt(req.getAttribute("session_id").toString()));
                    data.MessageUpdate(Integer.parseInt(request.getParameter("mesajuser")));
                    data.mesajAtan(Integer.parseInt(request.getParameter("mesajuser")));
                    data.MesajV(Integer.parseInt(req.getAttribute("session_id").toString()),Integer.parseInt(request.getParameter("mesajuser")) );
                    %>
                    <div style="color: black; font-family: verdana;"><b><%=data.mesajAtan %> Diyor ki.</b></div>
                    <%
                    int mesajViewer=0;
                    while(mesajViewer<data.mesajViewer.size())
                    {
                    %>
                    <div style="color: black; font-family: verdana;"><%=data.mesajViewer.get(mesajViewer) %></div>
                    <%
                        mesajViewer++;
                    }
                    %>
                    <div style="background-color: black; height: 2px;"></div>
                    <div style="color:black;">Mesajınızı buraya yazınız.</div>
                    <form id="mesajForm" action="takasOnay?mesajatan=<%=req.getAttribute("session_id").toString() %>&mesajalan=<%=request.getParameter("mesajuser") %>" method="POST">
                        <div><textarea id="mesajYaz" name="mesajYaz"></textarea></div>
                    <input type="submit" name="mesajGonder"></input></form>
                    <%
                }
        
                      
        else if(request.getParameter("mesajuser")==null && request.getParameter("universityswap")==null && request.getParameter("gelentakas")==null && request.getParameter("mesajgonder")==null && request.getParameter("gelentakas")==null && request.getParameter("kitapekle")==null && request.getParameter("mesaj")==null)//tüm kitap listesi
        {
        %>
        <div id="template_content_div"  onload="deneme()">            
        <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
            %>
            <form id="takas_Yap" action="kitapTakas" method="POST"><!--takas yapılacak kitaplar-->
            <%

            Class.forName(driver);
            data.getConnection(connect, user, password);
            data.SelectBook(Integer.valueOf(req.getAttribute("session_id").toString()));           
            int sayac=0;//while tamamlayıcısı
            //out.println(req.getAttribute("session_id").toString());            
            while(sayac<data.bookListe.size())
            {
                %> 
                <div class="column_w220">
		<div id="products">
			<div class="product">
                            <!-- kitap resminin tıklanması -->
                                    <span class="title"><%=data.bookListe.get(sayac).getAdi() %></span>
				<img src="images/product-img1.jpg" height="250" width="210" alt="Product Image 1" />
                                <span class="number">Yazar: <%=data.bookListe.get(sayac).getYazar() %></span>
                                <span class="price"><span>#</span><%=data.bookListe.get(sayac).getKategori() %></span>	
                                <%
                                if(!data.bookListe.get(sayac).isTakasStatus() && !data.bookListe.get(sayac).isSatilikdurum())
                                {
                                if(data.bookListe.get(sayac).getTakasOnay()!=0)//Eğer takas onaylandıysa takasOnay.java da db de kitabı okuyanın ID si var.
                                {
                                    %>
                                    <span style="color:black; position: relative; top: -80px; background-color: aqua; font-weight: bold;"><b>Okunuyor...</b></span>
                                
                                    <%
                                }else
                                {
                                        %>
                                        <span style="position: relative; top: -80px; color: black; font-weight: bold; background-color: aqua;"><a id="<%=data.bookListe.get(sayac).getId() %>" href="" class="mouseOver" style="height: 20px; background: aqua; color: black; font-weight: bold;">Satışa Çıkar</a></span>                                
                                        <span style="color:black; position: relative; top: -75px; background-color: aqua;"><a href="kitapTakas?takaslar=<%=data.bookListe.get(sayac).getId() %>" style="height: 20px; background: aqua; color: black; font-weight: bold;">Takasa Çıkar</a></span>
                                        <%
                                }
                                }
                                else
                                {
                                    if(data.bookListe.get(sayac).isSatilikdurum())
                                    {
                                        %>
                                        <span style="position: relative; top: -80px; color: green; font-weight: bold; background-color: aqua;">Kitabınız Satışta</span>
                                
                                        <%
                                    }
                                    else
                                    {
                                    %>
                                    <span style="color:black; position: relative; top: -80px; background-color: aqua; font-weight: bold;"><b>Şuan Takasta</b></span>
                                
                                    <%
                                    }                                                                    
                                } 
                                %>
			</div>
                        
                </div>            
                </div>
                <%
                sayac++;
            }
        
        %>
        
        </form>
   
        
        </div>
   
        <%        
        }
        %>

        </div>
  <!--
        
		<div class="column_w220">
		<div id="products">
							<div class="product">
								<a href="kitapbilgi.html" title="Product 1">
									<span class="title">Ustam Ve Ben</span>
									<img src="images/product-img1.jpg" height="250" width="210" alt="Product Image 1" />
									<span class="number">Yazar: Elif Şafak</span>
									<span class="price"><span>#</span>Pitigum</span>	</a>
							</div>
            </div>            
      </div>         
        -->
        
    
    					  <div id="home-boxes"  style="font-family: arial;">
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
    
<!--
home boxes alanı
-->
</div>
</body>
</html>