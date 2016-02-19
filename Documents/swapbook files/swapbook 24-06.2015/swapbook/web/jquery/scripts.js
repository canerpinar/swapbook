/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function ()
{
    var product_Count=0;
      $(function deneme()
       {
        //$("#takasOnayButon").css({display:"block"});
        $("html").find("div#products").each(function (){
            
            product_Count=product_Count+1;  
        });
        var yukseklik=Math.ceil((product_Count/4));
        yukseklik=yukseklik*365;
         $("#template_content_div_index").css({height:yukseklik});
         
       });
       
    
$("#userLogin").submit(function ()
{    
    var user=$("input[name=email]").val();
    var password=$("input[name=sifre2]").val();
    
    if(user==''|| user=='Kullanıcı adı')
    {
        alert('Kullanıcı adını kontrol ediniz.');
        return false;       
    }
    else if(password==''|| password=='Şifre')
    {
        alert('Şifrenizi kontrol ediniz.');
        return false;
    }});
    
    
    
});