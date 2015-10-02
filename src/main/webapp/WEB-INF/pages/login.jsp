<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/assets/css/bootstrap-united.css" />" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/bootstrap/css/bootstrap.css" />" rel="stylesheet" type="text/css"/>
<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

<style>
.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
</style>
<title>Inicio de Sesión</title>
</head>
<body  onload='document.loginForm.username.focus();'>
	

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
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/BDD">Home</a></li>
				<li class="active"><a href="login.html">Login</a></li>
				
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

	

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
					 <c:url var="loginUrl" value="/login" />
					  <form action="${loginUrl}" method="post" class="bs-example form-horizontal" >
					  	<c:if test="${param.error != null}">
						  	<div class="alert alert-danger">
                                    <p>Invalid username and password.</p>
                          	</div>
                       	</c:if>	
						 <c:if test="${param.logout != null}">
                                <div class="alert alert-success">
                                    <p>You have been logged out successfully.</p>
                                </div>
                          </c:if>
						 <fieldset>
								<legend>Inicio de Sesión </legend>

								<div class="form-group">
									<label  class="col-lg-3 control-label">User	Name</label>									
									<div class="col-lg-9">
									  <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>

									</div>
										
								</div>

								<div class="form-group">
                                	<label class="col-lg-3 control-label" for="password">Password</label> 
									<div class="col-lg-9">
									  <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
										
									</div>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
												
								<div class="col-lg-9 col-lg-offset-3">
									<a class="btn btn-default" role="button"  href="/BBDD" aria-expanded="false" >
									Cancel</a>
									<input value="Log in"  type="submit" class="btn btn-primary">		
								</div>
								
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>