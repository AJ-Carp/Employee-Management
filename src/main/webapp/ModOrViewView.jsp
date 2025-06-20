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
<style>
	.input-div {
		width: 550px;
		height: 500px
	}
	.buttons {
		width: 150px;
	}
	@media (max-width: 805px) {
		.small-page-input {
			display: inline-block;
		}
		.small-page-buttons {
			display: inline-block;
			margin-top: 193px;
			margin-left: 15px;
		}
		.small-page-content {
			display: flex;
		}
	}
</style>
</head>
<body>
<main class="row">
	<div class="input-div">
		<div class="col card border-0">
			<h2 class="card-header">Enter the ID of the employee you would like to modify or view:</h2>
			<div class="card-body">
				<form method="post" action="ModOrView">
					<input type="hidden" name="action" value="enterId">
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
				
				<c:if test="${!empty idFound && !idFound}">
					ID not found
				</c:if>
				
				<c:if test="${invalidInput}">
					Invalid Input
				</c:if>
				
				<c:if test="${empModified}">
					Employee Info has been changed
				</c:if>

				<c:if test="${idFound}">
					<p>Leave option blank if you don't want to make a change
					<form method="post" action="ModOrView">
						<input type="hidden" name="action" value="modify">
						<input type="hidden" name="id" value="${emp.id}">
						<div class="small-page-content"> 
							<div class="small-page-input">	
								<table>	
									<tr>
										<td><p class="mb-2" >ID: ${emp.id} (cannot be changed)</p></td>
									</tr>
									<tr>
										<td>
											<p class="mb-1">Name: ${emp.name}</p>
											<input class="mb-2" type="text" name="name">
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-1">Age: ${emp.age}</p>
											<input class="mb-2" type="text" name="age">
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-1">Gender: ${emp.gender}</p>
											<input class="mb-2" type="text" name="gender">
										</td>
									</tr>
								</table>
							</div>
							
						
								
							<div class="small-page-buttons">
								<input class="btn btn-success buttons" type="submit" value="Commit changes">
							</div>
						</div>
								
					</form>
				</c:if>
			</div>
		</div>
	</div>
		
	<div class=" col">
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