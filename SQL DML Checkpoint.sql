CREATE TABLE Employee(
Num_E INT PRIMARY KEY,
employee_name VARCHAR(50) NOT NULL,
emloyee_position VARCHAR(50),
salary NUMERIC(10,2),
department_Num_S INT,
FOREIGN KEY (department_Num_S) REFERENCES department(Num_S)
);

INSERT INTO Employee
VALUES (101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

SELECT * FROM Employee

CREATE TABLE Project(
Num_P INT PRIMARY KEY,
tittle VARCHAR(30),
start_date DATE,
end_date DATE,
department_Num_S INT,
FOREIGN KEY (department_Num_S) REFERENCES department(Num_S)
);

INSERT INTO project
VALUES (201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

SELECT * FROM Project


CREATE TABLE Department(
Num_S INT PRIMARY KEY,
label VARCHAR(50) NOT NULL,
manager_name VARCHAR(50) NOT NULL
);

INSERT INTO department
VALUES (1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennet');


CREATE TABLE Employee_Project(
Employee_Num_E INT,
Project_Num_P INT,
role VARCHAR(30) NOT NULL, 
PRIMARY KEY (Employee_Num_E, Project_Num_P),
FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E),
FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P)
);


INSERT INTO Employee_Project
VALUES (101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');

SELECT * FROM Employee_Project

UPDATE Employee_Project
SET role = 'Full Stack Developer'
WHERE Employee_Num_E = 101 AND Project_Num_P = 201;

DELETE FROM Employee 
WHERE Num_E = 103;

DELETE FROM Employee_Project
WHERE Employee_Num_E = 103;


