<%-- 
    Document   : viewprofileusers
    Created on : 09-Apr-2019, 10:42:06
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users Page</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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


	<div class="container">
		<div
			class="well col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
			<c:forEach items="${relationUserList}" var="relationUser">
				<div class="row user-row">
					<div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
						<img class="img-circle"
							src="./getUserPhoto/<c:out value='${relationUser.userTwo.uid}'/>"
							width="60" alt="User Pic">
					</div>
					<div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
						<strong>${relationUser.userTwo.firstname}
							${relationUser.userTwo.lastname}</strong><br>
						<!--<span class="text-muted">User level: Administrator</span>-->
					</div>
					<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user"
						data-for=".${relationUser.userTwo.username}">
						<i class="glyphicon glyphicon-chevron-down text-muted"></i>
					</div>
				</div>
				<div class="row user-infos ${relationUser.userTwo.username}">
					<div
						class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">User information</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
										<img class="img-circle"
											src="./getUserPhoto/<c:out value='${relationUser.userTwo.uid}'/>"
											width="120" alt="User Pic">
									</div>
									<div class="col-xs-8 col-sm-6 hidden-md hidden-lg">
										<img class="img-circle"
											src="./getUserPhoto/<c:out value='${relationUser.userTwo.uid}'/>"
											width="120" alt="User Pic">
									</div>
									<div class="col-xs-10 col-sm-10 hidden-md hidden-lg">
										<!--<strong>{relationUser.userTwo.firstname}</strong>-->
										<br>
										<dl>
											<dt>Firstname</dt>
											<dd>${relationUser.userTwo.firstname}</dd>
											<dt>Lastname</dt>
											<dd>${relationUser.userTwo.lastname}</dd>
											<dt>Email</dt>
											<dd>${relationUser.userTwo.email}</dd>
											<dt>Date of Birth</dt>
											<dd>${relationUser.userTwo.dob}</dd>
											<dt>Status</dt>
											<dd>${relationUser.status.name}</dd>
										</dl>
									</div>
									<div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
										<!--<strong>{relationUser.userTwo.firstname}</strong>-->
										<br>
										<table class="table table-user-information">
											<tbody>
												<tr>
													<td>Firstname</td>
													<td>${relationUser.userTwo.firstname}</td>
												</tr>
												<tr>
													<td>Lastname</td>
													<td>${relationUser.userTwo.lastname}</td>
												</tr>
												<tr>
													<td>Email</td>
													<td>${relationUser.userTwo.email}</td>
												</tr>
												<tr>
													<td>Date of Birth</td>
													<td>${relationUser.userTwo.dob}</td>
												</tr>
												<tr>
													<td>Status</td>
													<td>${relationUser.status.name}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="panel-footer">
								<span class="pull-right">
									<button class="btn btn-sm btn-primary" type="button"
										data-toggle="tooltip" title="Friend Request"
										data-original-title="Send friend request to user"
										onclick="window.location.href = '${pageContext.request.contextPath}/friendRequest/${relationUser.userTwo.uid}'">
										<i class="glyphicon glyphicon-send"></i>
									</button>
									<button class="btn btn-sm btn-success" type="button"
										data-toggle="tooltip" title="Accept friend request"
										data-original-title="Send message to user"
										onclick="window.location.href = '${pageContext.request.contextPath}/acceptFriendRequest/${relationUser.status.idrel}/${relationUser.userTwo.uid}'">
										<i class="glyphicon glyphicon-ok"></i>
									</button>
								</span>
								<button class="btn btn-sm btn-danger" type="button"
									data-toggle="tooltip" title="Remove from friend"
									data-original-title="Remove this user"
									onclick="window.location.href = '${pageContext.request.contextPath}/deleteRelation/${relationUser.userTwo.uid}'">
									<i class="glyphicon glyphicon-remove"></i>
								</button>

								<button class="btn btn-sm btn-warning" id = "block" type="button"
									data-toggle="tooltip" title="Block/Unblock your friend"
									data-original-title="Block this user"
									onclick="window.location.href = '${pageContext.request.contextPath}/blockUser/${relationUser.status.idrel}/${relationUser.userTwo.uid}'">
									<i class="glyphicon glyphicon-ban-circle"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


	<script>
		$(document)
				.ready(
						function() {
							var panels = $('.user-infos');
							var panelsButton = $('.dropdown-user');
							panels.hide();

							//Click dropdown
							panelsButton
									.click(function() {
										//get data-for attribute
										var dataFor = $(this).attr('data-for');
										var idFor = $(dataFor);

										//current button
										var currentButton = $(this);
										idFor
												.slideToggle(
														400,
														function() {
															//Completed slidetoggle
															if (idFor
																	.is(':visible')) {
																currentButton
																		.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
															} else {
																currentButton
																		.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
															}
														});
									});

							$('[data-toggle="tooltip"]').tooltip();

							$('button').click(function(e) {
								e.preventDefault();
								alert("This is a demo.\n :-)");
							});
						});
	</script>


</body>
</html>