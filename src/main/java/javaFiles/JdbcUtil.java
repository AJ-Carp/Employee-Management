package javaFiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/JDBC_Learning";
		String username = "root";
		String password = "";
		
		Connection connect = DriverManager.getConnection(url, username, password);
		return connect;
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
