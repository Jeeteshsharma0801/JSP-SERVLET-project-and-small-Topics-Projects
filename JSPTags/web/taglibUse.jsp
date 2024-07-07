<%-- 
    Document   : taglibUse
    Created on : 18 Jun, 2024, 2:21:58 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--we wants to use JSTL library pre-defined code in this JSP page-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello people , we are learning here use of taglib directive in JSP</h1>
        
        <c:out value="jeetesh Sharma"></c:out>
        <hr>
        
        <c:set var="companyName" value="Newgen Software" ></c:set>
        <c:out value="${companyName}" ></c:out>
        
        <hr>
        
        <c:if test="${3>1}" >
            <c:out value="We are under if block of 3>1"></c:out>
        </c:if>
        
        <hr>
        
        <c:if test="${3>4}">
            <c:out value="under if block of 3>4" ></c:out>
        </c:if>
        
        
        
    </body>
</html>
