package com.practice;

//import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author jeetesh.sharma
 */
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //HttpServletRequest is to get the data of form 
        //HttpServletResponse is to return the dynamic data to the user after this function running time.
       // super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
       
       resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        out.println("<h2>Welcome to register servlet</h2>");
        
        String name=req.getParameter("user_name");
        String password=req.getParameter("user_password");
        String email=req.getParameter("user_email");
        String gender=req.getParameter("user_gender");
        String course=req.getParameter("user_course");
        
        String cond=req.getParameter("condition");
        
       // out.println(cond);
       
        if(cond!=null){
            
        if(cond.equals("checked"))
        {
            out.println("<h2>Name : "+name+"</h2>");
            out.println("<h2>password : "+password+"</h2>");
            out.println("<h2>email : "+email+"</h2>");
            out.println("<h2>gender : "+gender+"</h2>");
            out.println("<h2>course : "+course+"</h2>");
            
            //assuming the data is saved to DB
            //therefore , sending it to success page by using RequestDispatcher forward method
            RequestDispatcher rd=req.getRequestDispatcher("success");
            rd.forward(req, resp);
        } 
        
    }
        else{
            out.println("<h2>You have not accepted terms and conditions</h2>");
            
            //i wants to include output of index.html page
            //get the object of RequestDispatcher
            RequestDispatcher rd=req.getRequestDispatcher("index.html");
            //using inlcude mthd of RequestDispatcher
            rd.include(req, resp);
            
        }
    }
     
    
    
    
}
