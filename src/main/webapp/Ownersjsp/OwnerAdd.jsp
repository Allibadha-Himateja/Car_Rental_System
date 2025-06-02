<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Details</title>
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
	List<Countries> countries=null;
	if(request.getParameter("Btn")!=null)
	{
		try{
			CountriesService cs=new CountriesService();
		    countries=cs.getCountries();
		    request.setAttribute("countries",countries);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	List<States> states=null;
	if(request.getParameter("Btn")!=null)
	{
		try{
			StateService s=new StateService();
		    states=s.getStates();
		    request.setAttribute("states",states);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	List<Cities> cities=null;
	if(request.getParameter("Btn")!=null)
	{
		try{
			CityService c=new CityService();
		    cities=c.getCities();
		    request.setAttribute("cities",cities);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Owner Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="Owners.jsp" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Add OwnerDetails</h2>
    <div class="form-container mt-4">
        <form action="OwnerAdd.jsp?btn=Add" method="post">
            <fieldset>
                <legend>Owner Details</legend>
                <div class="form-group">
                    <label for="Number">Owner Number</label>
                    <input type="text" class="form-control" id="Number" name="Number" required>
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <fieldset>
                    <legend>Address Details</legend>
                    <div class="form-group">
                        <label for="address1">Address1</label>
                        <input type="text" class="form-control" id="address1" name="address1" required>
                    </div>
                    <div class="form-group">
                        <label for="address2">Address2</label>
                        <input type="text" class="form-control" id="address2" name="address2" required>
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
                <div class="form-group d-flex justify-content-center">
                    <button type="reset" name="btn" value="Clear" class="btn btn-secondary mr-2">Clear</button>
                    <button type="submit" name="btn" value="Save" class="btn btn-primary">Save</button>
                </div>
            </fieldset>
        </form>
    </div>
</main>

<c:choose>
    <c:when test="${param.btn == 'Add'}">
        <%
            Owners d=new Owners();
            d.setOwnerNo(Integer.parseInt(request.getParameter("Number")));
            d.setName(request.getParameter("name"));
            d.setAddress1(request.getParameter("address1"));
            d.setAddress2(request.getParameter("address2"));
            CityService cs=new CityService();
            Cities c=cs.getCity(Integer.parseInt(request.getParameter("city")));
            d.setCityNo(c);
            StateService s=new StateService();
            States ss=s.getState(Integer.parseInt(request.getParameter("state")));
            d.setStateNo(ss);
            CountriesService cc=new CountriesService();
            Countries co=cc.getCountry(Integer.parseInt(request.getParameter("country")));
            d.setCountryNo(co);
            d.setPincode(request.getParameter("pincode"));
            d.setPhoneNumber(request.getParameter("phoneNumber"));
            d.setMobileNumber(request.getParameter("mobileNumber"));
            d.setBankName(request.getParameter("bankName"));
            d.setBankAccount(request.getParameter("accountNumber"));
            d.setPAN(request.getParameter("panNumber"));
            System.out.println(request.getParameter("panNumber"));
            OwnerService os=new OwnerService();
            os.Add(d);
            response.sendRedirect("Owners.jsp?success=add");
        %>
    </c:when>
</c:choose>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
