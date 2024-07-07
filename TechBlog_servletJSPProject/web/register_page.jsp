<%-- 
    Document   : register_page
    Created on : 24 Jun, 2024, 1:04:02 PM
    Author     : jeetesh.sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <!--link copied from "font awesome icons introduction from W3 school website" , so that we can use font awesome icons--> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- copied from this website , to zigzag the upper area https://bennettfeely.com/clippy/-->
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 66% 88%, 32% 97%, 0 88%, 0 0);
            }
        </style>
    </head>
    <body>

        <!--to take the navbar at this location-->
        <%@include file="normal_navbar.jsp" %>


        <main class="primary-background banner-background" style="padding-bottom: 110px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here
                        </div>

                        <div class="card-body">

                            <form action="RegisterServlet" method="POST" id="reg-form">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="Male">Male
                                    <input type="radio" id="gender" name="gender" value="Female">Female
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" id=""  rows="5" placeholder="Enter something about yourself"></textarea>

                                </div>


                                <div class="form-group form-check">
                                    <input name="checkbox" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
                                </div>

                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <h4>Please wait..</h4>
                                </div>


                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>

                        </div>

                        <!--                        <div class="card-footer">
                        
                                                </div>-->
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

        <!--sweet alert website i.e. https://cdnjs.com/libraries/sweetalert , so that we can use sweet alert from  https://sweetalert.js.org/guides/-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <!--AJAX based implementation , so that the Form page shows whether Done or not on same page , should not redirect to servlet page but data will
        be processed by form action servlet class only-->      
        <script>
            $(document).ready(function () {
                console.log("loaded");

                $("#reg-form").on('submit', function (event) {
//                    preventing to go on next page i.e. servlet out.print page
                    event.preventDefault();

//                    getting all the form data
                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();



                    //send this form to register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            //getting data from out.println(".....") from Registerservlet page 
                            if(data.trim()==='Done')
                            {
                   // used from https://sweetalert.js.org/guides/ website and above in script tag used library of this
                            swal("Registered Successfully..We are going to redirect to login page")
                                    .then((value) => {
                                        window.location="login_page.jsp"
//                                        swal(`The returned value is: ${value}`);
                                    });
                            }else
                             {
                                swal(data);
                             }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        
                            $("#submit-btn").show();
                            $("#loader").hide();
                        
                         // used from https://sweetalert.js.org/guides/ website and above in script tag used library of this
                        swal("Something went wrong , Please try again")
                        },
                        processData: false,
                        contentType: false

                    });



                })

            })
        </script>

    </body>
</html>
