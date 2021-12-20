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
    <title>Redeem your Points</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex">
				<div class="flex-grow-1">
			   		<h1>${userName}, Redeem your points</h1>
			   		<h5>Total points: ${pointTotal}</h5>
				
				</div>
				<div class="d-flex  justify-content-end">
			   		<a href="/childDashboard" class="btn btn-primary ">Dashboard</a>				
				</div>   		
	   		</div>
	   		<div>
	   			<h3>Current Chores</h3>
		   		<table class="table table-primary table-striped mt-5">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-1">Value</th>
					      <th class="col-3"></th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<tr>
		   					<td>${chore.name}</td>			    					  					
		   					<td>${chore.value}</td>	
		   					<td>Complete button</td>		    					  					
					  	</tr>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>

	   		<div>
	   			<h3>Rewards</h3>
		   		<table class="table table-primary table-striped mt-5">
					<thead>
					    <tr>				      
					      <th class="col-4">Reward</th>
					      <th class="col-1">Cost</th>   
					      <th class="col-3"></th>
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="reward" items="${currentRewards}">			<!-- LOOP -->
						<tr>
		   					<td>${reward.name}</td>			    					  					
		   					<td>${reward.value}</td>	
		   					<td>redeem button</td>		    					  					
					  	</tr>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div>
	   			<h3>Redeemed Rewards</h3>
		   		<table class="table table-primary table-striped mt-5">
					<thead>
					    <tr>				      
					      <th class="col-4">Reward</th>
					      <th class="col-3">Points</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="reward" items="${redeemedRewards}">			<!-- LOOP -->
						<tr>
		   					<td>${reward.name}</td>			    					  					
		   					<td>${reward.cost}</td>	
		   							    					  					
					  	</tr>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	
	
	</div>
</body>
</html>