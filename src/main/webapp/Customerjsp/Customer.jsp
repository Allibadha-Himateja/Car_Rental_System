<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.*,com.iss.services.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
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

        fieldset {
            border: 1px solid #007bff;
            padding: 20px;
            border-radius: 8px;
        }

        legend {
            padding: 0 10px;
            font-size: 20px;
            font-weight: bold;
            color: #007bff;
        }

        .scrollable-list {
            max-height: 400px; /* Set the height as needed */
            overflow-y: auto;
        }

        .table-container {
            overflow-x: auto;
        }

        .customer-table {
            width: 100%;
            border-collapse: collapse;
        }

        .customer-table th, .customer-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .customer-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #007bff;
        }

        .customer-table td .actions a {
            margin-left: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .customer-table td .actions a:hover {
            background-color: #007bff;
            color: white;
        }

        .pagination .page-link {
            color: #007bff;
        }

        .pagination .page-link:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<%
    List<Customers> list = null;
    List<Customers> sublist = null;
    int r = 0;
    int tempint = 0;
    int size = 0;
    try {
        list = new CustomerService().getCustomers();
        if (request.getParameter("customertemp") != null && request.getParameter("customertemp").equals("1")) {
            HttpSession s = request.getSession();
            String customertemp = (String) s.getAttribute("customertemp");
            list = new CustomerService().Search(customertemp); // Assuming Search is implemented
        }
        size = list.size();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Customer Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="CustomerAdd.jsp?Btn=Add Customer" class="btn btn-secondary btn-sm" title="Add"><i class="fas fa-plus"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <form action="Customer.jsp?Btn=Search" method="post">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Filter" id="filter" name="filter">
            <div class="input-group-append">
                <button type="submit" class="btn btn-outline-secondary" title="Search">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

<%
    String t = request.getParameter("pageno");
    int pageno = (t == null) ? 0 : Integer.parseInt(t);
    int currpage = (pageno == 0) ? 1 : pageno;
    request.setAttribute("currpage", currpage);
    r = (pageno == 0) ? 0 : (5 * pageno - 5) + 1;
    int start = (r == 1) ? 0 : r;
    int z = size - start;
    int end = (z < 5) ? start + z : start + 5;
    if (end < size && start - end == 5) {
        sublist = list.subList(start, end);
    } else {
        sublist = new ArrayList<>();
        int i = (start - 1 < 0) ? 0 : start - 1;
        for (int j = i; j < size; j++) {
            sublist.add(list.get(j));
            if (sublist.size() == 5) {
                break;
            }
        }
    }
    request.setAttribute("customers", sublist);
%>

    <fieldset class="border p-2">
    <legend class="w-auto">Customer Details</legend>
    <div class="scrollable-list">
        <div class="table-container">
            <table class="customer-table">
                <thead>
                    <tr>
                        <th>CustomerNo</th>
                        <th>CustomerName</th>
                        <th>PhoneNumber</th>
                        <th>EmailAddress</th>
                        <th>Username</th>
                        <th>RegistrationDate</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty customers}">
                            <tr>
                                <td colspan="7">No Customers are there in the DataBase yet.....</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${customers}" var="c">
                                <tr>
                                    <td>${c.customerNo}</td>
                                    <td>${c.name}</td>
                                    <td>${c.phoneNumber}</td>
                                    <td>${c.emailAddress}</td>
                                    <td>${c.username}</td>
                                    <td>${c.registrationDate}</td>
                                    <td class="actions">
                                        <a href="CustomerEdit.jsp?Btn=Edit&customerNo=${c.customerNo}" class="btn btn-outline-primary btn-sm" title="Modify"><i class="fas fa-pencil-alt"></i></a>
                                        <a href="Customer.jsp?Btn=Delete&number=${c.customerNo}" class="btn btn-outline-danger btn-sm" title="Delete"><i class="fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</fieldset>

    <nav class="mt-4">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="Customer.jsp?pageno=${currpage-1}">&laquo; Prev</a>
            </li>
            <c:forEach var="i" begin="${currpage}" end="${currpage+2}">
                <li class="page-item"><a class="page-link" href="Customer.jsp?pageno=${i}">${i}</a></li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="Customer.jsp?pageno=${currpage+1}">Next &raquo;</a></li>
        </ul>
    </nav>
</main>

<c:choose>
    <c:when test="${param.Btn=='Delete'}">
        <jsp:useBean id="customer" class="com.iss.models.Customers" scope="request">
            <jsp:setProperty name="customer" property="customerNo" value="${param.number}" />
        </jsp:useBean>
        <%
            String Number = request.getParameter("number");
            CustomerService ds = new CustomerService();
            ds.Delete(Integer.parseInt(Number));
            response.sendRedirect("Customer.jsp?success=delete");
        %>
    </c:when>
    <c:when test="${param.Btn=='Search'}">
        <%
            String customertemp = request.getParameter("filter");
            CustomerService ds = new CustomerService();
            HttpSession s = request.getSession();
            s.setAttribute("customertemp", customertemp);
            response.sendRedirect("Customer.jsp?customertemp=1");
        %>
    </c:when>
</c:choose>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
