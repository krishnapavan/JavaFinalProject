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


<ul>
<li>This is List of all Reported Bugs assigned to you. 
<li>Find out the possibel causes, try to fix it and provide satisfactory comments.</ul>
<table class="table">
<tr  >
<td>Bug ID</td>
<td>Product</td>
<td>Env.</td>
<td>Type</td>
<td>Synopsis</td>
<td>Status</td>
<td>&nbsp;</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
	Statement stmt = con.createStatement();
	String query = "select * from bug where assign_to='"+(String)session.getAttribute("loginid")+"'";
	ResultSet rs = stmt.executeQuery(query);
	int i=2;
	while(rs.next()){
	if(i%2==0)
	out.println("<tr bgcolor=#CEE7FF>");
	else
	out.println("<tr bgcolor=#E8F3FF >");
	i++;
	out.print("<td class=smalltext>"+rs.getString("bugid")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("prodname")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("env")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("type")+"</td>");
	out.print("<td class=smalltext>");
	String des=rs.getString("description");
	if(des.length()>40)
	des=des.substring(0,40)+". . .";
	out.println(des);
	out.print("</td>");
	out.print("<td class=smalltext>"+rs.getString("status")+"</td>");
	out.print("<td class=smalltext><a href='bugcomment.jsp?bugid="+rs.getString("bugid")+"'>Comment</a></td>");	
	out.println("</tr>");		
	}
	out.println("</table>");
	out.print("<div align=left> Total Bugs: "+(i-2)+"</div>");
}catch(Exception e){
	System.out.print(e);
}  
%>

</body>
</html>
