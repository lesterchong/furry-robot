package DB;

import java.sql.Connection;
import java.sql.SQLException;

public abstract class ConnectionFactory {
	
      public abstract Connection getConnection();
      
      public static ConnectionFactory getInstance()
      {
          return new ConcreteConnection();
      }
      
      public static void closeConnection(Connection connection)
      {
          try{
              connection.close();
          } catch (SQLException exception){
              exception.printStackTrace();
          }
      }
}
