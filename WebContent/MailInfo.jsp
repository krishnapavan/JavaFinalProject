<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Mail details</title>
		
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
		<nav class="navbar navbar">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <p class="navbar-brand" align="center"><font color="white">Contact</font></p>
		    </div>  
		  </div>
		</nav>
		
	
	<div class="container">
	
	<h3>Contact Us</h3>
	<br>
	<form id="contact-form" method="post" action="MailController" role="form">


        <div class="row align-items-center">
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_name">Firstname *</label>
                    <input id="form_name" type="text" name="name" class="form-control" placeholder="Please enter your firstname *" required="required" data-error="Firstname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">	
                    <label for="form_lastname">Lastname *</label>
                    <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Please enter your lastname *" required="required" data-error="Lastname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_email">Email *</label>
                    <input id="form_email" type="email" name="email" class="form-control" placeholder="Please enter your email *" required="required" data-error="Valid email is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="form_need">Please specify your need *</label>
                    <select id="form_need" name="need" class="form-control" required="required" data-error="Please specify your need.">
                        <option value=""></option>
                        <option value="Add Teater">Add Tester</option>
                        <option value="Add Developer">Add Developer</option>
                        <option value="Regarding Bug">Regarding Bug</option>
                        <option value="Other">Other</option>
                    </select>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <div class="form-group">
                    <label for="form_message">Message *</label>
                    <textarea id="form_message" name="message" class="form-control" placeholder="Message for me *" rows="4" required="required" data-error="Please, leave us a message."></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
        	<div class="col-sm-3">
        	</div>
            <div class="col-sm-3">
                <input type="submit" class="btn btn-success btn-send" value="Send message">
            </div>
        
        </div>
        <div class="row">
        <div class="col-sm-2">
        </div>
            <div class="col-sm-4">
                <p class="text-muted">
                    <strong>*</strong> These fields are required.
                    
            </div>
        </div>
    

</form>
</div>
	</body>
</html>