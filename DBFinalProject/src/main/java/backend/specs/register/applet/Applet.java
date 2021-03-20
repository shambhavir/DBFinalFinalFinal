package backend.specs.register.applet;

import java.io.Serializable;

public class Applet implements Serializable {
   
    private static final long serialVersionUID = 1;
    private String username;
    private String password;
    private String type; 

    
    
    public String getUsername() 
    {
        return username;
    }
    public String getPassword() 
    {
        return password;
    }
    public String getType()
    {
    	return type;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }

    public void setType(String type)
    {
    	this.type = type; 
    }

   
}