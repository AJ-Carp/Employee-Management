
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
        	System.out.println("running!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"); 
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
//        String url = "jdbc:mysql://localhost:3306/JDBC_Learning";
//        String user = "root";
//        String pass = "Bobbysbakery69$";
//    	String host = System.getenv("DB_HOST"); 
//    	String port = System.getenv("DB_PORT"); 
//        String db   = System.getenv("DB_NAME");
//        String user = System.getenv("DB_USER");
//        String pass = System.getenv("DB_PASS");
        
    	String host = "dpg-d2173vmuk2gs73fujdo0-a.internal";  // internal hostname
        String port = "5432";
        String db   = "jdbc_learning";
        String user = "jdbc_learning_user";
        String pass = "ByX6HQMGCH7aeQIN37tDVNlDArzKpcSM";
       
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
