
[![N|Solid](https://i2.wp.com/www.kaldata.com/wp-content/uploads/2018/06/Telerik_Academy_Logo2x.png)](https://telerikacademy.com)

[![N|Solid](https://fitsmallbusiness.com/wp-content/uploads/2018/11/Paysafe-logo.gif)](https://www.paysafe.com/na-en/)
# Car service | Final Project Assignment

## General Project Requirements

### Java Final Project

This document describes the final project assignment for the Java cohort at Telerik Academy. 

### Project Description

Your task is to develop CAR SERVICE web application. CAR SERVICE enables the owners of car services to manage their day-to-day job. It must have a list with cars (manufacturer, model, year) and all available services (oil change, filters change etc.) and their price. The system must have a list with all customers and their contact information (Name, telephone, email etc.). You must be able link specific car/cars to customer. Each specific car must have some identification details (registration plate number, VIN etc.). CAR SERVICE should keep history of all services done on customer’s car/cars. The software must be able to generate pdf with all performed services for a given service of the car and the total price for all done services. For all customers, а profile can be generated providing them with access to their personal information via the web UI. Profile is generated by the administrator using the system and the login information is sent to customer’s email. Generated profile is as follows: username: {customer’s email address} password: {random string value}. 

# Web application
### Customers Part

The web application provides users with UI to view their personal information and history of all car services. To be able to access its information each customer must first authenticate. Customers must be able to change their password and also have the option “forgot my password”.

### Administration Part
System administrators should have administrative access to the system and permissions to administer all major information objects in the system, e.g. to create/edit/delete customers, cars, services etc. Administrator must be able to generate profile in the system for each customer. Generate pdf with performed services and reset customers passwords.


# REST API
Behind every great **web application** is a great **backend**. The project should have **Spring REST API implementation** to serve the UI and get/store data from the database. Don’t forget to follow good coding practices when implementing the API.

# Database
All CAR SERVICE data should be stored in SQL **database**.

# General Requirements
Your project should meet the following requirements (these requirements will be used by TA trainers during project defense): 

-	Use **IntelliJ IDEA**
-	For the web application (UI) you can choose from two tasks
 -	Use **SpringBoot** Framework
 -	You may use **Thymeleaf** template engine for generating the UI
 - Research and build Single Page Application to serve the UI with JavaScript library of your choice. Please, keep in mind that we have not covered this in our sessions, so it is totally up to you how to implement the authentication and other SPA specifics that depend on the library you choose.
-	Use **MySQL (MariaDB)** as database back-end 
 -	Use **Hibernate** to access your database
 -	Using **repositories and/or service layer** is a must
And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.
-	Create beautiful and interactive web UI
 -	You may use **Bootstrap** or **Materialize**
 -	You may change the standard theme and modify it to apply own web design and visual styles 
-	Apply **error handling** and **data validation** to avoid crashes when invalid data is entered (both client-side and server-side) 
-	Use **Spring Security** for managing users and roles
 -	Your registered users should have at least one of the two roles: **customer** and **administrator**
-	Create **unit tests** for your "business" functionality following the best practices for writing unit tests (**at least 80% code coverage**) 
-	Use **Inversion of Control** principle and **Dependency Injection** technique
-	Follow **OOP** best practices and **SOLID** principles
-	Use **Git** for source control management
-	Use **Trello** for project management
-	Create **user documentation / manual** of the application
# Optional Requirements (bonus points)

-	Integrate your app with a **Continuous Integration server** (e.g. Jenkins or other). Configure your unit tests **to run on each commit** to your master branch 
-	Host your application’s backend in a public hosting provider of your choice (e.g. AWS, Azure)

# Deliverables
Provide link to a Git repository with the following information:
-	[Link to the Trello board](https://trello.com/b/affJHaAo/team6)
-	Project documentation
-	Screenshots of your application
-	URL of the application (if hosted online)
# Public Project Defense

Each student must make a **public defense** of its work to the trainers, Partner and students (~30-40 minutes). It includes:
-	**Live demonstration** of the developed web application (please prepare sample data). 
-	Explain application structure and its **source code**
