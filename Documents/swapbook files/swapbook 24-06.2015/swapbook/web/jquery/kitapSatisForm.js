/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function (){
    var tampon="";
    $("#fiyatText").keypress(function (a){
            if(String.fromCharCode(a.which).match(/[^a-zA-Z ]/g))
            {
               tampon=$("#fiyatText").val()+String.fromCharCode(a.which);
               $("#fiyatLabel").html("Onaylanan :"+tampon+"TL");
            }
            else
            {
                tampon=String.fromCharCode(a.which);
            }
            if(tampon.length>=3)
            {
                alert("Fiyat Geçersiz.");
                tampon="";
                $("#fiyatText").val("");
            }
            
          });
    
    
    
});

          