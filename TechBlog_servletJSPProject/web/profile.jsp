<%-- 
    Document   : profile
    Created on : 25 Jun, 2024, 11:08:34 PM
    Author     : jeetesh.sharma
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <!--link copied from "font awesome icons introduction from W3 school website" , so that we can use font awesome icons--> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- copied from this website , to zigzag the upper area https://bennettfeely.com/clippy/-->
        <style>
            
            body{
                background: url(img/bkgrndphoto.webp);
                background-size: cover;
                background-attachment: fixed;
            }
            
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 66% 88%, 32% 97%, 0 88%, 0 0);
            }
        </style>

    </head>
    <body>

        <!--navbar copied from normal_navbar.jsp page-->

        <!--starts navbar from bootstrap-->

        <!--        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <!--we will write css for primary-background in mystyle.css file-->

            <!--<span class="fa fa-asterisk"></span> this is from  font awesome icons website from W3 school ,
            for this first add its introduction css lib in head of index.jsp page-->
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#" ><span class="fa fa-bell-o"></span>Learn code with JEETESH<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="fa fa-address-book-o"></span>Contact</a>
                    </li> 

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk"></span>Do Post</a>
                    </li>                    
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <!--<a class="nav-link" href="register_page.jsp"> <span class="fa fa-user-circle"></span><%= user.getName()%></a>-->
                        <!--used data-toggle and data-target to pop up , defined this target below from modals of bootstrap
                        and "profile-modal" is the id of defined modal-->
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span><%= user.getName()%></a>


                    </li>

                    <li class="nav-item">
                        <a href="LogoutServlet" class="nav-link" href="register_page.jsp"> <span class="fa fa-user-plus"></span>Logout</a>
                    </li>

                </ul>
            </div>
        </nav>    
        <!-- ends navbar from bootstrap-->

        <!--end of nav bar-->





        <!--to show the  msg when edit on prfile is done or not -->
        <!--and this is we are getting through session set in EditServlet  code-->
        <!--this alert is taken from bootstrap-->
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>

        <!--  <div class="alert alert-primary" role="ale rt">-->
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>







        <!--starts main profile page body-->
        <!--taken this list groud from bootstrap-->
        <!-- start left hand side of page-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categories , taking from database-->
                            <% 
                                PostDao d=new PostDao(ConnectionProvider.getConnection());
                                 ArrayList<Category> list1 = d.getAllCategories();
                                 for(Category cc:list1)
                                 {
                            %>
                            <!--on left side , to display all the categories of a post-->
                            <a href="#" onclick="getPosts(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>  
                            <%
                                 }
                            %>
                            
                            <!--<a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>-->
                        </div>
                    </div>
        <!-- end left hand side of page-->
                            
                            
                            
                    <!--Right side area , where we'll see all the posts-->
                    <div class="col-md-8" id="post-container">
                      <!--show all posts here-->
                      <!--this loader will get hide as soon as the load_posts.jsp page get loaded and we have controlled this using ajax 
                      with comment=loading post using ajax below -->
                      <div class="container text-center" id="loader">
                          <i class="fa fa-refresh fa-3x fa-spin"></i>   
                          <h3 class="mt-4">Loading...</h3>
                      </div>
                      
                      <div class="container-fluid" id="post-container"> 
                          
                      </div>
                    </div>
                </div>
            </div>
        </main>

        <!--end main profile page body-->












        <!--      we made this modal for like when user is logged in and click on his username displayed on logged in page ,
                then  his information should be prompt and added the table part inside the modal from bootstrap only-->
        <!--modal from bootstrap-->
        <!--profile modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px">
                            <br>
                            <h5 class="modal-title mt-2" id="exampleModalLabel"> <%= user.getName()%> </h5>

                            <!--user details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please edit carefully</h3>

                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID: </td> 
                                            <td><%= user.getId()%></td>
                                        </tr>

                                        <tr>
                                            <td>Email :</td> 
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"</td>
                                        </tr>

                                        <tr>
                                            <td>Name :</td> 
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"</td>
                                        </tr>

                                        <tr>
                                            <td>Password :</td> 
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"</td>
                                        </tr>

                                        <tr>
                                            <td>Gender :</td> 
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>

                                        <tr>
                                            <td>About :</td> 
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about">
                                                    <%= user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>   

                                        <tr>
                                            <td>New profile :</td> 
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td>
                                        </tr>                                      
                                    </table> 

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of modal from bootstrap-->
        <!--end of profile modal-->


        <!--start add post modal-->
        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="AddPostServlet" method="post" id="add-post-form">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select category---</option>
                                    <%
                                        //to get the dropdown values from DB categories Table 
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 150px;"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your program (if any)" style="height: 150px;"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic</label>
                                <br>
                                <input name="pic" type="file">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>


                        </form>


                    </div>
                    <!--                    <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>-->
                </div>
            </div>
        </div> 
        <!--end of add post modal-->






        <!--java scripts-->
        <!--added from "jquery cdn" google-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <!--taken from js bootstrap-->
        <!--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

        <!--taken src value from sweet alert cdn website from google to use alert msg at the time when user added a new post -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <!--added by drage and drop from file below js link , so that my js file should be included here in this jsp page--> 
        <script src="js/myjs.js" type="text/javascript"></script>
        <!--        <script>
                    $(document).ready(function(){
                        alert("document loaded !")
                    })
                </script>-->

        <!--sweet alert website i.e. https://cdnjs.com/libraries/sweetalert , so that we can use sweet alert from  https://sweetalert.js.org/guides/-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <!--integrating listener using ajax on click of edit button-->
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
//                   alert("edit button clicked now")

                    if (editStatus == false)
                    {
                        $("#profile-details").hide()
                        $("#profile-edit").show()
                        editStatus = true;
                        //when it will be in edit mode , then the same ID button should be renamed as "Back"
                        $(this).text("Back")
                    } else
                    {
                        $("#profile-details").show()
                        $("#profile-edit").hide()
                        editStatus = false;
                        //when it will be in edit mode , then if we click the "Back" button , then the same id button should renamed as "Edit"
                        $(this).text("Edit")
                    }
                })
            });
        </script>



        <!--Now adding JS to post form i.e.after login then on click of "DoPost" option then while submitting the form--->
        <script>
            $(document).ready(function (e) {
                //alert("the written json working..")
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called , when form is submitted....
                    event.preventDefault();

                    console.log("you have clicked on Post button..")

                    let form = new FormData(this);


                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,

                        success: function (data, textStatus, jqXHR) {
                            //success....
                            console.log(data);
                            if (data.trim() == 'Done')
                            {
//                                this swal msg we have taken from https://sweetalert.js.org/guides/ site on google 
//                                 and for this we have added a script tag with src taken from google i..e from sweet alert cdn website
//                               i.e.   <scrip src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></scrip>
                                swal("Good job!", "saved successfully ", "success");
                            } else
                            {
                                swal("Error!!", "something went wrong try again...", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error....
                            swal("Error!!", "something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false

                    })
                })
            })
        </script>


        <!--loading post using ajax-->
        <script>
            
            function getPosts(catId,temp){
                $("#loader").show();
                $("#post-container").hide();
                
//                take all elements whose class is c-link
                 $(".c-link").removeClass('active')
                
                  $.ajax({
//                     this will load this url and whatever data is available in load_posts.jsp page will get saved in data variable used below
                     url: "load_posts.jsp",
                     data: {cid:catId},
                     success: function (data, textStatus, jqXHR) {
                        console.log(data);
//                        as soon as the page gets loaded , then after loading the page , the above loader should get hide
                          $("#loader").hide();
                          $("#post-container").show();
//                          all the data will get written here at this "post-container" id location
                          $("#post-container").html(data);
                          
//                          to mark the category as blue , when the category is clicked
                          $(temp).addClass('active')
                    }
                 })
            }
            
            $(document).ready(function (e){
                 // alert("loading my pagee..")
                 
//                 just after login , the "All Post" option should be selected in blue by default
                 let allPostRef=$('.c-link')[0]
                 getPosts(0,allPostRef)
               
            })
        </script>


    </body>
</html>
