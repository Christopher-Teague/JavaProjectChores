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
		   		<a href="/edit/choreList" class="btn btn-secondary me-3">Edit Available Chores</a>
		   		<a href="/parentDashboard" class="btn btn-primary">Dashboard</a>				
			</div>   		
   		</div>
   			
		<div class="mt-4 p-3">
			<h3>Create a new Chore</h3>
			<form:form class="form-control" action="/chore/new" method="post" modelAttribute="newChore">       	  		
		
		  		<form:input type="hidden" value="${user_id}" path="user"/>		  		
		
		  		<form:label path="choreName" class="form-label">Name of chore:</form:label>
		  		<form:errors path="choreName" class="text-danger"/>
		    	<form:input path="choreName" class="form-control"/>	    
		  		
		  		<form:label path="value" class="form-label">Point value:</form:label>
		  		<form:errors path="value" class="text-danger"/>
		    	<form:input path="value" class="form-control"/>	   
			        	   	
		  		<button type="submit" class="btn btn-primary mt-2">Submit</button>
			  
        	</form:form>
		</div>
		<div class="mt-4 p-3">
			<h3>Create a new Reward</h3>
			<form:form class="form-control" action="/reward/new" method="post" modelAttribute="newReward">       	  		
		
		  		<form:input type="hidden" value="${user_id}" path="user"/>		  		
		
		  		<form:label path="rewardName" class="form-label">Reward name:</form:label>
		  		<form:errors path="rewardName" class="text-danger"/>
		    	<form:input path="rewardName" class="form-control"/>	    
		  		
		  		<form:label path="cost" class="form-label">Reward cost:</form:label>
		  		<form:errors path="cost" class="text-danger"/>
		    	<form:input path="cost" class="form-control"/>	   
		        	   	
		  		<button type="submit" class="btn btn-primary mt-2">Submit</button>
			  
        	</form:form>
		</div>

	
	</div>
</body>
</html>