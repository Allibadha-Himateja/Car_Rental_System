<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Retrieve list of countries, states, and cities if Btn parameter is present
    List<Countries> countries = null;
    List<States> states = null;
    List<Cities> cities = null;
    if (request.getParameter("Btn") != null) {
        try {
            CountriesService cs = new CountriesService();
            countries = cs.getCountries();
            request.setAttribute("countries", countries);

            StateService ss = new StateService();
            states = ss.getStates();
            request.setAttribute("states", states);

            CityService cis = new CityService();
            cities = cis.getCities();
            request.setAttribute("cities", cities);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    String driverName = null;
    int driverNo = 0;
    int licenseNumber = 0;
    String address1 = null;
    String address2 = null;
    int countryNo = 0;
    int stateNo = 0;
    int cityNo = 0;
    String pincode = null;
    String phoneNumber = null;
    String mobileNumber = null;
    String bankName = null;
    String accountNumber = null;
    String panNumber = null;

    // Retrieve driver details if editing an existing driver
    if (request.getParameter("driverNo") != null) {
        driverNo = Integer.parseInt(request.getParameter("driverNo"));
        DriverService driverService = new DriverService();
        Drivers driver = driverService.getDriver(driverNo);

        if (driver != null) {
            driverName = driver.getDriverName();
            licenseNumber = driver.getLicenseNumber();
            address1 = driver.getAddressLine1();
            address2 = driver.getAddressLine2();
            countryNo = driver.getCountryNo().getCountryNo();
            stateNo = driver.getStateNo().getStateNo();
            cityNo = driver.getCityNo().getCityNo();
            pincode = driver.getPincode();
            phoneNumber = driver.getPhoneNumber();
            mobileNumber = driver.getMobileNumber();
            bankName = driver.getBankName();
            accountNumber = driver.getBankAccount();
            panNumber = driver.getPAN();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver Details</title>
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
    </style>
</head>
<body>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Driver Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="Driver.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Edit Driver Details</h2>
    <div class="form-container mt-4">
        <form action="DriverEdit.jsp?btn=Edit" method="post">
            <fieldset>
                <legend>Driver Details</legend>
                <div class="form-group">
                    <label for="driverNo">Driver Number (Don't Change!)</label>
                    <input type="text" class="form-control" id="driverNo" name="driverNo" value="<%= driverNo %>" required readonly>
                </div>
                <div class="form-group">
                    <label for="driverName">Name</label>
                    <input type="text" class="form-control" id="driverName" name="driverName" value="<%= driverName %>" required>
                </div>
                <div class="form-group">
                    <label for="licenseNumber">License Number (Numbers Only)</label>
                    <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" value="<%= licenseNumber %>" required>
                </div>
                <fieldset>
                    <legend>Address Details</legend>
                    <div class="form-group">
                        <label for="address1">Address1</label>
                        <input type="text" class="form-control" id="address1" name="address1" value="<%= address1 %>" required>
                    </div>
                    <div class="form-group">
                        <label for="address2">Address2</label>
                        <input type="text" class="form-control" id="address2" name="address2" value="<%= address2 %>" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="countryNo">Country</label>
                            <select class="form-control" id="countryNo" name="countryNo" required>
                                <c:choose>
                                    <c:when test="${empty countries}">
                                        <option>Countries not Found</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="">Select Country</option>
                                        <c:forEach items="${countries}" var="c">
                                            <option value="${c.countryNo}" <c:if test="${c.countryNo == countryNo}">selected</c:if>>${c.country}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="stateNo">State</label>
                            <select class="form-control" id="stateNo" name="stateNo" required>
                                <c:choose>
                                    <c:when test="${empty states}">
                                        <option>States not Found</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="">Select State</option>
                                        <c:forEach items="${states}" var="s">
                                            <option value="${s.stateNo}" <c:if test="${s.stateNo == stateNo}">selected</c:if>>${s.stateName}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="cityNo">City</label>
                            <select class="form-control" id="cityNo" name="cityNo" required>
                                <c:choose>
                                    <c:when test="${empty cities}">
                                        <option>Cities not Found</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="">Select City</option>
                                        <c:forEach items="${cities}" var="ci">
                                            <option value="${ci.cityNo}" <c:if test="${ci.cityNo == cityNo}">selected</c:if>>${ci.cityName}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="pincode">Pincode</label>
                            <input type="text" class="form-control" id="pincode" name="pincode" value="<%= pincode %>" required>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Contact Details</legend>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<%= phoneNumber %>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mobileNumber">Mobile Number</label>
                            <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="<%= mobileNumber %>" required>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Bank Details</legend>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="bankName">Bank Name</label>
                            <input type="text" class="form-control" id="bankName" name="bankName" value="<%= bankName %>" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="accountNumber">Account Number</label>
                            <input type="text" class="form-control" id="accountNumber" name="accountNumber" value="<%= accountNumber %>" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="panNumber">PAN Number</label>
                            <input type="text" class="form-control" id="panNumber" name="panNumber" value="<%= panNumber %>" required>
                        </div>
                    </div>
                </fieldset>
                <button type="submit" class="btn btn-primary">Save</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </fieldset>
        </form>
    </div>
</main>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<c:choose>
    <c:when test="${param.btn == 'Edit'}">
        <%
            DriverService driverService = new DriverService();
            if (request.getParameter("driverName") != null && request.getParameter("driverNo") != null) {
                int driverId = Integer.parseInt(request.getParameter("driverNo"));
                String dname = request.getParameter("driverName");
                String pno = request.getParameter("phoneNumber");
                String mno = request.getParameter("mobileNumber");
                int lno = Integer.parseInt(request.getParameter("licenseNumber"));
                String bname = request.getParameter("bankName");
                String ano = request.getParameter("accountNumber");
                String panno = request.getParameter("panNumber");
				String addr1=request.getParameter("address1");
				String addr2=request.getParameter("address2");
				int tempcno=Integer.parseInt(request.getParameter("countryNo"));
				int tempsno=Integer.parseInt(request.getParameter("stateNo"));
				int tempcino=Integer.parseInt(request.getParameter("cityNo"));
				String pin=request.getParameter("pincode");
                driverService.Edit(driverId, dname,lno,addr1,addr2,tempcno,tempsno,tempcino,pin,pno,mno,bname,ano,panno);
                response.sendRedirect("Driver.jsp?success=edit");
            }
        %>
    </c:when>
</c:choose>

</body>
</html>
