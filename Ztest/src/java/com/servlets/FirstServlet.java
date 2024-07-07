/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.*;


/**
 *
 * @author jeetesh.sharma
 */
public class FirstServlet implements Servlet {
    
    ServletConfig conf;

     // life cycle method
    @Override
    public void init(ServletConfig conf) throws ServletException {
        this.conf=conf;
        System.out.println("creating object ....");
        
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    // life cycle method
    @Override
    public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
        
        System.out.println("Servicing.....");
        resp.setContentType("text/html");
        PrintWriter out =resp.getWriter();
        out.println("<h1>This is my output from servlet method :</h1>");
        out.println("<h1>Today's date and time is : "+new Date().toString()+"</h1>");
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    // life cycle method
    @Override
    public void destroy() {
        System.out.println("going to destroy servlet object !");
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    //non-life cycle method
    @Override
    public ServletConfig getServletConfig() {
        return this.conf;
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

 
     //non-life cycle method
    @Override
    public String getServletInfo() {
        return "This Servlet is created by jeetesh sharma";
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
