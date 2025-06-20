package javaFiles;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddEmp extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name").trim();
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender").trim();
			
			if (name.equals("") || gender.equals("")) {
				throw new Exception();
			}
			
			Employee emp = new Employee(id, name, age, gender);
			int rowsAffected = new EmployeeDao().createEmployee(emp);
			
			System.out.println(rowsAffected);
			
			request.setAttribute("rowsAffected", rowsAffected);
			request.getRequestDispatcher("AddEmpView.jsp").forward(request,  response);		
		}
		catch (Exception e) {
			request.setAttribute("invalidInput", true);
			request.getRequestDispatcher("AddEmpView.jsp").forward(request,  response);
		}
	}
}  