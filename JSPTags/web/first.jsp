<%-- 
    Document   : first
    Created on : 18 Jun, 2024, 10:59:54 AM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        

    </head>
    <body style="background: #e2e2e2;">
        <h1>Hello Coding people , welcome to jsp tags page!</h1>
        
        <!--        Declarative tag for declaring variables and functions-->
        <%! 
                int a=10;
                int b=20;
                String name="techsoft India";
                
                public int doSum()
                {
                  return a+b;
                }

                public String reverse()
                {
                StringBuffer sb=new StringBuffer(name);
                return sb.reverse().toString();
                }
        %>
        
<!--        scriptlet tag for java source code , i.e. any response or to print-->
        <%
          out.println("a is : "+a);
          out.println("<br>");
          out.println("b is : "+b);
          out.println("<br>");
          out.println("sum of a & b is : "+doSum());
          out.println("<br>");
          out.println("Reverse string is : "+reverse());
        %>
        
        <h1 style="color: red;">Sum is : <%= doSum() %> </h1>
        <h2><%=a%></h2>
        <h2><%= reverse() %></h2>
        
        
    </body>
</html>
