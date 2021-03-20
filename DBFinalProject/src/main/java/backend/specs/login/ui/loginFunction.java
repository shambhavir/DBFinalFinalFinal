package backend.specs.login.ui;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backend.specs.login.connect.Connect;
import backend.specs.login.applet.Applet;

@WebServlet("/login")
public class loginFunction extends HttpServlet {
	private static final long serialVersionUID = 1;
	private Connect connect;

	public void init() {
		connect = new Connect();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		Applet applet = new Applet();
		applet.setUsername(username);
		applet.setPassword(password);
		applet.setType(userType);

      // System.out.print(username + "username");
		String test = username + "username"; 
		if(test == "username")
			System.out.print(1);
		System.out.println(test); 
		try 
		{
//			if(test == "username")
//			{
//				System.out.print("error");
//				response.sendRedirect("loginfailure.jsp"); 
//				return;
//			}

		 if (connect.loginVerify(applet, request, response) && !test.equals("username")) 
			{
//				if(test == "username")
					System.out.println(test); 
				response.sendRedirect("loginsuccess.jsp");
			}
//			else if(test != "username")
//			{
//				System.out.print("error");
//				response.sendRedirect("loginfailure.jsp");
//			}

			else
			{
				response.sendRedirect("loginfailure.jsp");
				System.out.print("test");
			}
		} 
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
}