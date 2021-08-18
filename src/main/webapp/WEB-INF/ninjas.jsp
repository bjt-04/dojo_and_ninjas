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
    <title>Ninjas</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="ninjas">
    <h1>Ninjas</h1>
    <c:forEach begin="1" end="${totalPages}" var="index">
        <a href="/pages/${index}">${index}</a>
    </c:forEach>
    <table class="table">
        <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="ninja" items="${ninjas.content}">                 
            <tr>
                <td><c:out value="${ninja.firstName}"></c:out></td>
                <td><c:out value="${ninja.lastName}"></c:out></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <table class="table">
        <thead>
        <tr>
            <th>Dojo Name</th>
            <th>Ninja First Name</th>
            <th>Ninja Last Name</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="ninja" items="${ninjadojos.content}" >                 
            <tr>
                <td><c:out value="${ninjadojos[1].name }"></c:out></td>
                <td><c:out value="${ninjadojos[0].firstName}"></c:out></td>
                   <td><c:out value=" ${ninjadojos[0].lastName}"></c:out></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
<html>