<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.iss.models.Countries, com.iss.services.CountriesService" %>
<%@ page import="com.iss.models.States, com.iss.services.StateService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Retrieve list of countries if Btn parameter is present
    List<Countries> list = null;
    if (request.getParameter("Btn") != null) {
        try {
            CountriesService cs = new CountriesService();
            list = cs.getCountries();
            request.setAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
    String stateName=null;
    int stateNo=0;
    // Retrieve state details if editing an existing state
    //mark this if case important*******************************************************************
    if(request.getParameter("statename")!=null && request.getParameter("stateno")!=null)
    {
    	stateName = request.getParameter("statename");
        stateNo = Integer.parseInt(request.getParameter("stateno"));	
    }
    //int countryNo = Integer.parseInt(request.getParameter("countryno"));
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit State</title>
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
        <h1 class="h4">Location Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm"
                title="Home"><i class="fas fa-home"></i></a>
            <a href="http://localhost:8080/simple-webapp/Statesjsp/States.jsp" class="btn btn-secondary btn-sm"
                title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Edit State</h2>
    <div class="form-container mt-4">
        <form action="EditState.jsp?btn=Edit" method="post">
            <div class="form-group">
                <label for="stateNo">State Number(Dont Change!)</label>
                <input type="text" class="form-control" id="stateNo" name="stateno"
                    value="<%= (stateNo != 0) ? stateNo : "" %>" required>
                <label for="stateName">State Name</label>
                <input type="text" class="form-control" id="stateName" name="statename"
                    value="<%= (stateName != null) ? stateName : "" %>" required>
                <label for="countryNo">Country</label>
                <select class="form-control" id="countryNo" name="countryNo" required>
                    <c:choose>
                        <c:when test="${empty list}">
                            <option>Countries not Found</option>
                        </c:when>
                        <c:otherwise>
                            <option value="">Select Country</option>
                            <c:forEach items="${list}" var="c">
                                <option value="${c.countryNo}" <c:if test="${c.countryNo == countryNo}">selected</c:if>>${c.country}</option>
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
            StateService stateService = new StateService();
        	CountriesService s=new CountriesService();
        	if(request.getParameter("statename")!=null && request.getParameter("stateno")!=null)
        	{
        		String sName = request.getParameter("statename");
                int sNo = Integer.parseInt(request.getParameter("stateno"));
                int temp = Integer.parseInt(request.getParameter("countryNo"));
                Countries c= s.getCountry(temp);
                stateService.Edit(sNo, sName, c);
                response.sendRedirect("http://localhost:8080/simple-webapp/Statesjsp/States.jsp?success=edit");	
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
