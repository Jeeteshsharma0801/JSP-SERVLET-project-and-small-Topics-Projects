<%-- 
    Document   : login_page
    Created on : 24 Jun, 2024, 12:23:51 PM
    Author     : jeetesh.sharma
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <!--link copied from "font awesome icons introduction from W3 school website" , so that we can use font awesome icons--> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- copied from this website , to zigzag the lower area of this class by adjusting the shape acc. to requirement on website
        https://bennettfeely.com/clippy/-->
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 66% 88%, 32% 97%, 0 88%, 0 0);
            }
        </style>

    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center primary-background banner-background " style="height: 85vh; padding-bottom: 55px;" >
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login Here</p>
                            </div>

                            <!--to show the error msg , if invalid credentials found.-->
                            <!--and this is we are getting through session set in LoginServlet code-->
                            <!--this alert is taken from bootstrap-->
                            <%
                                Message m = (Message)session.getAttribute("msg");
                                if (m != null) {
                            %>
                            
<!--                             <div class="alert alert-primary" role="ale rt">-->
                                 <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div>

                            <%
                                session.removeAttribute("msg");
                                }
                            %>

                            <div class="card-body">

                                <!--taking form from bootstrap-->
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <!--                                    <div class="form-group form-check">
                                                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                                                        </div>-->
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

                            </div>

                            <div class="card-footer">

                            </div>


                        </div>
                    </div>

                </div>
            </div>

        </main>


        <!--java scripts-->
        <!--added from "jquery cdn" google-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <!--taken from js bootstrap-->
        <!--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

        <!--added by drage and drop from file below js link , so that my js file should be included here in this jsp page--> 
        <script src="js/myjs.js" type="text/javascript"></script>
        <!--        <script>
                    $(document).ready(function(){
                        alert("document loaded !")
                    })
                </script>-->

    </body>
</html>
