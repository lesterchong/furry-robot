package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class ConcreteConnection extends ConnectionFactory{
	private String dbName;
	private String username;
	private String password;
	private String driver;
	private String url;
        
    
    public ConcreteConnection(){
        ResourceBundle rc = ResourceBundle.getBundle("DB.DatabaseProperties");
        username = rc.getString("username");
        driver = rc.getString("driver");
        url = rc.getString("url");
        dbName = rc.getString("dbName");
        password = rc.getString("password");
    }
        
    public Connection getConnection(){
        try{
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url+dbName, username, password);
            return connection;
        } catch (ClassNotFoundException classNotFoundException){
            classNotFoundException.printStackTrace();
        } catch(SQLException sqlException){
            sqlException.printStackTrace();
        }
        return null;
    }
    
}
