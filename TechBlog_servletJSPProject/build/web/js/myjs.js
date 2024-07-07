/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//$(document).ready(function(){
//    alert("the document is ready");
//});
function doLike(pid , uid)
{
    console.log(pid+","+uid)
    const d = {
        uid : uid,
        pid : pid,
        operation : 'like'
    }
    
    $.ajax({
        url: "LikeServlet",
        data: d,
//        this above defined data we are sending to this servlet , so that at servlet we can access the uid , pid , operation name etc.
        
        success: function (data, textStatus, jqXHR) {
            console.log(data);
//            the data printed in console from above line is recieving from servlet out.print 

                //will check if like is successfull then , we have to increase the value of like on frontend as soon as user click on like button
                if(data.trim()=='true')
                {
                    let c = $(".like-counter").html();
                    c++;
                    $(".like-counter").html(c);
                }
               
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
        
    })
}