<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f0f2f5;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .links a {
            margin-left: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .links a:hover {
            background-color: #007bff;
            color: white;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container label {
            font-weight: bold;
            color: #333;
        }

        .form-container .btn {
            width: 100px;
        }
    </style>
</head>
<body>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Vehicle Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="VehicleMakes.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Add Vehicle</h2>
    <div class="form-container mt-4">
        <form action="VehicleMakesAdd.jsp?btn=Add" method="post">
            <div class="form-group">
                <label for="country">VehicleMake number</label>
                <input type="text" class="form-control" id="makeNo" name="makeNo"  required>
                <label for="country">VehicleName</label>
                <input type="text" class="form-control" id="name" name="name"  required>
            </div>
            <div class="form-group d-flex justify-content-end">
                <button type="reset" name="btn" value="Clear" class="btn btn-secondary mr-2">Clear</button>
                <button type="submit" name="btn" value="Save" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</main>

<c:choose>
	<c:when test="${param.btn=='Add'}">
			<jsp:useBean id="tempvehicle" class="com.iss.models.VehicleMakes" scope="request">
        		<jsp:setProperty name="tempvehicle" property="name" value="${param.name}" />
        		<jsp:setProperty name="tempvehicle" property="makeNo" value="${param.makeNo}"/>
			</jsp:useBean>
		    <%
		        VehicleMakesService Service = new VehicleMakesService();
		        Service.Add(tempvehicle);
		        response.sendRedirect("VehicleMakes.jsp?success=add");
		    %>	 
	</c:when>
</c:choose>


<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
