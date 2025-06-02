 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental Service</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .header {
            background-color: #343a40;
            color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .header .logo {
            font-size: 24px;
            font-weight: bold;
        }
        .header .nav-icons a {
            color: #ffffff;
            margin-left: 10px;
            font-size: 20px;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        .header .nav-icons a:hover {
            background-color: #007bff;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        .content-wrapper {
            display: flex;
            flex: 1;
        }
        .sidebar {
            width: 250px;
            background-color: #f8f9fa;
            color: #343a40;
            height: 100vh;
            padding: 20px;
            box-shadow: 2px 0px 5px rgba(0,0,0,0.1);
        }
        .sidebar h2, .sidebar ul {
            margin: 0 0 20px 0;
            padding: 0;
        }
        .sidebar ul {
            list-style: none;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            color: #343a40;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }
        .sidebar ul li a:hover {
            color: #007bff;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .car-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding-bottom: 10px;
        }
        .car-item {
            padding: 20px;
            border: 1px solid #007bff;
            border-radius: 10px;
            background-color: #ffffff;
            transition: box-shadow 0.3s, transform 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            text-align: center;
        }
        .car-item:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-5px);
        }
        .car-item img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
            margin-bottom: 15px;
            border-radius: 10px;
        }
        .car-item .details h3 {
            font-size: 22px;
            color: #007bff;
            margin-bottom: 15px;
        }
        .car-item .details p {
            margin: 0;
            color: #777;
        }
        .floating-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            font-size: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .floating-button:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                box-shadow: none;
            }
            .sidebar ul li {
                text-align: center;
            }
            .main-content {
                padding: 10px;
            }
            .car-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<%
    List<VehicleMakes> makes = null;
    List<VehicleTypes> types = null;
    List<Vehicles> vehicles = null;
    String userRole = (String) request.getAttribute("userRole");

    try {
        //VehicleTypesService ts = new VehicleTypesService();
        VehicleMakesService vms = new VehicleMakesService();
        VehicleService vs = new VehicleService();

        makes = vms.getVehicleMakes();
        vehicles = vs.getVehicles();
        //types = ts.getVehicleTypes();
        request.setAttribute("types", types);
        request.setAttribute("makes", makes);
        request.setAttribute("vehicles", vehicles);
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
    <header class="header">
        <div class="logo">Car Rental</div>
        <div class="nav-icons">
            <a href=""><i class="bi bi-house"></i></a>
            <a href="login.jsp"><i class="bi bi-person-plus"></i></a>
            <a href="./login.jsp"><i class="bi bi-box-arrow-in-right"></i></a>
        </div>
    </header>
    <div class="content-wrapper">
        <div class="sidebar">
            <h2>Fleet Options</h2>
            <!-- <ul>
                <c:forEach items="${types}" var="t">
                    <li><a href="">${t.type}</a></li>
                </c:forEach>
            </ul> -->
            <h2>Car Makers</h2>
            <ul>
                <c:forEach items="${makes}" var="t">
                    <li><a href="">${t.name}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="main-content">
            <div class="car-grid">
                <%
                    for (Vehicles v : vehicles) {
                        byte[] b = v.getPicture();
                        String base64 = Base64.getEncoder().encodeToString(b);
                        String type = v.getType();
                        VehicleModels m = v.getModelNo();
                        String modelname = m.getName();
                        request.setAttribute("base64img", base64);
                        request.setAttribute("type", type);
                        request.setAttribute("model", modelname);
                %>
                <div class="car-item">
                    <div class="details">
                        <c:if test="${not empty base64img}">
                            <img src="data:image/jpeg;base64,${base64img}" alt="Image from Database" />
                        </c:if>
                        <h3><%= type %></h3>
                        <p>${model}</p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="successModalBody">
                <p>Login Successful!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<c:if test="${param.user == 'employee'}">
    <a href="/simple-webapp/MainMenu.jsp" class="floating-button"><i class="bi bi-gear"></i></a>
</c:if>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        <%-- Check if 'msg' attribute is set to 'success' --%>
        <% if (request.getAttribute("msg") != null && request.getAttribute("msg").equals("success")) { %>
            $('#successModal').modal('show'); // Show the success modal
        <% } %>
    });
</script>

</body>
</html>
