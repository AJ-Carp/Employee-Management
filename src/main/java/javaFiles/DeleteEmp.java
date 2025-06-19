package javaFiles;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteEmp extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			EmployeeDao dh = new EmployeeDao();
			int id = Integer.parseInt(request.getParameter("id"));		
			Employee emp = dh.getEmployee(id);
			
			if (emp == null) {
				request.setAttribute("empNotFound", true);
				request.getRequestDispatcher("DeleteEmpView.jsp").forward(request, response);
			}
			
			dh.deleteEmployee(id);
			request.setAttribute("empDeleted", true);
			request.getRequestDispatcher("DeleteEmpView.jsp").forward(request, response);
			
		}
		catch (Exception e) {
			request.setAttribute("invalidInput", true);
			request.getRequestDispatcher("DeleteEmpView.jsp").forward(request, response);
		}
	}
}
