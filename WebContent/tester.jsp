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

<table class="table">
  <tr>
    <td valign="top">
	<p>&nbsp;</p>
	<table class="table">
      <tr>
        <td bgcolor="#F2F2F2"><a href="reportbug.jsp">Report A New Bug</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" ><a href="viewbugs.jsp">View Status</a></td>
      </tr>
      
    </table></td>
    <td><p>Report a Bug:</p>
      <ul>
        <li>Select Product, Environment and Type for the Bug being reported by you.</li>
        <li>Try to describe your bug precisely and write the steps to reproduce the bug again.</li>
        <li>Also specify some erroneous behaviour of the program when bug appears. </li>
      </ul></td>
  </tr>
  
</table>

</body>
</html>
