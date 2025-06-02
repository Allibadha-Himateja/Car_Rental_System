<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*,com.oreilly.servlet.*,java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Details</title>
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
            max-height: 150px;
            overflow-y: auto;
        }

        .row-eq-height {
            display: flex;
            flex-wrap: wrap;
        }

        .form-group {
            flex: 1;
            padding: 5px;
        }
    </style>
</head>
<body>

<%
	List<VehicleModels> models=null;

	List<VehicleTypes> types=null;
	List<VehicleFuel> fuel=null;
	List<VehicleCapacity> capacity=null;

	List<Owners> owners=null;
	
	if(request.getParameter("Btn")!=null)
	{
		try{
			VehicleModelsService vs=new VehicleModelsService();
			OwnerService o=new OwnerService();
			VehicleFuelService vf=new VehicleFuelService();
			VehicleTypesService ts=new VehicleTypesService();
			VehicleCapacityService cs=new VehicleCapacityService();
			
			models=vs.getVehicleModels();
			owners=o.getOwners();
			fuel=vf.getVehicleFuels();
			types=ts.getVehicleTypes();
			capacity=cs.getVehicleCapacities();
			
			request.setAttribute("models",models);
			request.setAttribute("fuel",fuel);
			request.setAttribute("owners",owners);
			request.setAttribute("types",types);
			request.setAttribute("capacities",capacity);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

%>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Vehicle Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="Vehicle.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Add Vehicle Details</h2>
    <div class="form-container mt-4">
        <form action="VehiclesAdd.jsp?temp=ToAdd" method="post" enctype="multipart/form-data">
            <fieldset>
                <legend>Vehicle Details</legend>
                <div class="form-group">
                    <label for="Number">Vehicle Number</label>
                    <input type="text" class="form-control" id="Number" name="Number" required>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="image">Image</label>
                        <input type="file" class="form-control-file" id="image" name="image">
                    </div>
                </div>
                <div class="row">
                	<div class="form-group col-md-6">
                        <label for="type">Type</label>
                        <select class="form-control" id="type" name="type" required>
                        	<option value="">--Please Select--</option>
                            <c:forEach items="${types}" var="t">
                                    <option value="${t.type}">${t.type}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="model">Model</label>
                        <select class="form-control" id="model" name="model" required>
                        	<option value="">--Please Select--</option>
                            <c:forEach items="${models}" var="model">
                                    <option value="${model.modelNo}">${model.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Registration Details</legend>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="owner">Owner</label>
                        <select class="form-control" id="owner" name="owner" required>
                        	<option value="">--Please Select--</option>
                            <c:forEach items="${owners}" var="owner">
                                    <option value="${owner.ownerNo}">${owner.name}</option>
                             </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="registrationNumber">Registration Number</label>
                        <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" required>
                    </div>
                </div>
                
            </fieldset>
            <fieldset>
                <legend>Specifications</legend>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="chassisNumber">Chassis Number</label>
                        <input type="text" class="form-control" id="chassisNumber" name="chassisNumber" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="year">Year</label>
                        <input type="text" class="form-control" id="year" name="year" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="color">Color</label>
                        <input type="text" class="form-control" id="color" name="color" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fuel">Fuel</label>
                        <select class="form-control" id="fuel" name="fuel" required>
                        	<option value="">--Please Select--</option>
                            <c:forEach items="${fuel}" var="f">
                                    <option value="${f.fuel}">${f.fuel}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="capacity">Capacity</label>
                        <select class="form-control" id="capacity" name="capacity" required>
                        	<option value="">--Please Select--</option>
                            <c:forEach items="${capacities}" var="c">
                                    <option value="${c.capacity}">${c.capacity}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="mileage">Mileage</label>
                        <input type="text" class="form-control" id="mileage" name="mileage" required>
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Rate Details</legend>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="dailyRate">Daily Rate</label>
                        <input type="text" class="form-control" id="dailyRate" name="dailyRate" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="additionalDailyRate">Additional Daily Rate</label>
                        <input type="text" class="form-control" id="additionalDailyRate" name="additionalDailyRate" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="hourlyRate">Hourly Rate</label>
                        <input type="text" class="form-control" id="hourlyRate" name="hourlyRate" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="additionalHourlyRate">Additional Hourly Rate</label>
                        <input type="text" class="form-control" id="additionalHourlyRate" name="additionalHourlyRate" required>
                    </div>
                </div>
            </fieldset>
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="reset" class="btn btn-secondary">Clear</button>
        </form>
    </div>
</main>

<c:choose>
    <c:when test="${param.temp=='ToAdd'}">
    <%
        Vehicles vehicle = new Vehicles();

        String savePath = application.getRealPath("./Uploadimgs");
        System.out.println("Save path: " + savePath);

        try {
        	
            MultipartRequest m = new MultipartRequest(request, savePath);
            
            File file = m.getFile("image");
            byte[] data = null;
            if (file != null) {
                try (FileInputStream fis = new FileInputStream(file)) {
                    data = new byte[(int) file.length()];
                    fis.read(data);
                    vehicle.setPicture(data);
                }
            }

            VehicleModelsService vs = new VehicleModelsService();
            String modelParam = m.getParameter("model");
            if (modelParam != null) {
                VehicleModels model = vs.getVehicleModel(Integer.parseInt(modelParam));
                vehicle.setModelNo(model);
            }

            OwnerService os = new OwnerService();
            String ownerParam = m.getParameter("owner");
            if (ownerParam != null) {
                Owners owner = os.getOwner(Integer.parseInt(ownerParam));
                vehicle.setOwnerNo(owner);
            }

            vehicle.setVehicleNo(Integer.parseInt(m.getParameter("Number")));
            vehicle.setType(m.getParameter("type"));
            vehicle.setYear(Integer.parseInt(m.getParameter("year")));
            vehicle.setRegistrationNumber(m.getParameter("registrationNumber"));
            vehicle.setColor(m.getParameter("color"));
            vehicle.setFuel(m.getParameter("fuel"));
            vehicle.setCapacity(Integer.parseInt(m.getParameter("capacity")));
            vehicle.setMileage(Integer.parseInt(m.getParameter("mileage")));
            vehicle.setChaisisNumber(m.getParameter("chassisNumber"));
            vehicle.setDailyRate(Integer.parseInt(m.getParameter("dailyRate")));
            vehicle.setHourlyRate(Integer.parseInt(m.getParameter("hourlyRate")));
            vehicle.setAdditionalDailyRate(Integer.parseInt(m.getParameter("additionalDailyRate")));
            vehicle.setAdditionalHourlyRate(Integer.parseInt(m.getParameter("additionalHourlyRate")));

            VehicleService vehicleService = new VehicleService();
            vehicleService.Add(vehicle);
            
            response.sendRedirect("Vehicle.jsp?success=add");
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </c:when>
</c:choose>


<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
