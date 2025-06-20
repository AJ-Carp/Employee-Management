package javaFiles;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModOrView extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Employee emp = null;
		
		String action = (String)request.getParameter("action");

		if (action.equals("enterId")) {
			new EmployeeDao().getAllEmployees();
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				
				emp = new EmployeeDao().getEmployee(id);
				
				if (emp != null) {
					request.setAttribute("idFound", true);
					request.setAttribute("emp", emp);
				}
				else {
					request.setAttribute("idFound", false);
				}
				request.getRequestDispatcher("ModOrViewView.jsp").forward(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("invalidInput", true);
				request.getRequestDispatcher("ModOrViewView.jsp").forward(request, response);
			}
		}
  
			
		else if (action.equals("modify")) {
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				EmployeeDao dh = new EmployeeDao();
				emp = dh.getEmployee(id);
				
				String newName = request.getParameter("name").trim();
				String newAgeString = request.getParameter("age").trim();
				int newAge = 0;
				if (!newAgeString.equals("")) {
					newAge = Integer.parseInt(newAgeString);
				}
				String newGender = request.getParameter("gender").trim();
				
				// truth table lol
				// new everything
				if (!newName.equals("") && !newAgeString.equals("") && !newGender.equals("")) {
					dh.modifyEmployee(emp, newName, newAge, newGender);
				}
				// new name, new age, same gender
				else if (!newName.equals("") && !newAgeString.equals("") && newGender.equals("")) {
					dh.modifyEmployee(emp, newName, newAge, emp.getGender());
				}
				// new name, same age, new gender
				else if (!newName.equals("") && newAgeString.equals("") && !newGender.equals("")) {
					dh.modifyEmployee(emp, newName, emp.getAge(), newGender);
				}
				// new name, same age, same gender
				else if (!newName.equals("") && newAgeString.equals("") && newGender.equals("")) {
					dh.modifyEmployee(emp, newName, emp.getAge(), emp.getGender());
				}
				// same name, new age, new gender
				else if (newName.equals("") && !newAgeString.equals("") && !newGender.equals("")) {
					dh.modifyEmployee(emp, emp.getName(), newAge, newGender);
				}
				// same name, new age, same gender
				else if (newName.equals("") && !newAgeString.equals("") && newGender.equals("")) {
					dh.modifyEmployee(emp, emp.getName(), newAge, emp.getGender());
				}
				// same name, same age, new gender
				else if (newName.equals("") && newAgeString.equals("") && !newGender.equals("")) {
					dh.modifyEmployee(emp, emp.getName(), emp.getAge(), newGender);
				}
				// same everything
				else {
					throw new Exception();
				}
				request.setAttribute("empModified", true);
				request.getRequestDispatcher("ModOrViewView.jsp").forward(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("emp", emp);
				request.setAttribute("invalidInput", true);
				request.setAttribute("idFound", true);
				request.getRequestDispatcher("ModOrViewView.jsp").forward(request, response);
			}
		}
	}
}

