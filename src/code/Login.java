package code;
import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String loginid=request.getParameter("loginid");
		String password=request.getParameter("password");
		String type=request.getParameter("type");
		boolean flag=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "12345qwert");
		   	Statement stmt = con.createStatement();
		   	String query = "select * from login where loginid ='" + loginid + "' and type='"+type+"'";
		   	ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				String pass= rs.getString("password");
			 	if( pass.equals(password)) {
					flag=true;
					break;
				}		
			}	
			if (flag){
			
				HttpSession session=request.getSession();
				session.setAttribute("login", "yes");
				session.setAttribute("type", rs.getString("type"));
				session.setAttribute("user", rs.getString("name"));
				session.setAttribute("loginid", rs.getString("loginid"));
				RequestDispatcher rd=null;
				if("Manager".equals(type))
					rd=request.getRequestDispatcher("manager.jsp");
				else if("Developer".equals(type))
					rd=request.getRequestDispatcher("developer.jsp");
				else if("Tester".equals(type))
					rd=request.getRequestDispatcher("tester.jsp");
				
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp?msg=loginerror");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.print(e);
		}
				
	}

}
