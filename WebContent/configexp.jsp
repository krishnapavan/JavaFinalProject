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

<jsp:include page="menu.jsp"/>

<table class ="table">
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
        <td >&nbsp;</td>
      </tr>
      
    </table></td>
    <td valign="top">
	<p>&nbsp;</p>
	<form name="form1" method="post" action="configexp1.jsp">
	<table class="table">
	
	<%
	if("success".equals((String)request.getParameter("msg"))){
	out.print("<tr><td colspan=2 bgcolor=#FFD7AE class=smalltext align=center height=25><font color=blue>Expert Configured Successfully!</font></td></tr>");
	}else if("error".equals((String)request.getParameter("msg"))){
		out.print("<tr><td colspan=2 bgcolor=#FFD7AE class=smalltext align=center height=25><font color=red>Expert already configured for this Product.</font></td></tr>");
	}
	
	
	%>
      <tr>
        <td >Configuring Developers for Software Teams. </td>
      </tr>
      <tr>
        <td>Project</td>
        <td>
		<select name="prodid" class="inputtext">
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
		Statement stmt = con.createStatement();
		String query = "select * from products";
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			out.print("<option value="+rs.getString("prodid")+">"+rs.getString("prodname")+"-"+rs.getString("version")+"</option>");
		
		}
		rs.close();
		%>
		</select>		</td>
      </tr>
      <tr>
        <td>Developer </td>
        <td>
		<select name="developerid" class="inputtext">
		<%
		query = "select * from login where type='Developer'";
		rs = stmt.executeQuery(query);
		while(rs.next()){
			out.print("<option value="+rs.getString("loginid")+">"+rs.getString("name")+"</option>");
		
		}
		rs.close();
		con.close();
		%>
		</select>		</td>
      </tr>
      <tr>
        <td ><input type="submit" name="Submit" value="Submit" class="inputtext"/></td>
        </tr>
    </table>
	</form>		</td>
  </tr>
  
</table>

</body>
</html>
