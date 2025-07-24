package javaFiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

	Connection connect = null;
	PreparedStatement prepStmt = null;
	Statement stmt = null;
	
	public int createEmployee(Employee emp) {
		
		int rowsAffected = 0;
		
		try {
			connect = JdbcUtil.getConnection();
			
			String query = "INSERT INTO employees (id, name, age, gender) VALUES (?, ?, ?, ?)";
			prepStmt = connect.prepareStatement(query);
			
			prepStmt.setInt(1, emp.getId());
			prepStmt.setString(2, emp.getName());
			prepStmt.setInt(3, emp.getAge());
			prepStmt.setString(4, emp.getGender());
			
			rowsAffected = prepStmt.executeUpdate();
			return rowsAffected;
		
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				JdbcUtil.closeResources(connect, prepStmt);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rowsAffected;
	}
	
	
	public Employee getEmployee(int id) {
		
		ResultSet result = null;
		Employee emp = null;
		
		try {
			connect = JdbcUtil.getConnection();
			
			stmt = connect.createStatement();
			String query = "SELECT * FROM employees WHERE id = "+id;
			result = stmt.executeQuery(query);
			
			if (result.next()) {
				emp = new Employee(result.getInt(1), result.getString(2), result.getInt(3), result.getString(4));
				return emp;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				JdbcUtil.closeResources(connect, stmt);
				if (result != null) result.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return emp;
	}
	
	
	public void modifyEmployee(Employee emp, String newName, int newAge, String newGender) {
		
		try {
			connect = JdbcUtil.getConnection();
			String query = "UPDATE employees "
						 + "SET name = ?,"
					     + "age = ?,"
						 + "gender = ?"
					     + "WHERE id = "+emp.getId();
			prepStmt = connect.prepareStatement(query);
			
			prepStmt.setString(1, newName);
			prepStmt.setInt(2, newAge);
			prepStmt.setString(3, newGender);
			
			prepStmt.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteEmployee(int id) {
		
		try {
			connect = JdbcUtil.getConnection();
			stmt = connect.createStatement();
			String query = "DELETE FROM employees WHERE id = "+id;
			stmt.executeUpdate(query);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List getAllEmployees() {
			
		ResultSet result = null;
		List<Employee> empList = null;
		
		try {
			connect = JdbcUtil.getConnection();
			
			stmt = connect.createStatement();
			String query = "SELECT * FROM employees";
			result = stmt.executeQuery(query);
			
			empList = new ArrayList<>();
			
			while (result.next()) {
				empList.add(new Employee(result.getInt(1), result.getString(2), result.getInt(3), result.getString(4)));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				JdbcUtil.closeResources(connect, stmt);
				if (result != null) result.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return empList;
	}
}
