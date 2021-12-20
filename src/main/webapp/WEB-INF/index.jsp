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
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
	
		<div class="p-5">
				<h3>Login</h3>
	    		<form:form action="/login" method="post" modelAttribute="newLogin">
	        	<div class="form-group">
	           		<label>Name:</label>
	            	<form:input path="name" class="form-control" />
	            	<form:errors path="name" class="text-danger" />
	        	</div>
	        	<div class="form-group">
	            	<label>Password:</label>
	            	<form:password path="password" class="form-control" />
	            	<form:errors path="password" class="text-danger" />
		        </div>
	    		    <input type="submit" value="Login" class="btn btn-success mt-2" />
	    		</form:form>
			</div>	
	
	</div>
</body>
</html>