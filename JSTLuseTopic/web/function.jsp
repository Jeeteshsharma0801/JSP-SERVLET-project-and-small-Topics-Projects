<%-- 
    Document   : function
    Created on : 22 Jun, 2024, 9:53:14 AM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun" %>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: blueviolet">
        <h1>This page is created to show use of JSTL functions</h1>
        <hr>
        
        <c:set var="name" value="JAVA CODING"></c:set>
        <c:out value="${name}"></c:out>
        
        <!--function length-->
            <h1>Length of name is : <c:out value="${fun:length(name)}"></c:out> </h1>
        
        <!--function lowercase-->
            <h1><c:out value="${fun:toLowerCase(name)}"></c:out></h1>
        
        <br>
        
        <!--function contains-->
        <h1>is name variable contains CODING : <c:out value="${fun:contains(name, CODING)}" ></c:out> </h1>
        
       
    </body>
</html>
