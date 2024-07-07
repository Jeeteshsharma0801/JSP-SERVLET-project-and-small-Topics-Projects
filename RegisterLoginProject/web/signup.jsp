<%-- 
    Document   : signup
    Created on : 15 Jun, 2024, 11:19:49 AM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
<!--        to add materializecss site library-->
        <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
<!--        to add materializecss site library-->
        
    </head>
    <body style="background: url(myImages/loginBackgroundPhoto.jpg);background-size:  cover;background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px;" class="center-align">Register here !</h3>
                            
<!--                            used in ajax mathod below, to show the msg at this location upon success or error-->
                            <h5 id="msg" class="center-align"></h5>
                            
                            <div class="form center-align" >
                                <!-- //creating a form-->
                                <form action="Register" method="post" id="myform">
                                    <input type="text" name="user_name" placeholder="Enter user name"/>
                                    <input type="password" name="user_password" placeholder="Enter user password"/>
                                    <input type="email" name="user_email" placeholder="Enter user email"/>
                                    
                                    <!-- made file upload button using materialize CSS site-->
                                    <div class="file-field input-field">
                                      <div class="btn">
                                        <span>File</span>
                                        <input name="image" type="file">
                                      </div>
                                     <div class="file-path-wrapper">
                                       <input class="file-path validate" type="text">
                                     </div>
                                   </div>
                                    
                                    
                                    <button type="submit" class="btn #536dfe indigo accent-2">Submit</button>
                                    
                                </form>
                            </div>
                            
                            
               <!-- made upload loader available here using materialiseCSS , when user click submit button then it will show loading process-->
                            <div class="loader center-align" style="margin-top: 10px; display: none;   ">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                      <div class="circle-clipper left">
                                        <div class="circle"></div>
                                      </div><div class="gap-patch">
                                        <div class="circle"></div>
                                      </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                      </div>
                                    </div>
                                </div>
                                <h5>Please wait...</h5>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
<!--adding jquery library-->
  <script  
      src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous">
  </script>
  
  
<!--  using jquery library , so that after submitting the form , the page should remains same and should not redirect to some other page/servlet
.and other functions like whatever defined in form submit action, should be perform like saving data in DB etc-->
  <script>
      
      //($(document)), it refers to the entire HTML document itself.
      $(document).ready(function (){
          // once document become ready
          console.log("page is ready");
          
          //'myform' is id given to form , upon submit this form this function will be called
          $("#myform").on('submit',function(event)
          {
              //this will prevent doing default operation , i.e. upon submitting the name , email and password in form the page should not 
              //redirect to some another page , instead all operations of form action will be performed but page remains same .
              event.preventDefault();
              
              //here this refers to form , it'll serialize all the data i.e. being entered in form
              //we cannot serialize if image is also present
              //var f = $(this).serialize();
              //console.log("serialized values are : "+f);
              //serialized values are : user_name=testing2&user_password=JaiShreeRam&user_email=testing2%40gmail.com
              //i.e. taken form form 'name' values
              
              //complete form data will be stored in this f variable
              //for image storage otherwise we can use var f = $(this).serialize(); also to store the data
              let f=new FormData(this);
              
              
              
              
              // after clicking the submit button and before sending the data to next URL i.e. '/Regsiter'
              // the form should hidden and our loader class should be visible.
              $(".loader").show();
              $(".form").hide();
              
              //using ajax , we are sending the our form data to our servlet i.e. '/Register' URL
              $.ajax({
                  //'Register' is the form action, i.e. on which servlet we'll send the data from form
                  url:"Register",
                  data: f,
                  type: 'POST',
                  
                  //data f is the data recieved from Register servlet from whatever written in out.println()
                  success: function(data, textStatus, jqXHR){
                      console.log("under success data : "+data);
                      console.log("success........");
                      
                       $(".loader").hide();
                       $(".form").show();
                       
                       //taken from form i..e out.println("DONE") in our form when successfully saved in DB
                       //i.e. will be added in data after successfully saved in DB
                       if(data.trim()==='DONE')
                       {
                           //'msg' is the id given above in form , where i wanted to display this message.
                           $('#msg').html("Successfully Registered !!")
                           //to change the color.
                           $('#msg').addClass('green-text');
                       }
                       else
                       {
                           $('#msg').html("Something went wrong on server.... !!")
                           $('#msg').addClass('red-text');
                       }
                       
                       
                  },
              
                      error: function (jqXHR, textStatus, errorThrown) {
                          console.log(data);
                          console.log("error......")
                          $(".loader").hide();
                          $(".form").show();
                          $('#msg').html("Something went wrong on server.... !!")
                      },
                      
                      //for image storage
                      processData: false,
                      contentType: false
                  })
          })
          })
      
  </script>
        
    </body>
</html>
