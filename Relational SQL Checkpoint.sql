CREATE TABLE Wine (
NumW INT PRIMARY KEY,
Category VARCHAR(50),
Year INT,
Degree DECIMAL(10, 2),
NumP INT, 
FOREIGN KEY(NumP) REFERENCES Producer(NumP)
);

select * From Wine

CREATE TABLE Producer (
NumP INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Region VARCHAR(50)
);

CREATE TABLE Harvest (
NumW INT,
NumP INT,
Quantity INT,
PRIMARY KEY (NumW, NumP),
FOREIGN KEY (NumW) REFERENCES Wine(NumW),
FOREIGN KEY (NumP) REFERENCES Producer(NumP)
);


INSERT INTO Wine (NumW, Category, Year, Degree, NumP) VALUES
(1, 'Red', 2018, 13.5, 1),
(2, 'White', 2019, 11.8, 2),
(3, 'Rose', 2020, 12.2, 3),
(4, 'Sparkling', 2021, 10.5, 4),
(5, 'Red', 2022, 14.0, 5),
(6, 'White', 2017, 11.5, 6),
(7, 'Rose', 2015, 13.0, 7),
(8, 'Sparkling', 2016, 12.8, 8),
(9, 'Red', 2019, 10.0, 9),
(10, 'White', 2021, 13.2, 10),
(11, 'Rose', 2018, 11.9, 11),
(12, 'Sparkling', 2016, 14.5, 12);

SELECT * FROM Wine 


INSERT INTO Producer (NumP, FirstName, LastName, Region) VALUES
(1, 'Alice', 'Martin', 'Sousse'),
(2, 'Bob', 'Johnson', 'Tunis'),
(3, 'Charlie', 'Brown', 'Sfax'),
(4, 'David', 'Lee', 'Monastir'),
(5, 'Eve', 'Davis', 'Sousse'),
(6, 'Frank', 'Miller', 'Tunis'),
(7, 'Grace', 'Willson', 'Sfax'),
(8, 'Hank', 'Moore', 'Monastir'),
(9, 'Ivy', 'Taylor', 'Sousse'),
(10, 'Jack', 'Anderson', 'Tunis'),
(11, 'Kate', 'Thomas', 'Sfax'),
(12, 'Leo', 'White', 'Monastir');

SELECT * FROM Producer


INSERT INTO Harvest (NumW, NumP, Quantity) VALUES
(1, 1, 250),
(2, 2, 300),
(3, 3, 150),
(4, 4, 400),
(5, 5, 320),
(6, 6, 280),
(7, 7, 350),
(8, 8, 260),
(9, 9, 330),
(10, 10, 210),
(11, 11, 290),
(12, 12, 500);

SELECT * FROM Harvest

-- Retrieve all Producers
SELECT * FROM Producer

-- Retrieve a sorted list of producers by name 
SELECT FirstName, LastName FROM Producer

-- Retrieve producers from sousse
SELECT * FROM Producer
WHERE Region = 'Sousse'

-- Calculate the total quantity of wine produced for Wine Number 12
SELECT SUM(Quantity) AS Total_wine_quantity
FROM Harvest
WHERE Numw = 12

-- Calculate the total quantity of wine produced for each category
SELECT w.Category, SUM(h.Quantity) 
FROM Wine w 
JOIN Harvest h ON w.NumW = h.NumW 
GROUP BY w.Category

-- Find producers from Sousse who harvested at least one wine in quantities greater than 300 liters.
SELECT p.* FROM Producer p
JOIN Harvest h ON p.NumP = h.NumP
WHERE p.Region = 'Sousse' AND h.Quantity > 300;

-- List wine numbers with a degree greater than 12, produced by a specific producer
SELECT w.NumW, w.Degree, p.FirstName, p.LastName 
FROM Wine w
JOIN Harvest h ON w.NumW = h.NumW
JOIN Producer p ON h.NumP = p.NumP
WHERE w.Degree > 12 AND p.NumP = 1

-- Find the producer who has produced the highest quantity of wine
SELECT p.FirstName, p.LastName, SUM(h.Quantity) AS TotalQuantity 
FROM Producer p 
JOIN Harvest h ON p.NumP = h.NumP 
GROUP BY p.NumP 
ORDER BY TotalQuantity DESC 
LIMIT 1;

-- Calculate the average degree of wine produced
SELECT  AVG(Degree) AS average_degree_produced
FROM Wine;

-- Find the oldest wine in the database
SELECT * FROM Wine ORDER BY Year ASC LIMIT 1;

-- Retrieve a list of producers along with the total quantity of wine they have produced
SELECT p.FirstName, p.LastName, SUM(h.Quantity) AS TotalQuantity 
FROM Producer p 
JOIN Harvest h ON p.NumP = h.NumP 
GROUP BY p.NumP;

-- Retrieve a list of wines along with their producer details
SELECT W.*, p.FirstName, p.LastName, p.Region
FROM Wine w 
JOIN Harvest h ON w.numw = h.numw
JOIN Producer p ON h.NumP = p.NumP;