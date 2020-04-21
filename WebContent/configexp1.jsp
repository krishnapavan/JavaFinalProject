<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
String prodid=(String)request.getParameter("prodid");
String developerid=(String)request.getParameter("developerid");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
	Statement stmt = con.createStatement();
	String query = "insert into developer values('"+developerid+"','"+prodid+"')";
	stmt.executeUpdate(query);
		RequestDispatcher rd=request.getRequestDispatcher("configexp.jsp?msg=success");
		rd.forward(request, response);
	}catch(Exception e){
		RequestDispatcher rd=request.getRequestDispatcher("configexp.jsp?msg=error");
		rd.forward(request, response);
	}	
%>