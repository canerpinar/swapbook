/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function ()
{
           function validateEmail(sEmail) {
            var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (filter.test(sEmail)) {
                return true;
            }
           else {
                return false;
            }
        }
   $("#formuyeol").submit(function ()
   {       
       
       //email kontrolü türkçe karakter

       //function bitişi
   
    var email=$("input[name=mail]").val();
    var emailTekrar=$("input[name=mailtekrar]").val();
    var adsoyad=$("input[name=adsoyad]").val();
    var sifre=$("input[name=sifre]").val();
    var sifreTekrar=$("input[name=tekrarsifre]").val();     
    var universite=$("#universite_adi option:selected").val();
    var universiteBolum=$("#universite_bolum option:selected").val();
    var dogumgun=$("#dogum_gun option:selected").val();    
    var dogumay=$("#dogum_ay option:selected").val();    
    var dogumyil=$("#dogum_yil option:selected").val();
    var cinsiyet=$("#cinsiyet option:selected").val();    
    if(adsoyad=='' || adsoyad=='Adın Soyadın')
    {
        alert('Adınızı Soyadınız kontrol ediniz.');
        return false;
    }
    else if(sifre=='' || sifre=='Şifre')
    {
        alert('Şifrenizi kontrol ediniz.');
        return false;
    }
    else if(sifre != sifreTekrar)
    {
        alert('Şifreleriniz eşleşmiyor.');
        return false;
    }
     else if(sifre.length<6)
     {
         alert('Şifreniz çok kısa.');
         return false;
     }     
     else if(email=='' || email=='E-Posta')
    {
        alert('Email kontrol ediniz.');
        return false;
    }
    else if(email != emailTekrar)
    {        
        alert('Emailiniz birbirinden farklı.');            
        return false;
    }
    else if(!validateEmail(email))
    {
        alert('Emaliniz geçersiz karakter içeriyor');
        return false;
    }
    else if(emailTekrar=='' || emailTekrar=='Tekrar E-Posta')
    {
        alert('Email tekrar giriniz.');
        return false;
    }        
    else if(universite==-1)
    {
        alert('Universitenizi kontrol ediniz');
        return false;
    }
   else if(universiteBolum==-1)
    {
        alert('Bölümüzü kontrol ediniz.');
        return false;
    }
    else if(dogumgun==-1 || dogumay==-1 || dogumyil==-1)
    {
        alert('Doğum tarihinizi kontrol ediniz');
        return false;
    }
    else if(cinsiyet==-1)
    {
        alert('Cinsiyetinizi kontrol ediniz');
        return false;
    }    
       else
    {
        return true;
    } 
   });
});