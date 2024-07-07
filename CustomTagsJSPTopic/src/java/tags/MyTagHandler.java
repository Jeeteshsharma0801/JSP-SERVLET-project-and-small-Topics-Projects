package tags;

import java.util.Date;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author jeetesh.sharma
 */
//tag support implements tag interface
public class MyTagHandler extends TagSupport {

    @Override
    public int doStartTag() throws JspException {
        
        try{
            //to take the writer , so that we can print on browser
            JspWriter out = pageContext.getOut();
            out.println("<h1>This is my custom tag</h1>");
            out.println("<p>This is paragraph tag defined in java class MyTagHandler.java</p>");
            out.println("<br>");
            out.println(new Date().toString());
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        //i.e. we donot want to run body of this function, body will run but will not have to return int value
        return SKIP_BODY;
    }
    
    
    
    
    
}
