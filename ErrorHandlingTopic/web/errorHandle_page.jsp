<%-- 
    Document   : errorHandle_page
    Created on : 18 Jun, 2024, 2:57:27 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry !! something went wrong...</title>
        
        <style>
            *{
                padding: 0px;
                margin: 0px;
            }
        </style>
    </head>
    
    <body>
        <div style="padding: 20px; color: blue; background: #e2e2e2;">
        <h1>Sorry !! something went wrong...</h1>
        <br>
        <p>Error is : <%= exception %></p>
        </div>
    </body>
</html>
