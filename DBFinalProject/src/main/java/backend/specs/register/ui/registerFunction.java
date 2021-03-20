package backend.specs.register.ui;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backend.specs.register.applet.Applet;
import backend.specs.register.connect.Connect;

@WebServlet("/register")
public class registerFunction extends HttpServlet {
    private static final long serialVersionUID  = 1;
    private Connect connect;

    public void init() 
    {
    	connect = new Connect();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("userType"); 
        Applet app = new Applet();
        app.setUsername(username);
        app.setPassword(password);
        app.setType(type);
        String test = username + "username"; 

        try {
            if (connect.register(app)==1 && !test.equals("username"))
            {
                response.sendRedirect("regSuccess.jsp");
            } 
            else
            {
            	response.sendRedirect("regFailure.jsp");
            	return;
               // HttpSession session = request.getSession();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}