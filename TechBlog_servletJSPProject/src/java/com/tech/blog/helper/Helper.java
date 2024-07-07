/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author jeetesh.sharma
 */
public class Helper {
    
    public static boolean deleteFile(String path)
    {        
        boolean f=false;
        try{
            File file=new File(path);
            //f=true , if file or directory will get deleted
             f=file.delete();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public static boolean saveFile(InputStream is , String path)
    {
        boolean f=false;
        
        try{
//            made the byte type of variable of same length as of is
            byte b[]=new byte[is.available()];
            //read from id , and will put in variable b
            is.read(b);
            
            //will write the data in outputstream at our path
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            
            fos.flush();
            fos.close();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
}
