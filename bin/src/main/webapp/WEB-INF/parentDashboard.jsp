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
	
		<div class="d-flex">
				<div class="flex-grow-1">
			   		<h1>Parent Dashboard</h1>
			   		<h5>child point total</h5>
			   		<h5>child point total</h5>
			   						
				</div>
				<div class="d-flex  justify-content-end">			
			   		<a href="/logout" class="btn btn-secondary me-3">Logout</a>
				</div>   		
	   		</div>
	   		<div>
	   			<h3>Redeemed Rewards</h3>
		   		<table class="table table-primary table-striped mt-5">
					<thead>
					    <tr>				      
					      <th class="col-4">Reward</th>
					      <th class="col-3">Points</th>   
					      <th class="col-3">Redeemed by</th>   
					      <th class="col-3">Pay Up</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="reward" items="${redeemedRewards}">			<!-- LOOP -->
						<tr>
		   					<td>${reward.name}</td>			    					  					
		   					<td>${reward.cost}</td>	
		   					<td>${reward.user.name}</td>	
		   					<td>button</td>			   							    					  					
					  	</tr>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div>
	   			<h3>Completed Chores</h3>
		   		<table class="table table-primary table-striped mt-5">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-3">By Who</th>   
					      <th class="col-1">Value</th>   
					      <th class="" colspan="2">Actions</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${currentChores}">			<!-- LOOP -->
						<tr>
		   					<td>${chore.name}</td>			    					  					
		   					<td>${chore.user.name}</td>	
		   					<td>${chore.value}</td>	
		   					<td>Relist + Remove buttons</td>	
		   							    					  					
					  	</tr>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div>	   		
	   			<h3>Chores to be done</h3>
		   		<table class="table table-primary table-striped mt-5">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-1">Value</th>
					    
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<tr>
		   					<td>${chore.name}</td>			    					  					
		   					<td>${chore.value}</td>	
		   					    					  					
					  	</tr>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
			<div class="d-flex">
			<a href="" class="btn btn-primary btn-lg">Create new Chore/Reward</a>
			<a href="" class="btn btn-secondary btn-lg">Edit current Chore/Reward List</a>
			</div>
	</div>
</body>
</html>