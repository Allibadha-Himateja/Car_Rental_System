<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.iss.models.*, com.iss.services.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Retrieve list of countries if Btn parameter is present
    List<VehicleMakes> list = null;
    if (request.getParameter("Btn") != null) {
        try {
            VehicleMakesService cs = new VehicleMakesService();
            list = cs.getVehicles();
            request.setAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
    String name=null;
    int modelNo=0;
    // Retrieve state details if editing an existing state
    //mark this if case important*******************************************************************
    if(request.getParameter("name")!=null && request.getParameter("modelNo")!=null)
    {
    	name = request.getParameter("name");
        modelNo = Integer.parseInt(request.getParameter("modelNo"));	
    }
    //int countryNo = Integer.parseInt(request.getParameter("countryno"));
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit VehicleModel</title>
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
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm"
                title="Home"><i class="fas fa-home"></i></a>
            <a href="VehicleModels.jsp" class="btn btn-secondary btn-sm"
                title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Edit State</h2>
    <div class="form-container mt-4">
        <form action="VehicleModelsEdit.jsp?btn=Edit" method="post">
            <div class="form-group">
                <label for="modelNo">Model Number(Dont Change!)</label>
                <input type="text" class="form-control" id="stateNo" name="modelNo"
                    value="<%= (modelNo != 0) ? modelNo : "" %>" required>
                <label for="name">Model Name</label>
                <input type="text" class="form-control" id="stateName" name="name"
                    value="<%= (name != null) ? name : "" %>" required>
                <label for="makeNo">VehicleMake</label>
                <select class="form-control" id="makeNo" name="makeNo" required>
                    <c:choose>
                        <c:when test="${empty list}">
                            <option>Vehicles not Found</option>
                        </c:when>
                        <c:otherwise>
                            <option value="">Select Vehicle</option>
                            <c:forEach items="${list}" var="c">
                                <option value="${c.makeNo}" <c:if test="${c.makeNo == makeNo}">selected</c:if>>${c.name}</option>
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
    <c:when test="${param.btn == 'Edit'}">
        <%
            VehicleModelsService Service = new VehicleModelsService();
        	VehicleMakesService s=new VehicleMakesService();
        	if(request.getParameter("name")!=null && request.getParameter("modelNo")!=null)
        	{
        		String n = request.getParameter("name");
                int Vno = Integer.parseInt(request.getParameter("modelNo"));
                int temp = Integer.parseInt(request.getParameter("makeNo"));
                VehicleMakes c= s.getVehicleMake(temp);
                Service.Edit(Vno,n, c);
                response.sendRedirect("VehicleModels.jsp?success=edit");	
        	}
        %>
    </c:when>
</c:choose>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
