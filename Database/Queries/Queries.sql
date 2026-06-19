-- ============================================================================
-- Project: Mars Colonization Database Management System (E-Space Solutions)
-- Description: SQL Query Showcase (SELECT, WHERE, GROUP BY, HAVING, Between, In, JOINS)
-- Target RDBMS: Microsoft SQL Server / Azure SQL Database
-- Author: K. Vishnuwaran
-- ============================================================================

USE Own_Espace;
GO

-- ============================================================================
-- 1. SELECT & WHERE (Filter and retrieve specific data)
-- ============================================================================
-- Retrieve all colonists who are female and single
SELECT mars_coloni_id, first_name, sure_name, age, civil_status, gender
FROM Colonist
WHERE gender = 'Female' AND civil_status = 'Single';

-- Retrieve all E-Jets that have a capacity of 10 or more seats
SELECT jet_unique_code, Num_of_seats, engine_type, weight
FROM E_jet
WHERE Num_of_seats >= 10;


-- ============================================================================
-- 2. BETWEEN & IN Operators (Check ranges and sets of values)
-- ============================================================================
-- Retrieve colonists whose age is between 25 and 35
SELECT mars_coloni_id, first_name, sure_name, age, qualification
FROM Colonist
WHERE age BETWEEN 25 AND 35;

-- Retrieve trips associated with specific jets ('JET01', 'JET02')
SELECT trip_id, launch_date, return_date, jet_unique_code
FROM trip
WHERE jet_unique_code IN ('JET01', 'JET02');


-- ============================================================================
-- 3. ORDER BY & GROUP BY (Sort and summarize data)
-- ============================================================================
-- List all colonists sorted by age in descending order
SELECT mars_coloni_id, first_name, sure_name, age, gender, civil_status
FROM Colonist
ORDER BY age DESC;

-- Count the number of houses grouped by their room count
SELECT Num_of_rooms, COUNT(*) AS Total_Houses, SUM(square_feet) AS Total_Square_Feet
FROM house
GROUP BY Num_of_rooms;


-- ============================================================================
-- 4. HAVING Clause (Filter groups after aggregation)
-- ============================================================================
-- List trip destinations/jet allocations that have more than 1 colonist assigned
SELECT Trip_id, COUNT(*) AS Total_Colonists
FROM Colonist
WHERE Trip_id IS NOT NULL
GROUP BY Trip_id
HAVING COUNT(*) > 1;


-- ============================================================================
-- 5. JOINS (Querying across multiple tables)
-- ============================================================================
-- Join Colonist, House, and Trip to show colonist destinations and allocations
SELECT 
    C.mars_coloni_id,
    CONCAT(C.first_name, ' ', C.middle_name, ' ', C.sure_name) AS Full_Name,
    C.age,
    H.Colony_lot_number,
    H.square_feet,
    T.trip_id,
    T.launch_date,
    T.jet_unique_code
FROM Colonist C
INNER JOIN house H ON C.colony_lot_number = H.Colony_lot_number
LEFT JOIN trip T ON C.Trip_id = T.trip_id;

-- Join Colonist, Colonist_job, and job to retrieve jobs assigned to each colonist
SELECT 
    C.mars_coloni_id,
    CONCAT(C.first_name, ' ', C.sure_name) AS Colonist_Name,
    J.job_title,
    CJ.rank AS Job_Rank,
    CJ.Qualification AS Job_Qualification,
    CJ.jet_unique_code AS Assigned_Jet
FROM Colonist C
INNER JOIN Colonist_job CJ ON C.mars_coloni_id = CJ.Mars_coloni_id
INNER JOIN job J ON CJ.job_id = J.job_id;

-- Retrieve all dependents and their parent colonist details
SELECT 
    D.dependent_id,
    D.name AS Dependent_Name,
    D.relationship,
    D.age AS Dependent_Age,
    CONCAT(C.first_name, ' ', C.sure_name) AS Parent_Colonist,
    C.colony_lot_number AS Family_House
FROM dependents D
INNER JOIN Colonist C ON D.Mars_coloni_id = C.mars_coloni_id;
GO
