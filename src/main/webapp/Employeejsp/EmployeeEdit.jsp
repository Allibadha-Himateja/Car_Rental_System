<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.iss.models.*, com.iss.services.*, java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee Details</title>
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
    System.out.println("Edit Started");
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

    int employeeNo = 0;
    String employeeName = null;
    String employeeType = null;
    String addressLine1 = null;
    String addressLine2 = null;
    Countries countryNo = null;
    States stateNo = null;
    Cities cityNo = null;
    String pincode = null;
    String phoneNumber = null;
    String mobileNumber = null;
    String emailAddress = null;
    String bankName = null;
    String bankAccount = null;
    String pan = null;
    String username = null;
    String password = null;
    String ci = null;
    String c = null;
    String s = null;
    String v = null;
    String vma = null;
    String vmo = null;
    String e = null;
    String cus = null;
    String own = null;
    String dri = null;
    String rent = null;
    
    if (request.getParameter("employeeNo") != null) {
        System.out.println("Into the if case");
        employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
        EmployeeService service = new EmployeeService();
        Employees emp = service.getEmployee(employeeNo);

        if (emp != null) {
            employeeName = emp.getEmployeeName();
            employeeType = emp.getEmployeeType();
            addressLine1 = emp.getAddressLine1();
            System.out.println(addressLine1);
            addressLine2 = emp.getAddressLine2();
            System.out.println(addressLine2);
            countryNo = emp.getCountryNo();
            stateNo = emp.getStateNo();
            cityNo = emp.getCityNo();
            pincode = emp.getPincode();
            phoneNumber = emp.getPhoneNumber();
            mobileNumber = emp.getMobileNumber();
            emailAddress = emp.getEmailAddress();
            bankName = emp.getBankName();
            bankAccount = emp.getBankAccount();
            pan = emp.getPAN();
            username = emp.getUsername();
            password = emp.getPassword();
            ci = emp.getCities();
            c = emp.getCountries();
            s = emp.getStates();
            v = emp.getVehicles();
            vma = emp.getVehicleMakes();
            vmo = emp.getVehicleModels();
            e = emp.getEmployees();
            cus = emp.getCustomers();
            own = emp.getOwners();
            dri = emp.getDrivers();
            rent = emp.getRentals();
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
    <h2>Edit Employee Details</h2>
    <div class="form-container mt-4">
        <form action="EmployeeEdit.jsp?btn=Edit" method="post">
            <fieldset>
                <legend>Employee Details</legend>
                <div class="form-group">
                    <label for="employeeNo">Employee Number</label>
                    <input type="text" class="form-control" id="employeeNo" name="employeeNo" value="<%= employeeNo %>" required>
                </div>
                <div class="form-group">
                    <label for="employeeName">Employee Name</label>
                    <input type="text" class="form-control" id="employeeName" name="employeeName" value="<%= employeeName %>" required>
                </div>
                <div class="form-group">
                    <label for="employeeType">Employee Type</label>
                    <select class="form-control" id="employeeType" name="employeeType" required>
                        <option value="Normal">Normal</option>
                        <option value="Administrator">Administrator</option>
                    </select>                
                </div>
             </fieldset>
                <fieldset>
                    <legend>Address Details</legend>
                    <div class="form-group">
                        <label for="address1">Address Line 1</label>
                        <input type="text" class="form-control" id="address1" name="address1" value="<%= addressLine1 %>" required>
                    </div>
                    <div class="form-group">
                        <label for="address2">Address Line 2</label>
                        <input type="text" class="form-control" id="address2" name="address2" value="<%= addressLine2 %>" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="country">Country</label>
                            <select class="form-control" id="country" name="country" required>
                                <option value="">Select Country</option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.countryNo}" <c:if test="${country.countryNo == countryNo.countryNo}">selected</c:if>>${country.country}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="state">State</label>
                            <select class="form-control" id="state" name="state" required>
                                <option value="">Select State</option>
                                <c:forEach items="${states}" var="state">
                                    <option value="${state.stateNo}" <c:if test="${state.stateNo == stateNo.stateNo}">selected</c:if>>${state.stateName}</option>
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
                                    <option value="${city.cityNo}" <c:if test="${city.cityNo == cityNo.cityNo}">selected</c:if>>${city.cityName}</option>
                                </c:forEach>
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
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="<%= phoneNumber %>" required>
                    </div>
                    <div class="form-group">
                        <label for="mobileNumber">Mobile Number</label>
                        <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="<%= mobileNumber %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= emailAddress %>" required>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Bank Details</legend>
                    <div class="form-group">
                        <label for="bankName">Bank Name</label>
                        <input type="text" class="form-control" id="bankName" name="bankName" value="<%= bankName %>" required>
                    </div>
                    <div class="form-group">
                        <label for="bankAccount">Bank Account</label>
                        <input type="text" class="form-control" id="bankAccount" name="bankAccount" value="<%= bankAccount %>" required>
                    </div>
                    <div class="form-group">
                        <label for="pan">PAN</label>
                        <input type="text" class="form-control" id="pan" name="pan" value="<%= pan %>" required>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Login Details</legend>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="<%= username %>" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
                    </div>
                </fieldset>
                <fieldset>
			    <legend>Privileges</legend>
			    <div class="privileges-container row-eq-height">
			        <div class="form-check">
			            <input type="checkbox" id="priv1" name="cities" value="true" <c:if test="${ci != null && ci.equals('true')}">checked</c:if>>
			            <label for="priv1">Cities</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv2" name="states" value="true" <c:if test="${s != null && s.equals('true')}">checked</c:if>>
			            <label for="priv2">States</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv3" name="countries" value="true" <c:if test="${c != null && c.equals('true')}">checked</c:if>>
			            <label for="priv3">Countries</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv4" name="vehicles" value="true" <c:if test="${v != null && v.equals('true')}">checked</c:if>>
			            <label for="priv4">Vehicles</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv5" name="vehiclemakes" value="true" <c:if test="${vma != null && vma.equals('true')}">checked</c:if>>
			            <label for="priv5">Vehicle Makes</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv6" name="vehiclemodels" value="true" <c:if test="${vmo != null && vmo.equals('true')}">checked</c:if>>
			            <label for="priv6">Vehicle Models</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv7" name="employee" value="true" <c:if test="${e != null && e.equals('true')}">checked</c:if>>
			            <label for="priv7">Employee</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv8" name="customers" value="true" <c:if test="${cus != null && cus.equals('true')}">checked</c:if>>
			            <label for="priv8">Customers</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv9" name="owners" value="true" <c:if test="${own != null && own.equals('true')}">checked</c:if>>
			            <label for="priv9">Owners</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv10" name="drivers" value="true" <c:if test="${dri != null && dri.equals('true')}">checked</c:if>>
			            <label for="priv10">Drivers</label>
			        </div>
			        <div class="form-check">
			            <input type="checkbox" id="priv11" name="rentals" value="true" <c:if test="${rent != null && rent.equals('true')}">checked</c:if>>
			            <label for="priv11">Rentals</label>
			        </div>
			    </div>
			</fieldset>
            <button type="submit" class="btn btn-primary mt-3">Save</button>
        </form>
    </div>
</main>
<!-- jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
