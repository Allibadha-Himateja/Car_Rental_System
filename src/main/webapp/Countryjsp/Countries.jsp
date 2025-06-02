<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iss.models.Countries,com.iss.services.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Country Details</title>
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

        .country-table {
            width: 100%;
            border-collapse: collapse;
        }

        .country-table th, .country-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .country-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #007bff;
        }

        .country-table td .actions a {
            margin-left: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .country-table td .actions a:hover {
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
    List<Countries> list = null;
    List<Countries> sublist = null;
    int r = 0;
    int tempint = 0;
    int size = 0;
    try {
        list = new CountriesService().getCountries();
        if (request.getParameter("countrytemp") != null && request.getParameter("countrytemp").equals("1")) {
            HttpSession s = request.getSession();
            String countrytemp = (String) s.getAttribute("countrytemp");
            list = new CountriesService().Search(countrytemp);
        }
        size = list.size();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Location Management</h1>
        <div class="links">
            <a href="http://localhost:8080/simple-webapp/MainMenu.jsp" class="btn btn-secondary btn-sm" title="Home"><i class="fas fa-home"></i></a>
            <a href="CountryAdd.jsp?Btn=Add Country" class="btn btn-secondary btn-sm" title="Add"><i class="fas fa-plus"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <form action="Countries.jsp?Btn=Search" method="post">
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
    request.setAttribute("sublist", sublist);
%>

    <fieldset class="border p-2">
        <legend class="w-auto">Country List</legend>
        <div class="scrollable-list">
            <div class="table-container">
                <table class="country-table">
                    <thead>
                        <tr>
                            <th>CountryNo</th>
                            <th>Country</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty sublist}">
                                <tr>
                                    <td colspan="3">No Countries are there in the DataBase yet.....</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${sublist}" var="c">
                                    <tr>
                                        <td>${c.countryNo}</td>
                                        <td>${c.country}</td>
                                        <td class="actions">
                                            <a href="CountryEdit.jsp?countryNo=${c.countryNo}&countryname=${c.country}" class="btn btn-outline-primary btn-sm" title="Modify"><i class="fas fa-pencil-alt"></i></a>
                                            <a href="Countries.jsp?Btn=Delete&countryNo=${c.countryNo}" class="btn btn-outline-danger btn-sm" title="Delete"><i class="fas fa-trash-alt"></i></a>
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
                <a class="page-link" href="Countries.jsp?pageno=${currpage-1}">&laquo; Prev</a>
            </li>
            <c:forEach var="i" begin="${currpage}" end="${currpage+2}">
                <li class="page-item"><a class="page-link" href="Countries.jsp?pageno=${i}">${i}</a></li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="Countries.jsp?pageno=${currpage+1}">Next &raquo;</a></li>
        </ul>
    </nav>
</main>

<c:choose>
    <c:when test="${param.Btn=='Delete'}">
        <jsp:useBean id="country" class="com.iss.models.Countries" scope="request">
            <jsp:setProperty name="country" property="countryNo" value="${param.countryNo}" />
        </jsp:useBean>
        <%
            String countryNo = request.getParameter("countryNo");
            CountriesService cs = new CountriesService();
            cs.Delete(Integer.parseInt(countryNo));
            response.sendRedirect("Countries.jsp?success=delete");
        %>
    </c:when>
    <c:when test="${param.Btn=='Search'}">
        <%
            String countrytemp = request.getParameter("filter");
            CountriesService cs = new CountriesService();
            HttpSession s = request.getSession();
            s.setAttribute("countrytemp", countrytemp);
            response.sendRedirect("Countries.jsp?countrytemp=1");
        %>
    </c:when>
</c:choose>

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
                <!-- This text will be dynamically updated based on the action -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('success')) {
            let successMessage = 'Operation was successful!';
            const successType = urlParams.get('success');
            if (successType === 'add') {
                successMessage = 'Country has been successfully added!';
            } else if (successType === 'edit') {
                successMessage = 'Country has been successfully modified!';
            } else if (successType === 'delete') {
                successMessage = 'Country has been successfully deleted!';
            }
            $('#successModalBody').text(successMessage);
            $('#successModal').modal('show');
        }
    });
</script>

</body>
</html>
