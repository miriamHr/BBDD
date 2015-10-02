<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<c:url value="/resources/assets/css/bootstrap-united.css" var ="style"/>
<c:url value="/resources/bootstrap/css/bootstrap.css"  var="bootstrap"/>
<link href="${style}" rel ="stylesheet">
<link href="${bootstrap}" rel ="stylesheet">

<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="js/code.js"></script>


<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<style>
body {
	height: 100%;
	margin: 0;
	
	background-size: 1440px 800px;
	background-repeat: no-repeat;
	display: compact;
}
</style>
 
</head>
<body>
	<div class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search">
			</form>
			
		</div>
		<!-- /.nav-collapse -->
	</div>
	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Bienvenido</h1>
				
			</div>

			<!--  >a class="btn btn-primary" href="signup.html">Signup » </a-->
			 <a class="btn btn-primary" href="login.html">Login »  </a>
		</div>
		

		<div></div>
	</div>

<script type="text/javascript" src="webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
