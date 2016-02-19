/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function ()
{    
    //$("#photo_upload").css({display:none});
        $("#file_upload").click(function ()
        {
            $("#photo_upload").click();
            
       });  
       $("#photo_upload").change(function ()
       {           
           var conf=confirm("Resminizi kaydetmek istedinize emin misiniz?");
           if(conf==true)
           {
               $("#pro_change").submit();
           }
           else
           {
               return ;               
           }
           
       });
       $("#kitapekle_a").click(function ()
       {   
        kitap_Yukle();
       });
       var product_Count=0;
       $(function deneme()
       {
        //$("#takasOnayButon").css({display:"block"});
        $("html").find("div#products").each(function (){
            
            product_Count=product_Count+1;
            
            
        });
        var yukseklik=Math.ceil((product_Count/4));
        yukseklik=yukseklik*365;
         $("#template_content_div").css({height:yukseklik});
         
       });
       
       $(function kitap_Yukle()
       {   
        $("#kitap_yukle_div").css({height:300});
        //$("#takasOnayButon").css({display:"none"});
        
       });
       
       $("#mesajForm").submit(function ()               
            {
                    var mesaj=$("#mesajYaz").val();
                    var charCount=mesaj.length;
                    if(mesaj=='')
                    {                        
                        alert('Mesajınızı kontrol ediniz.');
                        return false;
                    }                    
                    else if(charCount<20)
                    {
                       alert('Mesajınızı çok kısa'); 
                       return false;
                    }
                    else
                    {
                        return true;
                    }
            });

       $("#kitap_yukle").submit(function ()               
            {
                var kitapAdi=$("input[name=kitap_adi]").val();
                var kitapKategori=$("#kitap_kategori option:selected").val();
                var kitapYazar=$("input[name=kitap_yazar]").val();
                var kitapYorum=$("#bookYorum").val();
                
                if(kitapAdi=='' && kitapAdi.length<4)
                {
                    alert('Kitap adı geçersiz');
                    return false;                    
                }else if(kitapKategori==-1)
                {
                    alert('Kategori adı geçersiz.');
                    return false;
                }else if(kitapYazar=='' && kitapYazar.length<5)
                {
                    alert('Yazar adı geçersiz.');
                    return false; 
                }
                else if(kitapYorum.length<50)
                {
                alert('Yorum kısmı boş bırakılabilir fakat açıklama 50 karakterden az olamaz');
                return false;
                }
           
                else
                {
                    return true;
                }                                
            });
             
           $('.mouseOver').mouseover(function (){
               
               $(this).attr('style','height: 20px; background: green; color: black; font-weight: bold;');               
               console.log('foo');
               
           });
           
           $('.mouseOver').mouseleave(function (){
               
               $(this).attr('style','height: 20px; background: aqua; color: black; font-weight: bold;');               
               console.log('foo');
               
           });
           
          $('.mouseOver').click(function (){ 
               my_window = window.open("sil.jsp?bookid="+$(this).attr('id'),
            "mywindow","status=1,left=100,top=100,width=400,height=150");
          });
          
          $('.kitapControlDiv').click(function ()
          {
              
              alert('En fazla 5 kitap ekleyebilirsiniz.');
          });
          
                 
});
             