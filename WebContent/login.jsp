<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, javax.servlet.*" errorPage="" %>
<%
String login = (String)session.getAttribute("login");
if("yes".equals(login)){
	RequestDispatcher rd=null;
	
	if("Manager".equals((String)request.getParameter("type")) && "Manager".equals((String)session.getAttribute("type")))
		rd=request.getRequestDispatcher("manager.jsp");
	else if("Developer".equals((String)request.getParameter("type")) && "Developer".equals((String)session.getAttribute("type")))
		rd=request.getRequestDispatcher("developer.jsp");
	else if("Tester".equals((String)request.getParameter("type")) && "Tester".equals((String)session.getAttribute("type")))
		rd=request.getRequestDispatcher("tester.jsp");
	else
		rd=request.getRequestDispatcher("loginerror.jsp");
	rd.forward(request, response);	
}
else{
%>
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
      <a class="navbar-brand" href="default.jsp">Bugtracking Tool</a>
    </div>
    <ul class="nav navbar-nav" style="float: right">
      <li><a href="default.jsp">Home</a></li>
	<li><a href="login.jsp?type=Manager">Manager</a></li>
	<li><a href="login.jsp?type=Developer">Developer</a></li>
	<li><a href="login.jsp?type=Tester">Tester</a></li>
	<li><a href="MailInfo.jsp">Contact Us</a></li>
    </ul>
  </div>
  
</nav>
</div>

<div class="col-sm-4">
</div>

<div class="col-sm-4">

    
    <form class="text-center" id="form" name="form" method="post" action="Login">

    <p class="h4 mb-4">Login as <%=(String)request.getParameter("type")%></p>

    <!-- Email -->
    <div class="form-group ">
    <input type="text" name="loginid" class="form-control" placeholder="Username">
	<br>
	
    <!-- Password -->
    
    <input type="password" name ="password" class="form-control" placeholder="Password">
	
    
	<input type="hidden" name="type" value="<%=(String)request.getParameter("type")%>" />
	</div>
    <!-- Sign in button -->
    <br>
    
    
    <button class="btn btn-info btn-block" type="submit">Login</button>
  
    
    <p>&nbsp;</p>
    <%
		if("loginerror".equals((String)request.getParameter("msg")))
		out.println("<div class=errortext align=center><font color=red>Invalid Login ID or Password.</div>");
		%>  
	
	<%
	String type = (String)request.getParameter("type");
	
	if ("Tester".equals((String)request.getParameter("type"))){
		out.println("<tr><td bgcolor=#F2F2F2 height=25><font color=red>New User Please contact Manager </td></tr>");	
	}
	%>
    

</form>
      

</body>
</html>
<%}%>
