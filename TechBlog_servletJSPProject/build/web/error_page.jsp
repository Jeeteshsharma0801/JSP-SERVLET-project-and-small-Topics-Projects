<%-- 
    Document   : error_page
    Created on : 25 Jun, 2024, 4:10:30 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--to make this page as error page-->
<%@page isErrorPage="true"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! something went wrong....</title>
        
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
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid">
            <h3 class="display-4">Sorry ! Something went wrong...</h3>
            
            <!--whatever exception will come , will get printed over this page , by below tag-->
            <%= exception %>
<!--            if not getting any error and we are trying to open this page by this exception tag , then it will throw error 
            that this page is not getting exception and we are trying to print the exception-->
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-2">Home</a>
        </div>
    </body>
</html>
