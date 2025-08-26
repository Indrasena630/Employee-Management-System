**EMPLOYEE MANAGEMENT SYSTEM**(Java Console App using JDBC & MySQL)
1. PROJECT OVERVIEW
-------------------
This is a console-based Employee Management System built in Java using JDBC and MySQL.
It allows users to perform CRUD (Create, Read, Update, Delete) operations on employee records,
with proper error handling and data validation.

Features:
- Insert new employee with validation
- Retrieve employee records with linked location and designation
- Update employee details
- Delete employee by ID
- Handles invalid inputs and database errors gracefully


2. PREREQUISITES
----------------
- Java JDK 8 or higher
- MySQL Server (running locally on port 3306)
- MySQL JDBC Connector (mysql-connector-j-x.x.jar)


3. DATABASE SETUP
-----------------
Run the schema.sql file in MySQL:

    mysql -u root -p < schema.sql

This will:
- Create database: employees_db
- Create tables: Employees, Locations, Designations
- Insert sample records into Locations and Designations


4. CONFIGURATION
----------------
In EmployeeManagementApp.java, update your DB credentials:

    private static final String DB_USER = "root";     
    private static final String DB_PASS = "password";  

Also make sure DB URL has:

    jdbc:mysql://localhost:3306/employees_db?useSSL=false&allowPublicKeyRetrieval=true


5. COMPILATION & EXECUTION
--------------------------
1) Compile:

    javac -cp .:mysql-connector-j-8.0.xx.jar EmployeeManagementApp.java

2) Run:

    java -cp .:mysql-connector-j-8.0.xx.jar EmployeeManagementApp

(Note: On Windows replace ":" with ";" in classpath)


6. SAMPLE USAGE
---------------
Main Menu:
    === Employee Management System (Console, JDBC/MySQL) ===
    1. Insert Employee
    2. List Employees
    3. Update Employee
    4. Delete Employee
    5. Exit
    Choose:

Insert Employee:
    Enter name: John Doe
    Enter gender (Male/Female/Other): Male
    Enter email: john@example.com
    Enter age: 30
    Enter location_id: 1
    Enter designation_id: 1
    Employee inserted successfully

List Employees:
    --- Employees ---
    [1] Indra | Male | indra@example.com | Age: 30 | Hyderabad | Software Engineer

Update Employee:
    Enter employee_id to update: 1
    Enter new email (leave blank to keep): john.doe@company.com
    Enter new age (0 to skip): 32
    Employee updated successfully

Delete Employee:
    Enter employee_id to delete: 1
    Employee deleted successfully


7. ERROR HANDLING
-----------------
- Database connection failures → shows "Could not connect to database" message
- SQL exceptions (duplicate email, syntax errors) → handled with proper error messages
- Invalid inputs (empty name, invalid email, wrong age) → validation prevents insertion
- Missing records on update/delete → handled gracefully with a message


8. COMMON ISSUES & FIXES
------------------------
- Error: Public Key Retrieval is not allowed
  Fix: Add "?allowPublicKeyRetrieval=true" to DB URL

- Error: Access denied for user
  Fix: Check DB username/password in code

- Error: Unknown database 'employees_db'
  Fix: Run schema.sql before starting app


