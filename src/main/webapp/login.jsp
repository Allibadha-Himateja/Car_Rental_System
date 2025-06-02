<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*,java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental System - Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            transition: background-image 2s ease-in-out;
            overflow: hidden;
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .container {
            z-index: 2;
            text-align: center;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            padding: 30px;
            max-width: 400px;
            width: 90%;
            margin: auto;
            backdrop-filter: blur(10px);
        }

        .card-title {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #333;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-group label {
            color: #333;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .forgot-password {
            color: #333;
            text-decoration: none;
            font-size: 14px;
            display: block;
            margin-top: 10px;
        }

        .toggle-switch {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .toggle-switch input[type="radio"] {
            display: none;
        }

        .toggle-switch label {
            padding: 10px 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .toggle-switch input[type="radio"]:checked + label {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .toggle-switch label:first-child {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .toggle-switch label:last-child {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            border-left: none;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <div class="card">
            <h5 class="card-title">Login to Car Rental's</h5>
            <form action="login.jsp" method="post">
                <div class="toggle-switch">
                    <input type="radio" id="customer" name="user" value="Customer" checked>
                    <label for="customer">Customer</label>
                    <input type="radio" id="employee" name="user" value="Employee">
                    <label for="employee">Employee</label>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
				    <label for="password">Password</label>
				    <div class="input-group">
				        <input type="password" class="form-control" id="password" name="password" required>
				        <div class="input-group-append">
				            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
				                <i class="fas fa-eye"></i>
				            </button>
				        </div>
				    </div>
				</div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </div>
    
<c:choose>
    <c:when test="${param.user == 'Customer' && param.user!='Employee'}">
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            LoginService ls = new LoginService();
            List<Customers> customers = ls.getCustomer(username);

            if (customers != null && !customers.isEmpty()) {
                Customers customer = customers.get(0);
                String storedPassword = customer.getPassword();

                if (storedPassword.equals(password)) {
                	request.setAttribute("customer",customer);
                	request.setAttribute("msg", "success");
                	request.setAttribute("user","customer");
                	request.getRequestDispatcher("UserHome.jsp").forward(request, response);
                    //response.sendRedirect("UserHome.jsp?msg=success");
                } else {
                    response.sendRedirect("login.jsp?msg=yellow");
                }
            } else {
                response.sendRedirect("login.jsp?msg=red");
            }
        %>
    </c:when>
    <c:when test="${param.user == 'Employee'}">
    	<%
	    	String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        LoginService ls = new LoginService();
	        List<Employees> e=ls.getEmployee(username);
	        
	        if (e != null && !e.isEmpty()) {
                Employees emp = e.get(0);
                String storedPassword = emp.getPassword();

                if (storedPassword.equals(password)) {
                	request.setAttribute("employee",emp);
                	request.setAttribute("msg", "success");
                	request.getRequestDispatcher("UserHome.jsp?user=employee").forward(request, response);
                } else {
                    response.sendRedirect("login.jsp?msg=yellow");
                }
            } else {
                response.sendRedirect("login.jsp?msg=red");
            }
    	%>
    </c:when>
</c:choose>

<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageModalLabel">Message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="messageModalBody">
                <!-- This text will be dynamically updated based on the action -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
    $(document).ready(function() {
        var urlParams = new URLSearchParams(window.location.search);
        var msgType = urlParams.get('msg');
        
        if (msgType === 'red') {
            $('#messageModalBody').text("Incorrect username");
            $('#messageModal').modal('show');
        } else if (msgType === 'yellow') {
            $('#messageModalBody').text("Incorrect password");
            $('#messageModal').modal('show');
        }
    });
    $(document).ready(function() {
        $('#togglePassword').click(function() {
            const password = $('#password');
            const type = password.attr('type') === 'password' ? 'text' : 'password';
            password.attr('type', type);
            $(this).find('i').toggleClass('fa-eye fa-eye-slash');
        });
    });
</script>
