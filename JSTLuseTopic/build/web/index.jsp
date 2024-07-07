<%-- 
    Document   : index
    Created on : 21 Jun, 2024, 3:59:04 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL use page</title>
    </head>
    <body>
        <h1>This is JSTL example</h1>
        
        <!--1 out tag-->
        
            
        <!--2 set tag-->
        <c:set var="i" value="23" scope="application"></c:set>
        
        <h1><c:out value="${i}"></c:out></h1>
        <h1><c:out value="helooooooo"></c:out>
        
        <!--3 remove--> 
        <c:remove var="i"></c:remove>
        
         <h1><c:out value="${i}">this is default value , if value not found !</c:out></h1>
         
         
         <!--4 if : test condition : true => print-->
         <c:set var="a" value="50" scope="application"></c:set>
         
         <c:if test="${a==50}">
             <h1>yes value is 50 and condition is true</h1>
         </c:if>
             
         <c:if test="${a>49}">
             <h1>yes, value of a is greater than 49</h1>
             <p>We are learning the jstl tags to use in my projects</p>
         </c:if>
             
             
        
         <c:set var="b" value="0" scope="application"></c:set>
         
        <!--5 choose tag (use of when, otherwise) :: will behave like java switch loop--> 
         <c:choose>
             <c:when test="${b>0}">
                 <h1>This is my first case</h1>
                 <h2>Number b is positive</h2>
             </c:when>
             <c:when test="${b<0}">
                 <h1>This is my second case</h1>
                 <h2>Number b is negative</h2>
             </c:when>
             <c:otherwise>
                 <h1>This is default case</h1>
                 <h2>number b is zero</h2>
             </c:otherwise>
         </c:choose>
                 
                 
                 
        <!--6 forEach tag : for repeating and traversing-->
         <c:forEach var="j" begin="1" end="10">
             <h1>value of j is <c:out value="${j}"></c:out></h1>
         </c:forEach>
             in
             
             <!--url tag-->
         <c:url var="myurl" value="http://google.com/search">
             <c:param name="q" value="jeetesh sharma newgen"></c:param>
         </c:url>
             
             <h1><c:out value="${myurl}"></c:out></h1>
             
         <!--7 re-direct tag-->    
         <%--<c:redirect url="${myurl}"></c:redirect>--%>
             
         
            
    </body>
</html>
