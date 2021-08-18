<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dojo Details</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<div>
			<div>
				<a href="/ninjas/new">Add a Ninja</a> |
				<a href="/dojos/new">Add a Dojo</a>
			</div>
			<h3><c:out value="${ dojo.name }"/> Location Ninjas</h3>
		</div>
		<div>
			<table>
				<thead>
					<tr>
						<th scope="col">First Name</th>
				      	<th scope="col">Last Name</th>
				      	<th scope="col">Age</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ dojo.ninjas }" var="ninja">
					<tr>
					  	<td scope="row"><c:out value="${ ninja.firstName }"/></td>
						<td scope="row"><c:out value="${ ninja.lastName }"/></td>
					  	<td scope="row"><c:out value="${ ninja.age }"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<html>