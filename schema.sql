Create database
CREATE DATABASE employees_db;
 
USE employees_db;


Table: Locations
CREATE TABLE locations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  state VARCHAR(100),
  country VARCHAR(100) NOT NULL,
  UNIQUE KEY uk_location (name, state, country)
) ENGINE=InnoDB;

Table: Designations
CREATE TABLE designations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

Table : Employees
CREATE TABLE employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  employee_code VARCHAR(20) NOT NULL UNIQUE,
  name VARCHAR(150) NOT NULL,
  gender ENUM('Male','Female','Other') NOT NULL,
  email VARCHAR(200) NOT NULL UNIQUE,
  age INT NOT NULL,
  location_id INT NOT NULL,
  designation_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_emp_location FOREIGN KEY (location_id) REFERENCES locations(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_emp_designation FOREIGN KEY (designation_id) REFERENCES designations(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT chk_age CHECK (age BETWEEN 5 AND 100)
) ENGINE=InnoDB;

Inserting Data into Tables
INSERT INTO locations (name, state, country) VALUES
('Hyderabad', 'Telangana', 'India'),
('Bengaluru', 'Karnataka', 'India'),
('Chennai', 'Tamil Nadu', 'India'),
('Pune', 'Maharashtra', 'India');

Inserting Data into Tables
INSERT INTO designations (name) VALUES
('Software Engineer'),
('Software Tester'),
('Senior Engineer'),
('Team Lead');
