package backend.specs.register.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import backend.specs.login.connect.Connect;
import backend.specs.register.applet.Applet;


public class Connect{

    
    public int register(Applet applet) throws ClassNotFoundException
    {
    	int status = 0;
//    	String userName = applet.getUsername();
//    	String password = applet.getPassword(); 
    	
    
    	String INSERT_USER = "INSERT INTO login" + "(username, password, userType) VALUES" + "(?,?,?);";
    	
    	Class.forName("com.mysql.jdbc.Driver"); 
    	 try (Connection connection = DriverManager
    	            .getConnection("jdbc:mysql://localhost:3306/Users?allowPublicKeyRetrieval=true", "root", "Success2021!!");
    			 PreparedStatement preparedStatement = connection
    			            .prepareStatement(INSERT_USER))
    	 					{
    			            preparedStatement.setString(1, applet.getUsername());
    			            preparedStatement.setString(2, applet.getPassword());
    			            preparedStatement.setString(3, applet.getType());

    			            System.out.println(preparedStatement);

    			            status = preparedStatement.executeUpdate();
    }catch (SQLException e) {
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
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}