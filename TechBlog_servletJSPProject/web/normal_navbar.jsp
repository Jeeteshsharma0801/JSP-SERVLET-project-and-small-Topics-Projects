<%-- 
    Document   : normal_navbar
    Created on : 23 Jun, 2024, 8:29:11 AM
    Author     : jeetesh.sharma
--%>

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
          <a class="nav-link" href="login_page.jsp"> <span class="fa fa-user-circle"></span>Login</a>
      </li>
      
       <li class="nav-item">
           <a class="nav-link" href="register_page.jsp"> <span class="fa fa-user-plus"></span>Sign up</a>
      </li>
      
<!--      <li class="nav-item">
        <a class="nav-link " href="#">More..</a>
      </li>-->
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>    
        <!-- ends navbar from bootstrap-->