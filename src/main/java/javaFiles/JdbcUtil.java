
package javaFiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {

    static {
        try {
            // Class.forName("com.mysql.cj.jdbc.Driver");
        	Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        // String url = "jdbc:mysql://mysql:3306/JDBC_Learning";
    	String host = System.getenv("DB_HOST"); 
        String port = System.getenv("DB_PORT"); 
        String db   = System.getenv("DB_NAME");
        String user = System.getenv("DB_USER");
        String pass = System.getenv("DB_PASS");

        String url = "jdbc:postgresql://" + host + ":" + port + "/" + db;


        return DriverManager.getConnection(url, user, pass);
    }

    public static void closeResources(Connection connect, Statement stmt) throws SQLException {
        if (connect != null) {
            connect.close();
        }
        if (stmt != null) {
            stmt.close();
        }
    }
}
