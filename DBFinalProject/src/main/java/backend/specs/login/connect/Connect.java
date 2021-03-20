package backend.specs.login.connect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import backend.specs.login.applet.Applet;

public class Connect {

    public boolean loginVerify(Applet applet, HttpServletRequest request,HttpServletResponse response ) throws ClassNotFoundException, IOException 
    {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/Users?useSSL=false", "root", "Success2021!!");

            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from login where username = ? and password = ? and userType = ?")) {
//        	if(applet.getUsername() == "2") {
//        		System.exit(0); 
//        	}
            preparedStatement.setString(1, applet.getUsername());
            preparedStatement.setString(2, applet.getPassword());
            preparedStatement.setString(3, applet.getType());

            
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    t = t.getCause();
                }
            }
        }
    }
}