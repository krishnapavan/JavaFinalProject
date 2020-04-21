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
<tr >
<td >Your Bug Detail</td></tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
	Statement stmt = con.createStatement();
	String query = "select * from bug where bugid="+(String)request.getParameter("bugid");
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next()){
	out.print("<tr><td bgcolor=#F2F2F2>Bug ID</td><td>"+rs.getString("bugid")+"</td><td bgcolor=#F2F2F2>Author</td><td>"+rs.getString("author")+"</td></tr>");
	out.print("<tr><td bgcolor=#F2F2F2>Project Name</td><td colspan=3>"+rs.getString("prodname")+"</td></tr>");
	out.print("<tr><td bgcolor=#F2F2F2>Environment</td><td>"+rs.getString("env")+"</td><td bgcolor=#F2F2F2>Type</td><td>"+rs.getString("type")+"</td></tr>");
	out.print("<tr><td colspan=4 bgcolor=#F2F2F2>Description</td></tr>");	
	out.print("<tr><td colspan=4 >"+rs.getString("description")+"</td></tr>");
	out.print("<tr><td bgcolor=#F2F2F2>Priority</td><td colspan=3>"+rs.getString("priority")+"</td></tr>");
	
	out.print("<tr><td bgcolor=#F2F2F2>Status</td><td>"+rs.getString("status")+"</td><td bgcolor=#F2F2F2>Responsible</td><td>"+rs.getString("assign_to")+"</td></tr>");
	}
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){
	System.out.print(e);
}  
%>
<tr><td colspan="4">Developer Comments/Solutions</td></tr>
<tr><td colspan="4">
<form name="form" method="post" action="addcomment.jsp">
<textarea cols="60" rows="4" class="inputtext" name="sol"></textarea>
<input type="hidden" name="bugid" value="<%=(String)request.getParameter("bugid")%>" />
<input type="hidden" name="developerid" value="<%=session.getAttribute("loginid")%>" />
<input type="hidden" name="developer" value="<%=session.getAttribute("user")%>" /><br /><br />
<div align="center"><input type="submit" value="Add Your Comment" /></div>
</form>
</td></tr>

</table>

<table class="table">
<tr><td >Audit Trail</td></tr>
<tr bgcolor=#F2F2F2><td>Developer</td><td class="smalltext">Comments</td></tr>
<%

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
	Statement stmt = con.createStatement();
	String query = "select * from solutions where bugid="+(String)request.getParameter("bugid");
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next()){
	out.print("<tr>");
	out.print("<td class=smalltext>"+rs.getString("developer")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("soln")+"</td>");
	out.print("</tr>");	
	}
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){
	System.out.print(e);
}  

%>
</table>
<div align="center"><hr width="100" /><a href="developer.jsp">Back</a><hr width="100" /></div>

</body>
</html>
