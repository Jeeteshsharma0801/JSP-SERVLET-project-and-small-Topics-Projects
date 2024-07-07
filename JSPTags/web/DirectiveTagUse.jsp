<%-- 
    Document   : DirectiveTagUse
    Created on : 18 Jun, 2024, 11:45:21 AM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--we can include any packahe of java using this-->
<%@page import="java.util.Random,java.util.ArrayList,java.io.*"  %>

<!--this jsp page will behave like error page-->
<%@page isErrorPage="true" %>

<!--by this we cannot get the the session and cannot use the session in this page like getSession() etc-->
<%@page session="false" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            *{
                margin:0px;
                padding:0px;
            }
        </style>
        
    </head>
    <body>
        <h1>This is DirectiveTagUse.jsp page !</h1>
        
<!--        here at this location ,this header.jsp page will occur by using include directive-->
        <%@include file="header.jsp" %>
        
        <h1> Random number : 
        
            <%
                Random r=new Random();
                int n=r.nextInt(10);
               // out.println(n);
                
            %>
            
            <%= n %>
        </h1>
    </body>
</html>
