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
    <title>New Ninja</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<div>
			<div>
				<a href="/dojos/new">Add a Dojo</a>
			</div>
			<h3>New Ninja</h3>
		</div>
		<div>
	    	<form:form action="/ninjas/create" method="POST" modelAttribute="ninja">
	    	   <div class="row my-2">
	    	   <form:label path="dojo" class="col-2">Dojos:</form:label>
	    	   <form:select path="dojo" class="col-5" type="text">
	    	   <c:forEach items="${ dojos }" var="dojo">
	    	   		<form:option value="${ dojo.id }"><c:out value="${ dojo.name }"/></form:option>
	    	   </c:forEach>
	    	   </form:select>
	    	   </div>
	           <div>
	               <form:label path="firstName" class="col-2">First Name:</form:label>
	               <form:input path="firstName" class="col-5" type="text"/>
	               <form:errors path="firstName" class="col-2 text-danger"/>
	           </div>
	           <div>
	               <form:label path="lastName" class="col-2">Last Name:</form:label>
	               <form:input path="lastName" class="col-5" type="text" name="lastName"/>
	               <form:errors path="lastName" class="col-2 text-danger"/>
	           </div>
	           <div>
	               <form:label path="age" class="col-2">Age:</form:label>
	               <form:input path="age" class="col-5" type="number" name="age" min="10"/>
	               <form:errors path="age" class="col-2 text-danger"/>
	           </div>
	           <div>
	           		<div>
	         	      <button type="submit">Submit</button>
	           		</div>
	           </div>
	       </form:form>
		</div>
	</div>
</body>
<html>