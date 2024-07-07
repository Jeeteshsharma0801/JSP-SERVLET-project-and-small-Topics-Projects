<%-- 
    Document   : errorPage
    Created on : 18 Jun, 2024, 2:50:38 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorHandle_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is the page , where operations will be performed</h1>
        <%!
            int n1=20;
            int n2=0;
           // int n2=10;
            
            public int division()
            {
                return n1/n2;

            }
        %>
        
        <h1>Division is : <%= division() %></h1>
            
            
            
    </body>
</html>
