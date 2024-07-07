<%-- 
    Document   : page2
    Created on : 20 Jun, 2024, 5:42:22 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>page2</title>
    </head>
    <body style="background-color: green">
        <h1>This is page 2</h1>
        <%
            response.sendRedirect("page3.jsp");
        %>
    </body>
</html>
