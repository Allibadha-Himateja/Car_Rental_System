<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*,com.oreilly.servlet.*,java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body { background-color: #f0f2f5; }
        .header-container { display: flex; justify-content: space-between; align-items: center; }
        .links a { margin-left: 10px; transition: background-color 0.3s, color 0.3s; }
        .links a:hover { background-color: #007bff; color: white; }
        .form-container { background-color: #ffffff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        .form-container label { font-weight: bold; color: #333; }
        .form-container .btn { width: 100px; }
        .form-control { max-height: 150px; overflow-y: auto; }
    </style>
</head>
<body>

<%
    int vehicleId = Integer.parseInt(request.getParameter("Number"));
    VehicleService vehicleService = new VehicleService();
    Vehicles vehicle = vehicleService.getVehicle(vehicleId);
    
    VehicleModelsService vs = new VehicleModelsService();
    OwnerService os = new OwnerService();
    VehicleFuelService vf = new VehicleFuelService();
    VehicleTypesService ts = new VehicleTypesService();
    VehicleCapacityService cs = new VehicleCapacityService();
    
    List<VehicleModels> models = vs.getVehicleModels();
    List<VehicleTypes> types = ts.getVehicleTypes();
    List<VehicleFuel> fuel = vf.getVehicleFuels();
    List<VehicleCapacity> capacities = cs.getVehicleCapacities();
    List<Owners> owners = os.getOwners();
    
    request.setAttribute("models",models);
    request.setAttribute("types",types);
    request.setAttribute("fuel",fuel);
    request.setAttribute("capacities",capacities);
    request.setAttribute("owners",owners);
%>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Edit VehicleDetails</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="Vehicle.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Edit Vehicle</h2>
    <div class="form-container mt-4">
        <form action="VehicleEdit.jsp?temp=ToEdit&Number=<%= vehicleId %>" method="post" enctype="multipart/form-data">
            <fieldset>
                <legend>Vehicle Details</legend>
                <div class="form-group">
                    <label for="Number">Vehicle Number</label>
                    <input type="text" class="form-control" id="Number" name="Number" value="<%= vehicle.getVehicleNo() %>" required>
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
                                <option value="${t.type}" <c:if test="${t.type == vehicle.getType()}">selected</c:if>>${t.type}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="model">Model</label>
                        <select class="form-control" id="model" name="model" required>
                            <option value="">--Please Select--</option>
                            <c:forEach items="${models}" var="m">
                                <option value="${m.modelNo}" <c:if test="${m.modelNo == vehicle.getModelNo().getModelNo()}">selected</c:if>>${m.name}</option>
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
                            <c:forEach items="${owners}" var="o">
                                <option value="${o.ownerNo}" <c:if test="${o.ownerNo == vehicle.getOwnerNo().getOwnerNo()}">selected</c:if>>${o.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="registrationNumber">Registration Number</label>
                        <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" value="<%= vehicle.getRegistrationNumber() %>" required>
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Specifications</legend>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="chassisNumber">Chassis Number</label>
                        <input type="text" class="form-control" id="chassisNumber" name="chassisNumber" value="<%= vehicle.getChaisisNumber() %>" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="year">Year</label>
                        <input type="text" class="form-control" id="year" name="year" value="<%= vehicle.getYear() %>" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="color">Color</label>
                        <input type="text" class="form-control" id="color" name="color" value="<%= vehicle.getColor() %>" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fuel">Fuel</label>
                        <select class="form-control" id="fuel" name="fuel" required>
                            <option value="">--Please Select--</option>
                            <c:forEach items="${fuel}" var="f">
                                <option value="${f.fuel}" <c:if test="${f.fuel == vehicle.getFuel()}">selected</c:if>>${f.fuel}</option>
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
                                <option value="${c.capacity}" <c:if test="${c.capacity == vehicle.getCapacity()}">selected</c:if>>${c.capacity}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="mileage">Mileage</label>
                        <input type="text" class="form-control" id="mileage" name="mileage" value="<%= vehicle.getMileage() %>" required>
                    </div>
                </div>
            </fieldset>
            <fieldset>
                <legend>Rate Details</legend>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="dailyRate">Daily Rate</label>
                        <input type="text" class="form-control" id="dailyRate" name="dailyRate" value="<%= vehicle.getDailyRate() %>" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="additionalDailyRate">Additional Daily Rate</label>
                        <input type="text" class="form-control" id="additionalDailyRate" name="additionalDailyRate" value="<%= vehicle.getAdditionalDailyRate() %>" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="hourlyRate">Hourly Rate</label>
                        <input type="text" class="form-control" id="hourlyRate" name="hourlyRate" value="<%= vehicle.getHourlyRate() %>" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="additionalHourlyRate">Additional Hourly Rate</label>
                        <input type="text" class="form-control" id="additionalHourlyRate" name="additionalHourlyRate" value="<%= vehicle.getAdditionalHourlyRate() %>" required>
                    </div>
                </div>
            </fieldset>
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </form>
    </div>
</main>

<c:choose>
    <c:when test="${param.temp=='ToEdit'}">
    <%
    try {
        MultipartRequest m = new MultipartRequest(request, application.getRealPath("./Uploadimgs"));

        File file = m.getFile("image");
        byte[] data = null;
        if (file != null) {
            data = new byte[(int) file.length()];
            try (FileInputStream fis = new FileInputStream(file)) {
                fis.read(data);
            }
        }

        int modelNo = Integer.parseInt(m.getParameter("model"));
        int ownerNo = Integer.parseInt(m.getParameter("owner"));
        int vehicleNumber = Integer.parseInt(m.getParameter("Number"));
        String type = m.getParameter("type");
        int year = Integer.parseInt(m.getParameter("year"));
        String registrationNumber = m.getParameter("registrationNumber");
        String color = m.getParameter("color");
        String fuels = m.getParameter("fuel");
        int capacity = Integer.parseInt(m.getParameter("capacity"));
        int mileage = Integer.parseInt(m.getParameter("mileage"));
        String chassisNumber = m.getParameter("chassisNumber");
        int dailyRate = Integer.parseInt(m.getParameter("dailyRate"));
        int additionalDailyRate = Integer.parseInt(m.getParameter("additionalDailyRate"));
        int hourlyRate = Integer.parseInt(m.getParameter("hourlyRate"));
        int additionalHourlyRate = Integer.parseInt(m.getParameter("additionalHourlyRate"));

        VehicleService Ss = new VehicleService();
        Ss.Edit(vehicleNumber, type, modelNo, ownerNo, year, registrationNumber, color, fuels, capacity, mileage, chassisNumber, dailyRate, additionalDailyRate, hourlyRate, additionalHourlyRate, data);

        response.sendRedirect("Vehicle.jsp?success=edit");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

    </c:when>
</c:choose>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
