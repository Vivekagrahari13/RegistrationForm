# RegistrationForm

Registration Form: A simple log in - log out registration form project. Project Overview: This project is a web application that implements a user registration form with login and logout functionalities. The application is developed using Java, Servlets, JDBC, and MySQL database for user data storage. Users can register with their details, log in using their credentials, and log out to terminate their session.

Features:

Registration Form:

Users can fill in their name, email, password, and upload a profile image. The server-side validation ensures that all required fields are filled before registration. The uploaded image is stored in a specified folder on the server, and its path is saved in the database. Login Functionality:

Users can log in with their registered email and password. The server verifies the login credentials with the database. After successful login, a user session is created, allowing access to protected pages. Session Handling:

A user session is created upon successful login, and the user's email is stored in the session. The session is used to prevent users from registering again with the same email until the session is invalidated. Users can log out to terminate their session, which clears the session data.

Dependencies:

Apache Tomcat (for running the application) MySQL Connector/J (JDBC driver for MySQL) Setup and Configuration:

Install Apache Tomcat and set up the server environment. Create a MySQL database named 'register' and import the 'user' table schema. Configure the 'WEB-INF/web.xml' file for servlet mappings and URL patterns. Ensure that the required libraries, such as 'mysql-connector-java.jar,' are added to the project. Usage:

Users can access the registration form on the homepage ('index.jsp') and provide their details. After successful registration, users can log in using their email and password on the login page ('login.jsp'). Upon login, users will be redirected to the welcome page ('welcome.jsp'), where their session is active. Users can log out by clicking the 'Logout' link, which terminates their session and redirects to 'logout.jsp.' Note:

Make sure to handle exceptions, form validation, and security measures like password hashing for a production-ready application. Conclusion: The Login, Logout, and Registration Form web application provide users with a seamless experience to register, log in, and log out securely. The application utilizes Java Servlets, JDBC, and MySQL database for data storage and session management. With proper setup and configuration, the application is ready for deployment on an Apache Tomcat server.

Thank you!!
