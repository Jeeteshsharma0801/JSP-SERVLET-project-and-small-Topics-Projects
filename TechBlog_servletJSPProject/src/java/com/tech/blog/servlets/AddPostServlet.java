/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author jeetesh.sharma
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
            
            //whatever we write in out.println() , will will goto the ajax function data 
            //and in out script in , we get the let form =new FormData(this); , therefore form will save this whatever we provide in out.println
            
            int cid=Integer.parseInt(request.getParameter("cid"));            
            String pTitle=request.getParameter("pTitle");
            String pContent=request.getParameter("pContent");
            String pCode=request.getParameter("pCode");
            
            Part part=request.getPart("pic");
            
            //getting current userid
            HttpSession session =request.getSession();
            User user=(User)session.getAttribute("currentUser");
            
            Post p=new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid , user.getId());
            
            //now saving the Post in DB table
            PostDao dao=new PostDao(ConnectionProvider.getConnection());
            if(dao.savePost(p))
            {
                //saving the image at blog_pics location
                String PathToSaveFile=request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), PathToSaveFile);
                
                out.println("Done"); 
                
            }
            else
            {
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
