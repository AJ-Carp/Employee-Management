<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
	.input-div {
		width: 550px;
		height: 500px
	}
	.buttons {
		width: 150px;
	}
</style>
</head>
<body>
<main class="row">
	<div class="input-div">
		<div class="col card border-0">			
			<h2 class="card-header">Enter the ID of the employee you would like to delete:</h2>
			<div class="card-body">
				<form method="post" action="DeleteEmp">		
					<table>	
						<tr>
							<td><input type="text" name="id"></td>
							<td><input class="btn btn-success ml-3" type="submit"></td>
						</tr>
							
						<tr>
							<td><a href="index.jsp" class="btn mt-3 btn-warning buttons">Return to home</a><td>
						</tr>
					</table>
				</form>
				
				<c:if test="${empNotFound}">
					ID not found
				</c:if>
				
				<c:if test="${invalidInput}">
					Invalid Input
				</c:if>
				
				<c:if test="${empDeleted}">
					Employee Deleted
				</c:if>
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
			<table class="table">
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