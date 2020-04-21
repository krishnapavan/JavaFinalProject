<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div >
<nav class="navbar navbar-default">
  
    
    <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bugtracking tool</a>
    </div>
    <ul class="nav navbar-nav " style="float: right">
      <li><a href="default.jsp">Home</a></li>
      <li><a href="login.jsp?type=Manager">Manager</a></li>
      <li><a href="login.jsp?type=Developer">Developer</a></li>
      <li><a href="login.jsp?type=Tester">Tester</a></li>
      <li><a href="MailInfo.jsp">Contact Us</a></li>
    </ul>
  </div>
 

</nav>
  
</div>
 
 
 <div class="row">
 
<div class="col-sm-3">

</div>
 <div class="col-sm-4">
  
  <div id="myCarousel" class="carousel slide space " data-ride="carousel" style="width: 550px!important;">
  
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
<!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/bug1.png" alt="bug1" width="100%">
      </div>

      <div class="item">
        <img src="images/bug2.jpg" alt="bug2"  width="100%">
      </div>
    
      <div class="item">
        <img src="images/bug3.png" alt="bug3" width="100%">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
</div>
</div>

<div class="row">

<div class="container">

    <h1 class="my-4">Welcome to BugTracker</h1>

    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Project Manager</h4>
          <div class="card-body">
            <p class="card-text">A project manager is a person who has the overall responsibility for the successful initiation, planning, design, execution, monitoring, controlling and closure of a project.</p>
          </div>
          <div class="card-footer">
            <a href="https://www.projectsmart.co.uk/the-role-of-the-project-manager.php" target="_blank" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Software Developer</h4>
          <div class="card-body">
            <p class="card-text">Developers work in computer manufacturing companies or for software publishers. They are responsible for the design, testing and maintenance of software programs for computer operating systems or applications, such as word processing or database management systems.</p>
          </div>
          <div class="card-footer">
            <a href="https://work.chron.com/role-developer-16221.html" target="_blank" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Software Test Engineer</h4>
          <div class="card-body">
            <p class="card-text">A Software Tester is responsible for designing test scenarios for software usability, running these tests, and preparing reports on the effectiveness and defects to the production team.</p>
          </div>
          <div class="card-footer">
            <a href="https://www.betterteam.com/software-tester-job-description" target="_blank" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
