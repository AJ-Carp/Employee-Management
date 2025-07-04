<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
	.input-div {
		width: 550px;
		height: 500px
	}
</style>
</head>
<body>
<main class="row">
	<div class="input-div">
		<div class="col card border-0">
			<h2 class="card-header">Enter info for the new employee:</h2>
			
			<form class="card-body" method="post" action="AddEmp">
				<table>
					<tr>
						<td>Enter id:</td>
						<td><input type="text" name="id"></td>
					</tr>
					
					<tr>
						<td>Enter name:</td>
						<td><input type="text" name="name"></td>
					</tr>
					
					<tr>
						<td>Enter age:</td>
						<td><input type="text" name="age"></td>
					</tr>
					
					<tr>
						<td>Enter gender:</td>
						<td><input type="text" name="gender"></td>
					</tr>
					
					<tr>
						<td><input class="btn btn-success mt-3" type="submit"></td>
					</tr>
					
					<tr>
						<td><a href="index.jsp" class="btn btn-warning mt-3">Return to home</a></td>
					</tr>				
			
					<c:if test="${invalidInput}">
						<p>Invalid Input</p>
					</c:if>
					
					<c:if test="${rowsAffected > 0}">
						<p>New employee added</p>
					</c:if>
			
					<c:if test="${rowsAffected == 0}">
						<p>Employee not added, ID already exists</p>
					</c:if>	
				</table>
			</form>
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

 