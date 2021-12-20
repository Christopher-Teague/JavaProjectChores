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
    <title>Create a new Chore</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>Create new Chores + Rewards</h1>			
			</div>
			<div class="d-flex  justify-content-end">
		   		<a href="/editAvailable" class="btn btn-secondary me-3">Create Chore/Reward</a>
		   		<a href="/parentDashboard" class="btn btn-primary">Dashboard</a>				
			</div>   		
   		</div>
   			
		<div>
			CHORE FORM:FORM
		</div>
		<div>
			REWARD FORM:FORM
		</div>

	
	</div>
</body>
</html>