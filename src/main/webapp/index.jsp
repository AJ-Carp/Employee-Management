<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
<main class="row">
	<div class="col">
		<h2>What would you like to do?</h2>
		<div>
			<div>
		 		<form method="post" action="AddEmpView.jsp">
	   				<button type="submit">Add New Employee</button>
				</form>
			</div>
		
			<div>
		 		<form method="post" action="ModOrViewView.jsp">
	   				<button type="submit">Modify/View Employee</button>
				</form>
			</div>
			
			<div>
		 		<form method="post" action="DeleteEmpView.jsp">
	   				<button type="submit">Delete Employee</button>
				</form>
			</div>
		</div>
	</div>
	
	<div class="col">
		<%@ page import="javaFiles.Employee" %>
		<%@ page import="javaFiles.EmployeeDao" %>
		<%@ page import="java.util.List" %>
		<%
			List<Employee> empList = new EmployeeDao().getAllEmployees();
			request.setAttribute("empList", empList);
		%>
		
		<div>
			<table>
	    		<thead>
	        		<tr>
			            <th>ID</th>
			            <th>Name</th>
			            <th>Age</th>
			            <th>Gender</th>
	       			</tr>
	    		</thead>
		    	<tbody>
			        <c:forEach var="emp" items="${empList}">
			            <tr>
		                	<td><c:out value="${emp.getId()}" /></td>
			                <td><c:out value="${emp.getName()}" /></td>
			                <td><c:out value="${emp.getAge()}" /></td>
			                <td><c:out value="${emp.getGender()}" /></td>
			            </tr>
			        </c:forEach>
		    	</tbody>
			</table>
		</div>
	</div>
</main>
</body>
</html>

 
 
 
 
