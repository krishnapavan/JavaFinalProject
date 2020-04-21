<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

<jsp:include page="menu.jsp"/>

<div class="container-fluid">

<div class="text-center">
	<%
	if("added".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Developer added</div>");
	%>
</div>
<table class="table">
  <tr>
    <td >
	<p>&nbsp;</p>
	<table class="table">
      <tr>
        <td ><a href="bugsmanager.jsp">View Bugs</a></td>
      </tr>
      <tr>
      <td ><a href="configexp.jsp">Configure Developer</a></td>
      </tr>
      <tr>
        <td ><a href="adddeveloper.jsp">Add Developer</a></td>
      </tr>
      <tr>
        <td ><a href="signup.jsp">Add Tester</a></td>
      </tr>
    </table></td>
    <td><p>As an Manager you can</p>
      <ul>
        <li>View all reported bugs, assign bugs to different Technical Experts to fix it. </li>
        <li>Configure different Technical Experts for different Teams for a particular Software Product. </li>
      </ul></td>
  </tr>
  
</table>
</div>
</body>
</html>
