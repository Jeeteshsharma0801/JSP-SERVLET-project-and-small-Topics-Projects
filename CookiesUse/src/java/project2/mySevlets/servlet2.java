/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2.mySevlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jeetesh.sharma
 */
public class servlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        resp.setContentType("text/html");
        // String name= req.getParameter("name");
        
         PrintWriter out = resp.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println(" <head>");
        out.println("<title>Servlet Servlet1</title>");
        out.println("</head>");
        out.println("<body>");
         
        //getting all the cookies
         Cookie[] cookies=req.getCookies();
         
         //if name conatins space values then cookies will not work.
         // can use name=jeeteshSE , jeetsh_sharma etc , but not "jeetesh sharma"
         
         //getting all cookies sent from previous request
         for(int i=0;i<cookies.length;i++)
         {
             System.out.println("present cookies are : cookie name : "+cookies[i].getName() +" , cookie value : "+cookies[i].getValue());
         }
         
         
         
         //first we consider , its old user. i.e.f=false
         boolean f=false;
         String name="";
         
         if(cookies==null)
         {
             out.println("<h1>You are new user , goto home page and submit your name</h1>");
             return;
         }
         else
         {
             System.out.println("cookies present");
             for(Cookie c:cookies)
                 
             {
                 String tname=c.getName();
                 //the name of cookie that we have sent from previous servlet , not the value here we're getting the cookie name we set in previous servlet
                 if(tname.equals("myname"))
                     //then it means this is same cookie we sent in previous servlet
                 {
                     f=true;
                     name=c.getValue();
                 }
                 
             }
         }
         
         if(f)
         {
            out.println("<h1>Hello "+name+" , Welcome back to the coding world i.e. servlet2<h1>");
            out.println("<h1>Thankyou !</h1>");
         }
         else
         {
              out.println("<h1>You are NEW USER  , goto home page and submit your name</h1>");
         }
         
          out.println("</body>");
        out.println("</html>");
        
         
        // System.out.println(cookies);
         
      //  out.println("<h1>Hello "+name+" , Welcome to the Second servlet page<h1>");
        
        //super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
