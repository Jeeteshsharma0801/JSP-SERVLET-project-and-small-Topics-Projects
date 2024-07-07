<%-- 
    Document   : show_UsersTableFromDB
    Created on : 22 Jun, 2024, 11:12:31 AM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    </head>
    <body>
        <h1>All users are : </h1>
        
        <!--building connection with my sql database-->
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/youtube" user="root" password="Jeet0801@" var="ds"></sql:setDataSource>
        <!--this connection of database will be stored in variable "ds"-->
        
        <sql:query dataSource="${ds}" var="rs">select * from user;</sql:query>
        <!--result will be stored in variable "rs" of this query-->
        
        <table class="table table-dark">
            <tr>
                <td>User_ID</td>
                <td>User_Name</td>
                <td>User_Email</td>
            </tr>
            
        <c:forEach items="${rs.rows}" var="row">
            <!--each row comming out , will be saved in variable "row"-->
            <tr>
                <td><c:out value="${row.id}"></c:out></td>
                <td><c:out value="${row.name}"></c:out></td>
                <td><c:out value="${row.email}"></c:out></td>
            </tr>
        </c:forEach>    
        </table>
    </body>
</html>
