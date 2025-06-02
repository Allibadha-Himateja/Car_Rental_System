🚗 Car Rental System
Overview
The Car Rental System is a web-based Java application for managing the operations of a car rental business. It supports managing vehicles, customers, drivers, employees, and geographic entities like states and countries. Built using Java EE, JSP, and JPA (Hibernate), the application follows an MVC-like structure with clearly separated models and service layers.

📁 Project Structure
bash
Copy
Edit
Car_Rental_System/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com.iss.models         # JPA entity classes
│   │   │   ├── com.iss.services       # Business logic/services
│   │   │   └── Main/                  # Main entry class
│   │   │       └── Main.java
│   │   └── resources/
│   │       └── META-INF/
│   │           └── persistence.xml    # JPA configuration
│   ├── test/
│   │   ├── java/                      # Unit tests (if any)
│   │   └── resources/
│
├── target/
│   └── simple-webapp/
│       ├── Citiesjsp/
│       ├── Countryjsp/
│       ├── Customerjsp/
│       ├── Driversjsp/
│       ├── Employeejsp/
│       ├── Ownersjsp/
│       ├── Statesjsp/
│       ├── VehicleMakesjsp/
│       ├── VehicleModelsjsp/
│       └── Vehiclesjsp/
│
├── IMAGES/                            # Static image resources
├── META-INF/                          # Deployment metadata
├── pom.xml                            # Maven configuration
└── Deployment Descriptor: simple-webapp
🧩 Technologies Used
Java EE / Jakarta EE

JSP (Java Server Pages)

JPA (Hibernate) for ORM

Maven for build and dependency management

Tomcat / any servlet container (for deployment)

