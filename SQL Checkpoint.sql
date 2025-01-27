CREATE TABLE Employee(
Num_E INT PRIMARY KEY,
employee_name VARCHAR(50) NOT NULL,
emloyee_position VARCHAR(50),
salary NUMERIC(10,2),
department_Num_S INT,
FOREIGN KEY (department_Num_S) REFERENCES department(Num_S)
);


CREATE TABLE Project(
Num_P INT PRIMARY KEY,
tittle VARCHAR(30),
start_date DATE,
end_date DATE,
department_Num_S INT,
FOREIGN KEY (department_Num_S) REFERENCES department(Num_S)
);


CREATE TABLE Department(
Num_S INT PRIMARY KEY,
label VARCHAR(50) NOT NULL,
manager_name VARCHAR(50) NOT NULL
);


CREATE TABLE Empoyee_Project(
Employee_Num_E INT,
Project_Num_P INT,
role VARCHAR(30) NOT NULL, 
PRIMARY KEY (Employee_Num_E, Project_Num_P),
FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E),
FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P)
);