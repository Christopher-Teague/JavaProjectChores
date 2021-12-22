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
    <title>Edit Available Lists</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>Edit Available Lists</h1>			
			</div>
			<div class="d-flex  justify-content-end">
		   		<a href="/chore/new" class="btn btn-secondary me-3">Create Chore/Reward</a>
		   		<a href="/parentDashboard" class="btn btn-primary">Dashboard</a>				
			</div>   		
   		</div>
		<div class="mt-3">	   		
   			<h3>Edit Current Chore List</h3>
	   		<table class="table table-primary table-striped">
				<thead>
				    
				    <tr>				      
				    	<th class="col-4">Chore</th>
				      	<th class="col-1">Value</th>
				      	<th class="col-1"></th>    				     
					</tr>
					
				</thead>
				<tbody>
				  	<c:forEach var="chore" items="${chores}">					<!-- LOOP -->
					<c:if test="${chore.getListed() == true && !chore.working}">
					<tr>
	   					<td>${chore.choreName}</td>			    					  					
	   					<td>${chore.value}</td>	
	   					<td>
	   						<form action="/choreList/remove" method="post" >       	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectChore"  value="${chore.id}"/>																				        	
	        					<input type="submit" value="Remove" class="btn btn-primary btn-sm " />
	       					</form>													<!-- *************** -->
    					</td>	    					  					
				  	</tr>
	         		
				  	</c:if>   
					</c:forEach>											<!-- END LOOP -->
				</tbody>
			</table> 
			
			<div class="form-group">   									<!-- DROP DOWN TO ADD CHORES -->
            	<form action="/choreList/add" method="post" >
	            <input type="hidden" name="_method" value="put"/>	
		        <div class="form-group">
	         		<label>Add Chore to list:</label>
	            	<select name="selectChore" class="form-control">
		         		<c:forEach var="chore" items="${chores}">
	 						<c:if test="${chore.getListed() == false}">
								<option value="${chore.id}">${chore.choreName} - ${chore.value} points</option>
	 						</c:if>           	
	        			</c:forEach>
					</select>        	
	        	</div>
	        		<input type="submit" value="Add" class="btn btn-primary mt-2" />     	
    			</form>
        	</div>														<!-- ************************ -->
   		</div>
		<div class="mt-5">	   		
   			<h3>Edit Current Rewards List</h3>
	   		<table class="table table-primary table-striped">
				<thead>
				    <tr>				      
				      <th class="col-4">Reward</th>
				      <th class="col-1">Cost</th>
				      <th class="col-1"></th>
				    
				     
					</tr>
				</thead>
				<tbody>
				  	<c:forEach var="reward" items="${rewards}">							<!-- LOOP -->
				  	<c:if test="${reward.getListed() == true}">			
					<tr>
	   					<td>${reward.rewardName}</td>			    					  					
	   					<td>${reward.cost}</td>	
	   					<td>
	   						<form action="/rewardList/remove" method="post" >                 	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectReward"  value="${reward.id}"/>																				        	
	        					<input type="submit" value="Remove" class="btn btn-primary btn-sm " />
	       					</form>																<!-- *************** -->
	   					</td>	
	   					    					  					
				  	</tr>
				  	</c:if>
					</c:forEach>														<!-- END LOOP -->
				</tbody>
			</table> 
   			
				<div class="form-group">   											<!-- DROP DOWN TO ADD CHORES -->
            		<form action="/rewardList/add" method="post" >
	            	<input type="hidden" name="_method" value="put"/>	
		        	<div class="form-group">
	         		<label>Add Reward to list:</label>
	            	<select name="selectReward" class="form-control">
		         		<c:forEach var="reward" items="${rewards}">
	 						<c:if test="${reward.getListed() == false}">
								<option value="${reward.id}">${reward.rewardName} - costs ${reward.cost} points</option>
	 						</c:if>           	
	        			</c:forEach>
					</select>        	
	        		</div>
	        		<input type="submit" value="Add" class="btn btn-primary mt-2" />     	
    				</form>
        		</div>											
   		</div>
	
	</div>
</body>
</html>