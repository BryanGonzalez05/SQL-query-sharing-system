import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;

public class DB_connection {

        //change this to actual url
        private static final String url = "jdbc:mysql://localhost:YOUR_PORT/YOUR_DBNAME";
        private static final String user = "YOUR_USER";
        private static final String password = "YOUR_PWORD";

      public static Connection getConnection() throws SQLException {
          return DriverManager.getConnection(url, user, password);
      }

}
