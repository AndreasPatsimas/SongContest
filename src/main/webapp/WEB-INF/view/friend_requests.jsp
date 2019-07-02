<%-- 
    Document   : friend_request
    Created on : 07-Jul-2019, 16:46:39
    Author     : andre
--%>

<%@page import="org.afdemp.cb6.songcontest.model.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Userprofile Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body style="background:linear-gradient(90deg, #feac5e, #c779d0, #4bc0c8);">

        <div class="container">
        <c:forEach items="${usersMadeFriendRequests}" var="user">
            <div class="row">
                <div class="col col-lg-3 col-md-3">
                </div>
                <div class="col col-lg-6 col-lg-6">
                    <div class="card border-primary mb-3">
                        <div class="card-header text-center bg-info">
                            <h3 class="card-title text-white">Info</h3>
                            <h5 style=" text-align: right" class="card-title">
                               
                            </h5>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="column col-lg-6">
                                    <div class="col-xs-8 col-sm-6 col-md-3 col-lg-3">
                                        <img class="img-circle"
                                             src="getUserPhoto/<c:out value='${user.uid}'/>" width="120" 
                                             alt=" "> 
                                    </div>
                                </div>
                                <div class="column col-lg-6">


                                </div>
                            </div>
                            <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
                                <strong>${user.username }</strong><br>
                                <table class="table table-sm table-user-information">
                                    <tbody>
                                        <tr>
                                            <td>Firstname </td>
                                            <td>${user.firstname} </td>
                                        </tr>
                                        <tr>
                                            <td>Lastname </td>
                                            <td>${user.lastname} </td>
                                        </tr>
                                        <tr>
                                            <td>Email </td>
                                            <td>${user.email} </td>
                                        </tr>

                                        <tr>
                                            <td>Date of Birth </td>
                                            <td>${user.dob} </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <div class="card-footer">
                            <p>Do you accept friend request from ${user.firstname} ?</p>
                            <span class="pull-right">
                                <button class="btn btn-sm btn-warning" type="button" onclick="window.location.href = 'yes/${user.uid}'">YES</button>
                                <button class="btn btn-sm btn-warning" type="button" onclick="window.location.href = 'no/${user.uid}'">NO</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col col-lg-3 col-md-3">
                </div>        
            </div>
            </c:forEach>
        </div>
</body>
</html>