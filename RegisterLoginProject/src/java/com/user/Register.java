/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author jeetesh.sharma
 */

//this @MultipartConfig is used to tell , that it contains multipart file info like audio , video , images etc
@MultipartConfig
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //getting all the incomming details from the request.
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password"); 
            
            //to get the image content uploaded in form
            Part myPartData=request.getPart("image");
            
            String filename = myPartData.getSubmittedFileName();
           // out.println("uploaded filename : "+filename);
            
           // out.println("name : "+name);
            //out.println("email : "+email);
           // out.println("password : "+password);
            
            //now will send this data to DB table using JDBC
            //connection
            try{
                
                //when comes at this point , it'll make it delay for 3 secs
                Thread.sleep(3000);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "Jeet0801@");
                
                String q="insert into user(name , password , email , imageName) values(?,?,?,?)";
                
                PreparedStatement pstmt= con.prepareStatement(q);
                
                pstmt.setString(1, name);
                pstmt.setString(2, password);
                pstmt.setString(3, email);
                pstmt.setString(4, filename);
                //we are just storing the filename in our database table and will store the image in our folder.
                
                pstmt.executeUpdate();
                
                //now uploading this file to our folder on server at given path.
                InputStream is = myPartData.getInputStream();
                byte []data=new byte[is.available()];
                 is.read(data);
                String path = request.getRealPath("/")+"myImages"+File.separator+filename;
                //out.println("path is : "+path);
                FileOutputStream fos=new FileOutputStream(path);
                fos.write(data);
                fos.close();
               
                
                
                out.println("DONE");
                
            }catch(Exception e)
            {
                
                e.printStackTrace();
                out.println("Error");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
