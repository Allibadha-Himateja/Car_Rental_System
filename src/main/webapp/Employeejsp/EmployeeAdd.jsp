<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
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

        .privileges-container {
            margin-top: 20px;
        }

        .form-check {
            display: inline-block;
            margin-right: 10px;
            margin-bottom: 10px;
        }

        .form-check input[type="checkbox"] {
            display: none;
        }

        .form-check label {
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 5px;
            border: 1px solid #007bff;
            background-color: #f8f9fa;
            color: #007bff;
            transition: background-color 0.3s, color 0.3s;
            width: 180px;
            text-align: center;
        }

        .form-check input[type="checkbox"]:checked + label {
            background-color: #007bff;
            color: white;
        }

        .row-eq-height {
            display: flex;
            flex-wrap: wrap;
        }
    </style>
</head>
<body>

<%
    List<Countries> countries = null;
    if (request.getParameter("Btn") != null) {
        try {
            CountriesService cs = new CountriesService();
            countries = cs.getCountries();
            request.setAttribute("countries", countries);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    List<States> states = null;
    if (request.getParameter("Btn") != null) {
        try {
            StateService s = new StateService();
            states = s.getStates();
            request.setAttribute("states", states);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    List<Cities> cities = null;
    if (request.getParameter("Btn") != null) {
        try {
            CityService c = new CityService();
            cities = c.getCities();
            request.setAttribute("cities", cities);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Employee Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="Employee.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Add Employee Details</h2>
    <div class="form-container mt-4">
        <form action="EmployeeAdd.jsp?btn=Add" method="post">
            <fieldset>
                <legend>Employee Details</legend>
                <div class="form-group">
                    <label for="Number">Employee Number</label>
                    <input type="text" class="form-control" id="Number" name="Number" required>
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="employeeType">Employee Type</label>
                    <select class="form-control" id="employeeType" name="employeeType" required>
                        <option value="Normal">Normal</option>
                        <option value="Administrator">Administrator</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <fieldset>
                    <legend>Address Details</legend>
                    <div class="form-group">
                        <label for="address1">Address</label>
                        <input type="text" class="form-control" id="address1" name="addressLine1" required>
                    </div>
                    <div class="form-group">
                        <label for="address2">Email</label>
                        <input type="text" class="form-control" id="address2" name="addressLine2" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="country">Country</label>
                            <select class="form-control" id="country" name="country" required>
                                <option value="">Select Country</option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.countryNo}">${country.country}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="state">State</label>
                            <select class="form-control" id="state" name="state" required>
                                <option value="">Select State</option>
                                <c:forEach items="${states}" var="state">
                                    <option value="${state.stateNo}">${state.stateName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="city">City</label>
                            <select class="form-control" id="city" name="city" required>
                                <option value="">Select City</option>
                                <c:forEach items="${cities}" var="city">
                                    <option value="${city.cityNo}">${city.cityName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="pincode">Pincode</label>
                            <input type="text" class="form-control" id="pincode" name="pincode" required>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Contact Details</legend>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mobileNumber">Mobile Number</label>
                            <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" required>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Login Details</legend>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="userName">UserName</label>
                            <input type="text" class="form-control" id="userName" name="userName" required>
                        </div>
                        <div class="form-group col-md-6 password-container">
                            <label for="password">Password</label>
                            <br>
                            <input type="password" class="form-control" id="password" name="password" value="" required>
                            <i class="fas fa-eye toggle-password"></i>
                        </div>
                        <script>
                            document.querySelector('.toggle-password').addEventListener('click', function () {
                                const passwordInput = document.getElementById('password');
                                if (passwordInput.type === 'password') {
                                    passwordInput.type = 'text';
                                    this.classList.remove('fa-eye');
                                    this.classList.add('fa-eye-slash');
                                } else {
                                    passwordInput.type = 'password';
                                    this.classList.remove('fa-eye-slash');
                                    this.classList.add('fa-eye');
                                }
                            });
                        </script>
                    </div>
                </fieldset>
				<fieldset>
                    <legend>Bank Details</legend>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="bankName">Bank Name</label>
                            <input type="text" class="form-control" id="bankName" name="bankName" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="accountNumber">Account Number</label>
                            <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="panNumber">PAN Number</label>
                            <input type="text" class="form-control" id="panNumber" name="panNumber" required>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Privileges</legend>
                    <div class="privileges-container row-eq-height">
                        <div class="form-check">
                            <input type="checkbox" id="priv1" name="cities" value="true">
                            <label for="priv1">Cities</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv2" name="states" value="true">
                            <label for="priv2">States</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv3" name="countries" value="true">
                            <label for="priv3">Countries</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv4" name="vehicles" value="true">
                            <label for="priv4">Vehicles</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv5" name="vehiclemakes" value="true">
                            <label for="priv5">Vehicle Makes</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv6" name="vehiclemodels" value="true">
                            <label for="priv6">Vehicle Models</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv7" name="employee" value="true">
                            <label for="priv7">Employee</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv8" name="customers" value="true">
                            <label for="priv8">Customers</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv9" name="owners" value="true">
                            <label for="priv9">Owners</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv10" name="drivers" value="true">
                            <label for="priv10">Drivers</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="priv11" name="rentals" value="true">
                            <label for="priv11">Rentals</label>
                        </div>
                    </div>
                </fieldset>
                <button type="submit" class="btn btn-primary">Add</button>
            </fieldset>
        </form>
    </div>
</main>

<c:choose>
    <c:when test="${param.btn == 'Add'}">
        <%
        	System.out.println("Calling");
            Employees e = new Employees();
            e.setEmployeeNo(Integer.parseInt(request.getParameter("Number")));
            e.setName(request.getParameter("name"));
            e.setEmployeeType(request.getParameter("employeeType"));
            e.setAddressLine1(request.getParameter("addressLine1"));
            e.setAddressLine2(request.getParameter("addressLine2"));
            
            CityService cityService = new CityService();
            Cities city = cityService.getCity(Integer.parseInt(request.getParameter("city")));
            e.setCityNo(city);
            
            StateService stateService = new StateService();
            States state = stateService.getState(Integer.parseInt(request.getParameter("state")));
            e.setStateNo(state);
            
            CountriesService countryService = new CountriesService();
            Countries country = countryService.getCountry(Integer.parseInt(request.getParameter("country")));
            e.setCountryNo(country);
            
            e.setPincode(request.getParameter("pincode"));
            e.setPhoneNumber(request.getParameter("phoneNumber"));
            e.setMobileNumber(request.getParameter("mobileNumber"));
            e.setEmailAddress(request.getParameter("email"));
            e.setBankName(request.getParameter("bankName"));
            e.setBankAccount(request.getParameter("accountNumber"));
            e.setPAN(request.getParameter("panNumber"));
            e.setUsername(request.getParameter("userName"));
            e.setPassword(request.getParameter("password"));

            e.setCities(request.getParameter("cities"));
            e.setStates(request.getParameter("states"));
            e.setCountries(request.getParameter("countries"));
            e.setVehicles(request.getParameter("vehicles"));
            e.setVehicleMakes(request.getParameter("vehicleMakes"));
            e.setVehicleModels(request.getParameter("vehicleModels"));
            e.setEmployees(request.getParameter("employees"));
            e.setCustomers(request.getParameter("customers"));
            e.setOwners(request.getParameter("owners"));
            e.setDrivers(request.getParameter("drivers"));
            e.setRentals(request.getParameter("rentals"));
            
            EmployeeService service = new EmployeeService();
            service.Add(e);
            response.sendRedirect("Employee.jsp?success=add");
        %>
    </c:when>
</c:choose>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
