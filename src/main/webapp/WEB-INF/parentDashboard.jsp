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
			   		<table>
			   			<tbody>
			   			<c:forEach var="user" items="${users}">
			   			<c:if test="${!user.isParent }">
			   			<tr>
			   				<td><h5>${user.userName} has ${user.pointTotal} points</h5></td>
			   			</tr>
			   			</c:if>
			   			</c:forEach>
			   			</tbody>
			   		</table>
			   						
				</div>
				<div class="d-flex  justify-content-end">			
			   		<a href="/logout" class="btn btn-secondary h-50 me-3">Logout</a>
				</div>   		
	   		</div>
	   		<div class="mt-3 p-2">
	   			<h3>Redeemed Rewards</h3>
		   		<table class="table table-primary table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Reward</th>
					      <th class="col-3">Points</th>   
					      <th class="col-3">Redeemed by</th>   
					      <th class="col-1">Pay Up</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="reward" items="${rewards}">			<!-- LOOP -->
						<c:if test="${reward.redeemed }">
						
						<tr>
		   					<td>${reward.rewardName}</td>			    					  					
		   					<td>${reward.cost}</td>	
		   					<td>${reward.user.userName}</td>	
		   					<td>
								<form action="/reward/reset" method="post" >                 	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectReward"  value="${reward.id}"/>																				        		          																			        	
	        					<input type="submit" value="Pay Up!" class="btn btn-primary btn-sm " />
	       						</form>	
							</td>			   							    					  					
					  	</tr>
						</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div class="p-2">
	   			<h3>Completed Chores</h3>
		   		<table class="table table-primary table-striped">
					<thead>
					    <tr>				      
					      <th class="col-3">Chore</th>
					      <th class="col-2">By Who</th>   
					      <th class="col-1">Value</th>   
					      <th class="col-1">Verified?</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.completed}">
						<tr>
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.user.userName}</td>	
		   					<td>${chore.value}</td>	
		   					<td>
								<form action="/chore/reset" method="post" >       	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectChore"  value="${chore.id}"/>																				        	
	        					<input type="submit" value="Verify" class="btn btn-primary btn-sm " />
	       					</form>	
							</td>	
		   							    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div class="p-2">	   		
	   			<h3>Chores being worked on</h3>
		   		<table class="table table-primary table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-1">Value</th>
					      <th class="col-2">Who is doing it</th>
					    
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.working && !chore.completed}">
						<tr>
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.value}</td>	
		   					<td>${chore.user.userName}</td>
		   					    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
			<div class="d-flex">
			<a href="/chore/new" class="btn btn-primary btn-lg">Create new Chore/Reward</a>
			<a href="/edit/choreList" class="btn btn-secondary btn-lg">Edit current Chore/Reward List</a>
			</div>
	</div>
</body>
</html>