CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
Name VARCHAR(50),
Position VARCHAR(50),
Salary DECIMAL(10, 2),
DepartmentID INT
);

CREATE TABLE Departments(
DepartmentID INT PRIMARY KEY,
Label VARCHAR(50),
ManagerName VARCHAR(50)
);

CREATE TABLE Projects(
ProjectID INT PRIMARY KEY,
Title VARCHAR(50),
DepartmentID INT
);

CREATE TABLE EmployeeProjects(
EmployeeID INT,
ProjectID INT,
Role VARCHAR(50),
PRIMARY KEY (EmployeeID, ProjectID)
);

INSERT INTO Employees (EmployeeID, Name, Position, Salary, DepartmentID) VALUES
(1,'Alice', 'Software Engineer', 75000, 1),
(2,'Bob', 'Project Engineer', 90000, 1),
(3,'Charlie', 'Designer', 60000, 2),
(4,'Diana', 'Software Engineer', 70000, 2),
(5,'Eve', 'Data Anaylst', 65000, 3);

SELECT * FROM Employees

INSERT INTO Departments (DepartmentID, Label, ManagerName) VALUES
(1, 'IT', 'John Doe'),
(2, 'Design', 'Jane Smith'),
(3, 'IT', 'Sam Wilson');

SELECT * FROM Departments

INSERT INTO Projects (ProjectID, Title, DepartmentID) VALUES
(1, 'Website Redesign', 1),
(2, 'Mobile App', 2),
(3, 'Data Migration', 3),
(4, 'SEO Optimization', 3);

SELECT * FROM Projects

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, Role) VALUES
(1, 1, 'Developer'),
(1, 2, 'Tester'),
(2, 1, 'Manager'),
(3, 2, 'Designer'),
(4, 1, 'Tester'),
(4, 3, 'Developer'),
(5, 3, 'Analyst'),
(5, 4, 'Analyst');

SELECT * FROM EmployeeProjects

-- Write a query to retrieve the names of employees who are assigned to more than one project,including the total number of projects for each employee.
SELECT e.Name, COUNT(ep.projectid) AS TotalProject
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.Name
HAVING COUNT(ep.projectid) > 1

-- Write a query to retrieve the list of projects managed by each department, including the department label and manager's name 
SELECT Departments.Label, Departments.ManagerName, Projects.title
FROM Departments
Join Projects ON Departments.DepartmentID = Projects.DepartmentID

-- Write a query to retrieve the names of employees working on the project "Website Redesign," including their roles in the project
SELECT e.Name, ep.Role, p.Title
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE p.Title = 'Website Redesign';

-- Write a query to retrieve the department with the highest number of employees, including the department label, manager name, and the total number of employees
SELECT d.Label AS DepartmentLabel, d.ManagerName, COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.Label, d.ManagerName
ORDER BY TotalEmployees DESC
LIMIT 1;

-- Write a query to retrieve the names and positions of employees earning a salary greater than 60,000, including their department names
SELECT e.Name, e.Position, d.Label AS DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 60000;

-- Write a query to retrieve the number of employees assigned to each project, including the project title
SELECT p.Title AS ProjectTitle, COUNT(ep.EmployeeID) AS TotalEmployees
FROM Projects p
LEFT JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectID, p.Title;

-- Write a query to retrieve a summary of roles employees have across different projects, including the employee name, project title, and role
SELECT e.Name AS EmployeeName, p.Title AS ProjectTitle, ep.Role
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID;

-- Write a query to retrieve the total salary expenditure for each department, including the department label and manager name
SELECT d.Label AS DepartmentLabel, d.ManagerName, SUM(e.Salary) AS TotalSalaryExpenditure
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.Label, d.ManagerName;