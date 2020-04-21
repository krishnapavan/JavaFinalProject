<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%
String bugid=(String)request.getParameter("bugid");
String developerid=(String)request.getParameter("developerid");
String developer=(String)request.getParameter("developer");
String sol=(String)request.getParameter("sol");
try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
		    					
			String insertquery = "insert into solutions values(?,?,?,?,?)" ;
			PreparedStatement prestmt = con.prepareStatement(insertquery);
		    
			prestmt.setString(1,bugid);
		    prestmt.setString(2,developerid);
		    prestmt.setString(3,developer);
		    prestmt.setString(4,sol);
		    
		    Calendar cal = new GregorianCalendar();
		    int year = cal.get(Calendar.YEAR);            
		    int mm = cal.get(Calendar.MONTH);           
		    int dd = cal.get(Calendar.DAY_OF_MONTH);
		    java.sql.Date date=new java.sql.Date(year, mm, dd);
		    System.out.println(date);
		    prestmt.setDate(5,date);
		   
		    prestmt.executeUpdate();
		    prestmt.close();
			con.close();
			
			RequestDispatcher rd=request.getRequestDispatcher("bugcomment.jsp?bugid="+bugid);
			rd.forward(request, response);
			
		}catch(Exception e){System.out.println(e);
			RequestDispatcher rd=request.getRequestDispatcher("bugcomment.jsp?bugid="+bugid);
			rd.forward(request, response);
		}	
%>