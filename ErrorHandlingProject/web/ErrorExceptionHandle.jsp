<%-- 
    Document   : ErrorExceptionHandle
    Created on : 18 Jun, 2024, 5:56:45 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry !! Something went wrong...</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    </head>
    <body>
        <div class="container p-3 text-center"> 
            <img src="Images/errorPhoto.jpg" class="img-fluid"/>
        <h1>Sorry !! Something went wrong</h1>
        <p><%= exception %></p>
        <a href="index.html" class="btn btn-outline-primary">Home Page</a>
        </div>
    </body>
</html>
