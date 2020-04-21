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

<div align="center">
You can update Priority, Status and Responsible Expert for this Bug.</div>
<form name="form" method="post" action="updatebug1.jsp">
<input type="hidden" name="bugid" value="<%=(String)request.getParameter("bugid")%>" />
<table class="table">
<tr bgcolor="#0054A8" >
<td colspan="4">Bug Detail</td></tr>
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
	
	out.print("<tr bgcolor=#F2F2F2><td>&nbsp;</td><td>Current Stage</td><td>New Stage</td><td>&nbsp;</td></tr>");
	out.print("<tr><td bgcolor=#F2F2F2>Priority</td><td>"+rs.getString("priority")+"</td>");
	out.print("<td>");
	out.print("<select name=priority class=inputtext>");
	out.print("<option value='Low'>Low</option><option value='Medium'>Medium</option><option value='High'>High</option>");
	out.print("</select>");	
	out.print("</td><td>&nbsp;</td></tr>");
	
	out.print("<tr><td bgcolor=#F2F2F2>Status</td><td>"+rs.getString("status")+"</td>");
	out.print("<td>");
	out.print("<select name=status class=inputtext>");
	out.print("<option value='New'>New</option><option value='Assigned'>Assigned</option><option value='Fixed'>Fixed</option><option value='Closed'>Closed</option>");
	out.print("</select>");	
	out.print("</td><td>&nbsp;</td></tr>");
	
	out.print("<tr><td bgcolor=#F2F2F2>Responsible</td><td>"+rs.getString("assign_to")+"</td>");
	out.print("<td>");
	out.print("<select name=assign_to class=inputtext>");
	
	query = "select loginid, name from login where loginid in (select developerid from developer where prodid='"+rs.getString("prodid")+"')";
	System.out.print(query);
	ResultSet rs1 = stmt.executeQuery(query);
	while(rs1.next()){
		out.print("<option value="+rs1.getString(1)+">"+rs1.getString(2)+"</option>");		
	}	
	rs1.close();
	out.print("</select>");	
	out.print("</td><td>&nbsp;</td></tr>");
	}
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){
	System.out.print(e);
}  
%>
<td > <input type="submit" name="update" value="Update" /></td>
</table>
</form>
<table class="table">
<tr><td >Audit Trail</td></tr>
<tr bgcolor=#F2F2F2><td >Developer</td><td>Comments</td></tr>
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
<div align="center"><hr width="100" /><a href="bugsmanager.jsp">Back</a><hr width="100" /></div>

</body>
</html>
