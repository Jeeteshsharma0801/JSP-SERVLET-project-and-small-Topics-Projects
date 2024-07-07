/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2.mySevlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jeetesh.sharma
 */
public class servlet1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
        
        resp.setContentType("text/html");
       //String name= (String)req.getAttribute("name");
       
       
        PrintWriter out = resp.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println(" <head>");
        out.println("<title>Servlet Servlet1</title>");
        out.println("</head>");
        out.println("<body>");
        
        String name= req.getParameter("name");
        
        out.println("<h1>Hello "+name+" , Welcome to the coding world<h1>");
        out.println("<h1><a href='servlet2' style='font-size: 35px;'>Goto Servlet2</a></h1>");
        
        //create a cookie , so that next request can collect data from here whatever we add
        Cookie c=new Cookie("myname", name);
        resp.addCookie(c);
        
        out.println("</body>");
        out.println("</html>");
        
         
        
        
//        out.println("<h1>GoTo Servlet2<h1> <a href="servlet2" />));
       
        
    }
    
    
    
}
