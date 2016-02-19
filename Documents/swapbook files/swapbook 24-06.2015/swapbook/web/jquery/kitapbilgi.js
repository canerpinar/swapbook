/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Guvenilirlik(id,session_id)
{
    $.post("ajaxServlet",{"guvensahibi":id,"guvenveren":session_id},
    function (cevap)
    {
        //alert(cevap); 
        $("#GuvenSayisi").html("Güven Sayısı:<b>"+cevap+"</b>");
        $("#guvenilirlikButton").css("display","none");
    });
}