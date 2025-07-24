
package javaFiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://mysql-aj-carp.alwaysdata.net:3306/aj-carp_jdbc_learning?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String username = System.getenv("DB_USER");
        String password = System.getenv("DB_PASS");


        return DriverManager.getConnection(url, username, password);
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

