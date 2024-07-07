<%-- 
    Document   : tag
    Created on : 19 Jun, 2024, 9:43:07 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--giving location and uri to use mt custom tag-->
<%@taglib uri="/WEB-INF/tlds/myLib" prefix="t" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
<!--      using my custom tag-->
         <t:mytag></t:mytag>
         
         <hr>
         
<!--         using my custom tag with attribute-->
         <t:printTable number="5" color="blue"></t:printTable>
         
         <hr>
         
         <t:printTable number="10" color="red"></t:printTable>
        
    </body>
</html>
