<%-- 
    Document   : formSubmit
    Created on : 18 Jun, 2024, 5:01:35 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorExceptionHandle.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //fetching numbers from form
         String n1=request.getParameter("n1");
         String n2=request.getParameter("n2");
         
           //converting them to integer
           int num1=Integer.parseInt(n1);
           int num2=Integer.parseInt(n2);
           
           int div=num1/num2;
           
        %>
        
        <h1>Result is : <%= div%></h1>
    </body>
</html>
