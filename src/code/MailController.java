package code;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import code.SendMail;

@WebServlet("/MailController")
public class MailController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public MailController()
	{
		super();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String surname=request.getParameter("surname");
		String message=request.getParameter("message");
		String need = request.getParameter("need");
		String subject= name+" "+surname +" "+need;
		SendMail sendMail=new SendMail();
		
		boolean result = sendMail.SendMails(email, subject, message);
		
		if(result)
		{
			request.setAttribute("result", "Mail sent successfully");
		}
		else
		{
			request.setAttribute("result", "An exception occured!!! Please try after sometime");
		}

		RequestDispatcher rd=request.getRequestDispatcher("default.jsp");
		rd.include(request, response);
	}

}
