CREATE DATABASE IF NOT EXISTS employee_performance;
USE employee_performance;

CREATE TABLE employees (
    employee_id VARCHAR(10) PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    role VARCHAR(50),
    join_date DATE
);

CREATE TABLE performance_quarterly (
    employee_id VARCHAR(10),
    quarter VARCHAR(5),
    performance_score DECIMAL(5,1),
    target_score DECIMAL(5,1),
    projects_completed INT,
    training_hours DECIMAL(5,1),
    achievement_status VARCHAR(30),
    PRIMARY KEY (employee_id, quarter),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
