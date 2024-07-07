<%-- 
    Document   : index
    Created on : 22 Jun, 2024, 6:13:19 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
         <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
         
         <!--link copied from "font awesome icons introduction from W3 school website" , so that we can use font awesome icons--> 
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         
         <!-- copied from this website , to zigzag the upper area https://bennettfeely.com/clippy/-->
         <style>
             .banner-background{
                 clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 66% 88%, 32% 97%, 0 88%, 0 0);
             }
         </style>
        
    </head>
    <body>
        
        <!--start navbarincluding from normal_navbar.jsp page-->
        <%@include file="normal_navbar.jsp" %>
        <!--ends navbarincluding from normal_navbar.jsp page-->
        
        
     <!--banner-->
     
     <div class="container-fluid p-0 m-0 banner-background">
         <div class="jumbotron primary-background text-white">
             <div class="container">
                 <h3 class="display-4">Welcome to TechBlog</h3>
                 <p>Welcome to technical blog , world of technology
                 
                 Programming languages are described in terms of their syntax (form) and semantics (meaning), usually features such as a type system, variables and mechanisms for error handling.
                 </p>
                 <p>
                     Computer architecture has strongly influenced the design of programming languages, with the most common type (imperative languages—which implement operations in a specified order) developed to perform well on the popular von Neumann architecture. 
                 </p>
                 
                 <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span>Start ! It's free</button>
                 <!--fa-spin is used to rotate the symbol 360 degree-->
                 <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus fa-spin"></span>Login</a>
             </div>
         </div>
     </div>
     
     
     <!--cards-->
     <div class="container">
         <div class="row mb-2">
             <!--row contains 12 columns-->
             <div class="col-md-4">
                 <div class="card">
                    <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                    <div class="card-body">
                    <h5 class="card-title">Java Programming Language</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read More</a>
                   </div>
                 </div>
             </div>
             
             <div class="col-md-4">
                 <div class="card">
                    <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                    <div class="card-body">
                    <h5 class="card-title">Java Programming Language</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read More</a>
                   </div>
                 </div>
             </div>
             
             <div class="col-md-4">
                 <div class="card">
                    <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                    <div class="card-body">
                    <h5 class="card-title">Java Programming Language</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read More</a>
                   </div>
                 </div>
             </div>
             
             
         </div>
         
         
         
         <!--next row-->
         <div class="row">
             <!--row contains 12 columns-->
             <div class="col-md-4">
                 <div class="card">
                    <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                    <div class="card-body">
                    <h5 class="card-title">Java Programming Language</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read More</a>
                   </div>
                 </div>
             </div>
             
             <div class="col-md-4">
                 <div class="card">
                    <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                    <div class="card-body">
                    <h5 class="card-title">Java Programming Language</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read More</a>
                   </div>
                 </div>
             </div>
             
             <div class="col-md-4">
                 <div class="card">
                    <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                    <div class="card-body">
                    <h5 class="card-title">Java Programming Language</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read More</a>
                   </div>
                 </div>
             </div>
             
             
         </div>
         
     </div>
        
        
        <!--java scripts-->
        <!--added from "jquery cdn" google-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        
        <!--taken from js bootstrap-->
        <!--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
      
        <!--added by drage and drop from file below js link , so that my js file should be included here in this jsp page--> 
        <script src="js/myjs.js" type="text/javascript"></script>
<!--        <script>
            $(document).ready(function(){
                alert("document loaded !")
            })
        </script>-->
           
        
    </body>
</html>
