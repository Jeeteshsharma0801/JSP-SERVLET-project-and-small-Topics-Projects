<%-- 
    Document   : load_posts
    Created on : 30 Jun, 2024, 11:26:57 PM
    Author     : jeetesh.sharma
--%>

<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<!--this is load post page....-->
<div class="row">
<%
    
    User loginUser=(User)session.getAttribute("currentUser");
    
    Thread.sleep(500);
     
PostDao d=new PostDao(ConnectionProvider.getConnection());

int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid == 0)
{
    posts= d.getAllPosts();
}
else
{
    posts= d.getPostCatById(cid);
}

if(posts.size()==0)
{
    out.println("<h3 class='display-3 text-center'>No Post in this category..</h3>");
    return;
}

for(Post p : posts)
{
%>

<div class="col-md-6 mt-2">
    <div class="card">
        <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Image not available as mentioned in DB">
        <div class="card-body">
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent() %></p>
        </div>
        <div class="card-footer primary-background text-center">
            <%
                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                %>
            <!--like button-->
            <a href="#!" onclick="doLike(<%= p.getPid() %>,<%=loginUser.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
            
            <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>           
            <!--comment button-->
            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
        </div>
    </div>
</div>
    
<%
}
%>
</div>