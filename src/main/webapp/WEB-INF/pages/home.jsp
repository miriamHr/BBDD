<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href="<c:url value="/assets/css/bootstrap-united.css" />" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/bootstrap/css/bootstrap.css" />" rel="stylesheet" type="text/css"/>
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

			<!--  >a class="btn btn-primary" href="signup.html">Signup � </a-->
			 <a class="btn btn-primary" href="login.html">Login �  </a>
		</div>
		

		<div></div>
	</div>


</body>
</html>
