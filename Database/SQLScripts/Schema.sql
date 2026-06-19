-- ============================================================================
-- Project: Mars Colonization Database Management System (E-Space Solutions)
-- Description: Database Schema Creation (DDL Scripts)
-- Target RDBMS: Microsoft SQL Server / Azure SQL Database
-- Author: K. Vishnuwaran
-- ============================================================================

-- Create Database
CREATE DATABASE Own_Espace;
GO

USE Own_Espace;
GO

-- 1. House Table
CREATE TABLE house (
    Colony_lot_number VARCHAR(10) PRIMARY KEY,
    Num_of_rooms INT NOT NULL CHECK (Num_of_rooms > 0),
    square_feet INT NOT NULL CHECK (square_feet > 0)
);

-- 2. E-Jet Table
CREATE TABLE E_jet (
    jet_unique_code VARCHAR(10) PRIMARY KEY,
    weight FLOAT NOT NULL CHECK (weight > 0),
    engine_type VARCHAR(50) NOT NULL,
    made_year INT NOT NULL CHECK (made_year >= 2000),
    Nuclear_en_power VARCHAR(50) NOT NULL,
    Num_of_seats INT NOT NULL CHECK (Num_of_seats > 0)
);

-- 3. Job Table
CREATE TABLE job (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL
);

-- 4. Astronomers (Pilot) Table
CREATE TABLE Astronomers (
    Astronomers_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    rank VARCHAR(20) NOT NULL,
    Qualification VARCHAR(50) NOT NULL,
    jet_unique_code VARCHAR(10) NOT NULL,
    CONSTRAINT FK_Astronomers_Ejet FOREIGN KEY (jet_unique_code) 
        REFERENCES E_jet(jet_unique_code) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 5. Trip Table
CREATE TABLE trip (
    trip_id VARCHAR(20) PRIMARY KEY,
    launch_date DATE NOT NULL,
    return_date DATE NOT NULL,
    jet_unique_code VARCHAR(10) NOT NULL,
    CONSTRAINT FK_Trip_Ejet FOREIGN KEY (jet_unique_code) 
        REFERENCES E_jet(jet_unique_code) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CHK_Dates CHECK (return_date > launch_date)
);

-- 6. Colonist Table
CREATE TABLE Colonist (
    mars_coloni_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20) NOT NULL,
    sure_name VARCHAR(20) NOT NULL,
    age INT NOT NULL CHECK (age >= 0),
    earth_address VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
    civil_status VARCHAR(20) NOT NULL,
    qualification VARCHAR(50) NOT NULL,
    Num_of_family INT NOT NULL DEFAULT 0 CHECK (Num_of_family >= 0),
    Trip_id VARCHAR(20) NULL,
    colony_lot_number VARCHAR(10) NULL,
    CONSTRAINT FK_Colonist_Trip FOREIGN KEY (Trip_id) 
        REFERENCES trip(trip_id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_Colonist_House FOREIGN KEY (colony_lot_number) 
        REFERENCES house(Colony_lot_number) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 7. Dependents Table
CREATE TABLE dependents (
    dependent_id INT IDENTITY(1,1) PRIMARY KEY,
    Mars_coloni_id VARCHAR(10) NOT NULL,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
    relationship VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    age INT NOT NULL CHECK (age >= 0),
    CONSTRAINT FK_Dependents_Colonist FOREIGN KEY (Mars_coloni_id) 
        REFERENCES Colonist(mars_coloni_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Colonist_job Junction Table (Associative Entity)
CREATE TABLE Colonist_job (
    Mars_coloni_id VARCHAR(10) NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    rank VARCHAR(20) NOT NULL,
    Qualification VARCHAR(50) NOT NULL,
    jet_unique_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (Mars_coloni_id, job_id),
    CONSTRAINT FK_ColonistJob_Colonist FOREIGN KEY (Mars_coloni_id) 
        REFERENCES Colonist(mars_coloni_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_ColonistJob_Job FOREIGN KEY (job_id) 
        REFERENCES job(job_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_ColonistJob_Ejet FOREIGN KEY (jet_unique_code) 
        REFERENCES E_jet(jet_unique_code)
);
GO
