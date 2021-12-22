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
    <title>Chore Page</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
	
			<div class="d-flex">
				<div class="flex-grow-1">
			   		<h1>Welcome, ${userName}</h1>
			   		<h5>you currently have ${pointTotal} points</h5>
				
				</div>
				<div class="d-flex  justify-content-end">
			   		<a href="/chore/complete" class="btn btn-primary me-3 h-50">Redeem Points</a>				
			   		<a href="/logout" class="btn btn-secondary me-3 h-50">Logout</a>
				</div>   		
	   		</div>
	   		<div class="mt-3">
	   			<h3>Available Chores</h3>
		   		<table class="table table-primary table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-1">Value</th>
					      <th class="col-1"></th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.listed == true && !chore.working}">
						<tr>
							
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.value}</td>	
		   					<td>
								<form action="/childChore/add" method="post" >                 	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectChore"  value="${chore.id}"/>																				        		          																			        	
	        					<input type="submit" value="Accept" class="btn btn-primary btn-sm " />
	       						</form>		
							</td>		    					  					
					  	</tr>
						</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div>
	   			<h3>Chores being done</h3>
		   		<table class="table table-primary table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-3">Who is doing it</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.working == true }">
						<tr>
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.user.userName}</td>	
		   							    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
		
	</div>
</body>
</html>