/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author jeetesh.sharma
 */
public class LikeDao {
    
    //like table is created , in which lid (AI , NN) , pid(foreign key with post table>pid) , uid(foreign key with user>uid)
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    //if any user likes the post , then this function will update that like in like table
    public boolean insertLike(int pid , int uid)
    {
        boolean f=false;
        try{
            String q="insert into liked(pid, uid) values(?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(q);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            
            pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    //function to see , which no. of like on a particular post
    public int countLikeOnPost(int pid)
    {
        int count=0;
        String q="select count(*) from liked where pid=?";
        try{
            PreparedStatement pstmt=this.con.prepareStatement(q);
            pstmt.setInt(1, pid);
            ResultSet set= pstmt.executeQuery();
            
            if(set.next())
            {
                //getting value of column
                count=set.getInt("count(*)");
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return count;
    }
    
    
    //function to check whether the post is already liked or not by user
    public boolean isLikedByUser(int pid , int uid)
    {
        boolean f=false;
        try{
            PreparedStatement p=this.con.prepareStatement("select * from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set=p.executeQuery();
            
            if(set.next())
            {
                f=true;
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    //to dislike the post , i.e. delete the row from table if user again click the like button if it is already liked post
    public boolean deleteLike(int pid , int uid)
    {
        boolean f=false;
        try{
            PreparedStatement p=this.con.prepareStatement("delete from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
}
