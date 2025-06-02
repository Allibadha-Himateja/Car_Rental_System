<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*, com.iss.services.*,java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add VehicleModel</title>
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
        
        .form-control {
	      max-height: 150px; /* Set a max height for the dropdown */
	      overflow-y: auto; /* Enable vertical scrolling */
	    }
    </style>
</head>
<body>

<%
	List<VehicleMakes> list=null;
	if(request.getParameter("Btn")!=null)
	{
		System.out.println("sending to service");
		try{
			VehicleMakesService cs=new VehicleMakesService();
		    list=cs.getVehicles();
		    request.setAttribute("list",list);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Vehicle Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="VehicleModels.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Add VehicleModel</h2>
    <div class="form-container mt-4">
        <form action="VehicleModelsAdd.jsp?btn=Add" method="post">
            <div class="form-group">
                <label for="modelNo">Model Number</label>
                <input type="text" class="form-control" id="stateNo" name="modelNo" required>
            </div>
            <div class="form-group">
                <label for="modelName">Model Name</label>
                <input type="text" class="form-control" id="stateName" name="name" required>
            </div>
            <div class="form-group">
                <label for="makeNo">VehicleMake</label>
                <select class="form-control" id="countryNo" name="makeNo" required>
                    
                    <!-- Populate dropdown with countries -->
                    <c:choose>
                    		<c:when test="${empty list}">
	                            <option>Makes not Found</option>
                    		</c:when>
                    		<c:otherwise>
                    			<option value="">Select Make</option>
                    			<c:forEach items="${list}" var="c">
			                        <option value="${c.makeNo}">${c.name}</option>
			                    </c:forEach>	
                    		</c:otherwise>
                    </c:choose>
                </select>
            </div>
            <div class="form-group d-flex justify-content-end">
                <button type="reset" name="btn" value="Clear" class="btn btn-secondary mr-2">Clear</button>
                <button type="submit" name="btn" value="Save" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</main>

<c:choose>
    <c:when test="${param.btn == 'Add'}">
        <%
            VehicleModels vehiclemodel = new VehicleModels();
            vehiclemodel.setModelNo(Integer.parseInt(request.getParameter("modelNo")));
            vehiclemodel.setName(request.getParameter("name"));
            VehicleMakesService s=new VehicleMakesService();
            VehicleMakes c=s.getVehicleMake(Integer.parseInt(request.getParameter("makeNo")));
            vehiclemodel.setMakeNo(c);
            VehicleModelsService Service = new VehicleModelsService();
            Service.Add(vehiclemodel);
            response.sendRedirect("http://localhost:8080/simple-webapp/VehicleModelsjsp/VehicleModels.jsp?success=add");
        %>
    </c:when>
</c:choose>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
