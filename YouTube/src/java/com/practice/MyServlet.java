/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.practice;

//import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;


/**
 *
 * @author jeetesh.sharma
 */
public class MyServlet extends HttpServlet {
    
 public void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException{
     System.out.println("this is get method........");
     response.setContentType("text/html");
     PrintWriter out=response.getWriter();
     out.println(new Date().toString());
     out.println("<h1>This is get method of my servlet </h1>");
 }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        System.out.println("under dopost method of httpservlet ");
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
 
 
 
}
