<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Menu</title>
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

        .menu-item {
            padding: 20px;
            border: 2px solid #007bff;
            border-radius: 10px;
            background-color: #ffffff;
            transition: box-shadow 0.3s, transform 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .menu-item:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-5px);
        }

        .menu-item h3 {
            font-size: 22px;
            color: #007bff;
            margin-bottom: 15px;
        }

        .menu-item a {
            display: block;
            color: #007bff;
            text-decoration: none;
            padding: 8px 0;
            transition: color 0.3s;
        }

        .menu-item a:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        .menu-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        @media (max-width: 768px) {
            .menu-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<header class="bg-dark text-white p-3">
    <div class="container header-container">
        <h1 class="h4">Administration</h1>
        <div class="links">
        	<a href="UserHome.jsp?user=employee" class="btn btn-secondary btn-sm" title="Back"><i class="fas fa-arrow-left"></i></a>
            <a href="#" class="btn btn-secondary btn-sm" title="Login"><i class="fas fa-sign-in-alt"></i></a>
        </div>
    </div>
</header>

<main class="container mt-4">
    <h2>Main Menu</h2>
    <div class="menu-container">
        <div class="menu-item">
            <h3>Vehicle Management</h3>
            <a href="VehicleMakesjsp/VehicleMakes.jsp">VehicleMake Details</a>
            <a href="VehicleModelsjsp/VehicleModels.jsp">VehicleModel Details</a>
            <a href="Vehiclesjsp/Vehicle.jsp">Vehicle Details</a>
        </div>

        <div class="menu-item">
            <h3>Location Management</h3>
            <a href="Countryjsp/Countries.jsp">Country Details</a>
            <a href="Statesjsp/States.jsp">State Details</a>
            <a href="Citiesjsp/Cities.jsp">City Details</a>
        </div>

        <div class="menu-item">
            <h3>User Management</h3>
            <a href="Employeejsp/Employee.jsp">Employee Details</a>
            <a href="Customerjsp/Customer.jsp">Customer Details</a>
        </div>

        <div class="menu-item">
            <h3>Driver Management</h3>
            <a href="Driversjsp/Driver.jsp">Driver Details</a>
        </div>

        <div class="menu-item">
            <h3>Reservation Management</h3>
            <a href="#">Reservation Details</a>
            <a href="#">View Reservations for Today</a>
            <a href="#">View Reservations for Tomorrow</a>
            <a href="#">View Reservations for Next 7 Days</a>
            <a href="#">View Reservations for This Month</a>
            <a href="#">View Reservations for Next Month</a>
        </div>

        <div class="menu-item">
            <h3>Owner Management</h3>
            <a href="Ownersjsp/Owners.jsp">Owner Details</a>
        </div>
    </div>
</main>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
