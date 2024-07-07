/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;
import java.sql.*;
/**
 *
 * @author jeetesh.sharma
 */
public class ConnectionProvider {
    
    //both method and variable should be static only
    public static Connection con;
    
    public static Connection getConnection()
    {
        try{
            //i.e. if we are calling the same for the 4th time or 5th time , then it will not make connection again and again
            //it will store the value of connection for the first time and return the same
            if(con==null)
            {
            //driver class load
            Class.forName("com.mysql.jdbc.Driver");
            
            //create a connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogproject", "root", "Jeet0801@");
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return con;
    }
    
    
}
