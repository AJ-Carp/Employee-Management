<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mod/View Employee</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<style>
	.input-div {
		width: 550px;
		height: 450px;
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
			<h2 class="card-header">Enter the ID:</h2>
			<div class="card-body">
				<form method="post" action="ModOrView">
					<input type="hidden" name="action" value="enterId">
					<table>
						<tr>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<td><input class="btn btn-success mt-3 mb-3" type="submit"></td>
						</tr>
					</table>
				</form>
				
				<c:if test="${!empty idFound && !idFound}">
					<p>ID not found</p>
				</c:if>
				
				<c:if test="${invalidInput}">
					<p>Invalid Input</p>
				</c:if>
				
				<c:if test="${empModified}">
					<p>Employee Info has been changed</p>
				</c:if>

				<c:if test="${idFound}">
					<p>Leave option blank if you don't want to make a change
					<form method="post" action="ModOrView">
						<input type="hidden" name="action" value="modify">
						<input type="hidden" name="id" value="${emp.id}">
						<table>			
							<tr>
								<td><p class="mb-3" >ID: ${emp.id} (ID cannot be changed)</p></td>
							</tr>
							<tr>
								<td>
									<p class="mb-1">Name: ${emp.name}</p>
									<input class="mb-3" type="text" name="name">
								</td>
							</tr>
							<tr>
								<td>
									<p class="mb-1">Age: ${emp.age}</p>
									<input class="mb-3" type="text" name="age">
								</td>
							</tr>
							<tr>
								<td>
									<p class="mb-1">Gender: ${emp.gender}</p>
									<input class="mb-3" type="text" name="gender">
								</td>
							</tr>
							<tr>
								<td><input class="btn btn-success mb-3 buttons" type="submit" value="Commit changes"></td>
							</tr>
						</table>	
					</form>
				</c:if>
				
				<a href="index.jsp" class="btn btn-warning buttons">Return to home</a>
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