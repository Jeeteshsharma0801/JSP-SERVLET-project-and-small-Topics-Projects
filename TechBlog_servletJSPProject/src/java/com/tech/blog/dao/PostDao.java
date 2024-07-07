/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jeetesh.sharma
 */
public class PostDao {
    
     Connection con;

    public PostDao(Connection con) {
        this.con=con;
    }
    
    public ArrayList<Category> getAllCategories()
    {        
        ArrayList<Category> list=new ArrayList<>();
        
        try{
            String q="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
               Category c=new Category(cid, name, description);
               list.add(c);
                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    
    //savePost function
    public boolean savePost(Post p)
    {
        boolean f=false;
        
        try{
            String q="insert into posts (pTitle, pContent , pCode , pPic , catId , userId) values (?,?,?,?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(q);
            
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpContent());
            pstmt.setString(3,p.getpCode());
            pstmt.setString(4,p.getpPic());
            pstmt.setInt(5,p.getCatId());
            pstmt.setInt(6,p.getUserId());
            
            pstmt.executeUpdate();
            
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
    
    
//    now making functions to use them on profile page body , i.e. after user login , user can see the posts
    
    //get all the posts from DB
    public List<Post> getAllPosts()
    {
        List<Post> list=new ArrayList<>();
        try{
            PreparedStatement p=this.con.prepareStatement("select * from posts order by pid desc");
           ResultSet set= p.executeQuery();
           
           while(set.next())
           {
               int pid=set.getInt("pid");
               String pTitle=set.getString("pTitle");
               String pContent=set.getString("pContent");
               String pCode=set.getString("pCode");
               String pPic=set.getString("pPic");
               Timestamp pDate=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                
                Post post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
                list.add(post);              
           }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    
    //get all post by category id
    public List<Post> getPostCatById(int catId)
    {
        List<Post> list=new ArrayList<>();
        
        try{
            PreparedStatement pstmt=this.con.prepareStatement("select * from posts where catId=?");
            pstmt.setInt(1, catId);
            ResultSet set=pstmt.executeQuery();
            
            while(set.next())
            {
                int pid=set.getInt("pid");
               String pTitle=set.getString("pTitle");
               String pContent=set.getString("pContent");
               String pCode=set.getString("pCode");
               String pPic=set.getString("pPic");
               Timestamp pDate=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
                
                Post post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
                list.add(post);   
            }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    public Post getPostByPostId(int postId)
    {
        Post post=null;
        String q="select * from posts where pid=?";
        
        try
        {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);          
            ResultSet set=p.executeQuery();
            
            if(set.next())
            {
                
                
            int pid=set.getInt("pid");
               String pTitle=set.getString("pTitle");
               String pContent=set.getString("pContent");
               String pCode=set.getString("pCode");
               String pPic=set.getString("pPic");
               Timestamp pDate=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
              int cid=set.getInt("catId");
                
             post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,cid,userId);         
            }    
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return post;
    }
    
    
    
}
