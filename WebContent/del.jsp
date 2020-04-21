<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
String bugid=(String)request.getParameter("bugid");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
	Statement stmt = con.createStatement();
	String query = "delete from bug where bugid="+bugid;
	stmt.executeUpdate(query);
	query="delete from solutions where bugid="+bugid;
	stmt.executeUpdate(query);
		RequestDispatcher rd=request.getRequestDispatcher("bugsmanager.jsp");
		rd.forward(request, response);
	}catch(Exception e){
		RequestDispatcher rd=request.getRequestDispatcher("bugsmanager.jsp");
		rd.forward(request, response);
	}	
%>