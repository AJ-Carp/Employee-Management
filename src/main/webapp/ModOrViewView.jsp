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
		<form method="post" action="ModOrView">
			<input type="hidden" name="action" value="enterId">
			<h2>Enter the ID:</h2>
			<input type="text" name="id">
			<input type="submit">
		</form>
		
		<c:if test="${idFound}">
			<p>Leave option blank if you don't want to make a change
			<form method="post" action="ModOrView">
				<input type="hidden" name="action" value="modify">
				<input type="hidden" name="id" value="${emp}">
				<div>
					<p>ID: ${emp.id} (ID cannot be changed)</p>
				</div>
				<div>
					<p>Name: ${emp.name}</p>
					<input type="text" name="name">
				</div>
				<div>
					<p>Age: ${emp.age}</p>
					<input type="text" name="age">
				</div>
				<div>
					<p>Gender: ${emp.gender}</p>
					<input type="text" name="gender">
				</div>
				<div>
					<input type="submit">
				</div>
			</form>
		</c:if>
		
		<c:if test="${!idFound}">
			<p>ID not found</p>
		</c:if>
		
		<c:if test="${invalidInput}">
			<p>Invalid Input</p>
		</c:if>
		
		<c:if test="${empModified}">
			<p>Employee Info has been changed</p>
		</c:if>
		
		<form action="index.jsp">
			<button type="submit">Return to home</button>
		</form>
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