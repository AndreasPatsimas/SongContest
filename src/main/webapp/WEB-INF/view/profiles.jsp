<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users' Profiles</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.user-row {
	margin-bottom: 14px;
}

.user-row:last-child {
	margin-bottom: 0;
}

.dropdown-user {
	margin: 13px 0;
	padding: 5px;
	height: 100%;
}

.dropdown-user:hover {
	cursor: pointer;
}

.table-user-information>tbody>tr {
	border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information>tbody>tr:first-child {
	border-top: 0;
}

.table-user-information>tbody>tr>td {
	border-top: 0;
}
</style>

</head>
<body
	style="background: linear-gradient(90deg, #feac5e, #c779d0, #4bc0c8);">
	<nav class="navbar navbar-expand-sm navbar-dark"
		style="background-color: #665566;">
		<a href="#">
			<div class="logo-container">
				<div class="logo">
					<img src="<c:url value="/pic/vinyl-2241789__340.png"/>" width="70"
						height="70">
				</div>
				<div class="brand"></div>
			</div>
		</a>
		<button class="navbar-toggler mr-2" type="button"
			data-toggle="collapse" data-target="#navbar"
			aria-controls="navbarToggleExternalContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<span class="navbar-brand d-flex"></span>
		<div class="navbar-collapse collapse" id="navbar">
			<ul class="navbar-nav justify-content-left d-flex flex-fill">
				<li class="nav-item"><a class="nav-link"
					style="font-size: 20px;" href="./upToHomePage">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					style="font-size: 20px;" href="./goToUserProfile">Profile</a></li>
				<li class="nav-item"><a class="nav-link active"
					style="font-size: 20px;" href="viewProfilesUsers">Make Friends</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					style="font-size: 20px;" href="./messages">Messages</a></li>
				<li class="nav-item"><a class="nav-link"
					style="font-size: 20px;" href="./chooseYourOpponent">MusicBattle</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					style="font-size: 20px;" href="./logoutForm">Logout</a></li>
			</ul>
			<ul class="navbar-nav justify-content-right d-flex">

			</ul>
		</div>
		<div class="d-flex flex-fill">
			<!--spacer-->
		</div>
	</nav>
	<h2 style="text-align: center; color: white">Make Friends ${aris}!</h2>
	<br>
	<br>
	<div class="container">
		<form id="sub" method="get">
			<div class="col-xs-2">
				<input class="form-control" placeholder="Search..." id="ex1"
					type="text" name="text"> <input type="submit"
					value="submit"
					class="my-5 text-white btn btn-lg btn-outline-secondary">
			</div>
		</form>

	</div>
	
	<div id="search"></div>
	



<script>
	$(document).ready(function() {
		$('#sub').submit(function(event) {
			var text = $('#ex1').val();
			var data = encodeURIComponent(text);
			$.ajax({
				url : "searchForUsers?text=" + encodeURIComponent(text),
				data : data,
				type : "GET",

				success : function(response) {
					$("#search").html(response);
				},
				error : function(xhr, status, error) {
					console.log(xhr.responseText);
				}
			});
			return false;
		});
	});
</script>

</body>

</html>