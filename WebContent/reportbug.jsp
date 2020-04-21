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
	
	<table class="table">
	<%
	if("error".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Field Blank or Some Database Error!</div>");
	%>
      <tr>
        <td bgcolor="#F2F2F2" ><a href="reportbug.jsp">Report A New Bug</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" ><a href="viewbugs.jsp">View Status</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2">&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2">&nbsp;</td>
      </tr>
    </table>
	
	</td>
    <td><form id="form1" name="form1" method="post" action="ReportBug">
      <table class="table">
        <tr>
          <td >Reporting Bug</td>
          </tr>
        <tr>
          <td>Project</td>
          <td><select name="prodid" class="inputtext">
		  <%
		  try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
		   	Statement stmt = con.createStatement();
		   	String query = "select * from products";
		   	ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				out.print("<option value=");
				out.print(rs.getString("prodid")+">");
				out.print(rs.getString("prodname")+" - "+rs.getString("version"));
				out.print("</option>");		
			}
		}catch(Exception e){
			
		}  
		 %></select></td>
        </tr>
		<tr>
          <td>Environment</td>
          <td>
		  <select name="env" class="inputtext">
		  <option value="Development">Development</option>
		  <option value="Production">Production</option>
		  <option value="Testing">Testing</option>
		  </select>		  </td>
        </tr>
		<tr>
          <td>Type</td>
          <td>
		  <select name="type" class="inputtext">
		  <option value="Front-End">Front-End</option>
		  <option value="Database">Database</option>
		  <option value="Back-End">Back-End</option>
		  </select>		  </td>
        </tr>
        <tr>
          <td valign="top">Bug Description </td>
          <td><textarea cols="40" rows="8" class="inputtext" name="description"></textarea></td>
        </tr>
        <tr>
          <td >
		  <input type="hidden" name="authorid" value="<%=(String)session.getAttribute("loginid")%>" />
  		  <input type="hidden" name="author" value="<%=(String)session.getAttribute("user")%>" />
		  </td>
          </tr>
        <tr>
          <td ><input type="submit" value="Submit" class="inputtext" />
		  <input type="reset" value="Reset" class="inputtext"/>
		  </td>
          </tr>
      </table>
        </form>	</td>
  </tr>
</table>

</body>
</html>
