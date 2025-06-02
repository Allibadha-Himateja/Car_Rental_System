<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit CustomerDetails</title>
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
        
        .password-container {
            position: relative;
            display: flex;
            align-items: center;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #495057;
        }
    </style>
</head>
<body>

<%
	System.out.println("Edit Stared");
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
	
	String Name = null;
    int customerid = 0;
    String EmailAddress = null;
    String address1 = null;
    String address2 = null;
    int countryNo = 0;
    int stateNo = 0;
    int cityNo = 0;
    String pincode = null;
    String phoneNumber = null;
    String mobileNumber = null;
    String Username = null;
    String password=null;
    Date RegistrationDate= null;
    Date LastLogin=null;
    String DeleteStatus = null;
    
    if (request.getParameter("customerNo") != null) {
    	System.out.println("into the if case");
    	customerid = Integer.parseInt(request.getParameter("customerNo"));
        CustomerService Service = new CustomerService();
        Customers c = Service.getCustomer(customerid);

        if (c != null) {
            Name = c.getName();
            System.out.print(Name);
            EmailAddress = c.getEmailAddress();
            address1 = c.getAddressLine1();
            address2 = c.getAddressLine2();
            countryNo = c.getCountryNo().getCountryNo();
            stateNo = c.getStateNo().getStateNo();
            cityNo = c.getCityNo().getCityNo();
            pincode = c.getPincode();
            phoneNumber = c.getPhoneNumber();
            mobileNumber = c.getMobileNumber();
            Username = c.getUsername();
            password = c.getPassword();
        }
    }
%>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Customer Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="Customer.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Add Customer Details</h2>
    <div class="form-container mt-4">
        <form action="CustomerEdit.jsp?btn=Add" method="post">
            <fieldset>
                <legend>Customer Details</legend>
                <div class="form-group">
                    <label for="Number">Customer Number</label>
                    <input type="text" class="form-control" id="Number" name="Number" value="<%= customerid %>" required>
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= Name %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= EmailAddress %>" required>
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
                            <label for="country">Country</label>
                            <select class="form-control" id="country" name="country" required>
                                <!-- Populate dropdown with countries -->
                                <option value="">Select Country</option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.countryNo}">${country.country}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="state">State</label>
                            <select class="form-control" id="state" name="state" required>
                                <!-- Populate dropdown with states -->
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
                                <!-- Populate dropdown with cities -->
                                <option value="">Select City</option>
                                <c:forEach items="${cities}" var="city">
                                    <option value="${city.cityNo}">${city.cityName}</option>
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
                    <legend>Login Details</legend>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="userName">UserName</label>
                            <input type="text" class="form-control" id="userName" name="userName" value="<%= Username %>" required>
                        </div>
                        <div class="form-group col-md-6 password-container">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
                            <button type="button" class="btn btn-light toggle-password">Show</button>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group d-flex justify-content-center">
                    <button type="reset" name="btn" value="Clear" class="btn btn-secondary mr-2">Clear</button>
                    <button type="submit" name="btn" value="Save" class="btn btn-primary">Save</button>
                </div>
            </fieldset>
        </form>
    </div>
</main>

<c:choose>
    <c:when test="${param.btn == 'Edit'}">
        <%
        CustomerService service= new CustomerService();
        if (request.getParameter("Name") != null && request.getParameter("Number") != null) {
            int customerno = Integer.parseInt(request.getParameter("Number"));
            String name = request.getParameter("Name");
            String email = request.getParameter("email");
            String pno = request.getParameter("phoneNumber");
            String mno=request.getParameter("mobileNumber");
            String addr1=request.getParameter("address1");
            String addr2=request.getParameter("address2");
            String pin=request.getParameter("pincode");
            int tempcno = Integer.parseInt(request.getParameter("countryNo"));
            int tempsno=Integer.parseInt(request.getParameter("stateNo"));
            int tempcino=Integer.parseInt(request.getParameter("cityNo"));
            String username=request.getParameter("userName");
            String passwrd=request.getParameter("passeword");
            service.Edit(customerno,name,email,addr1,addr2,tempcino,tempsno,tempcno,pin, pno, mno, username,passwrd);
            response.sendRedirect("Driver.jsp?success=edit");
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
