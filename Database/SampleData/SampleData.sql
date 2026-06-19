-- ============================================================================
-- Project: Mars Colonization Database Management System (E-Space Solutions)
-- Description: Sample Data Insert Scripts (DML Scripts)
-- Target RDBMS: Microsoft SQL Server / Azure SQL Database
-- Author: K. Vishnuwaran
-- ============================================================================

USE Own_Espace;
GO

-- 1. Insert House Data
INSERT INTO house (Colony_lot_number, Num_of_rooms, square_feet) VALUES 
('HL01', 3, 1200),
('HL02', 4, 1600),
('HL03', 2, 850),
('HL04', 5, 2200),
('HL05', 3, 1100);

-- 2. Insert E-Jet Data
INSERT INTO E_jet (jet_unique_code, weight, engine_type, made_year, Nuclear_en_power, Num_of_seats) VALUES 
('JET01', 12500.50, 'Type A (Nuclear Engine Only)', 2024, '500 MW Nuclear Fission', 12),
('JET02', 15800.75, 'Type B (Nuclear + Hydro Splitter)', 2025, '750 MW Fusion-Hybrid', 18),
('JET03', 11200.00, 'Type A (Nuclear Engine Only)', 2023, '400 MW Nuclear Fission', 8),
('JET04', 19500.00, 'Type B (Nuclear + Hydro Splitter)', 2026, '900 MW Fusion-Hybrid', 24);

-- 3. Insert Job Data
INSERT INTO job (job_id, job_title) VALUES 
('JOB01', 'Atmospheric Engineer'),
('JOB02', 'Hydroponic Biologist'),
('JOB03', 'Medical Officer'),
('JOB04', 'Systems Technician'),
('JOB05', 'Colony Administrator'),
('JOB06', 'Resource Geologist');

-- 4. Insert Astronomers (Pilot) Data
INSERT INTO Astronomers (Astronomers_id, name, rank, Qualification, jet_unique_code) VALUES 
('AST01', 'John Doe', 'Commander', 'M.Sc. Aerospace Engineering', 'JET01'),
('AST02', 'Sarah Smith', 'Lt. Commander', 'Ph.D. Astrophysics', 'JET02'),
('AST03', 'Alex Carter', 'Lieutenant', 'B.Sc. Flight Operations', 'JET03');

-- 5. Insert Trip Data
INSERT INTO trip (trip_id, launch_date, return_date, jet_unique_code) VALUES 
('TRIP01', '2026-08-15', '2027-02-20', 'JET01'),
('TRIP02', '2026-11-10', '2027-05-15', 'JET02'),
('TRIP03', '2027-03-01', '2027-09-05', 'JET03'),
('TRIP04', '2027-06-20', '2027-12-25', 'JET04');

-- 6. Insert Colonist Data
INSERT INTO Colonist (mars_coloni_id, first_name, middle_name, sure_name, age, earth_address, contact_number, date_of_birth, gender, civil_status, qualification, Num_of_family, Trip_id, colony_lot_number) VALUES 
('COL01', 'Vishnu', 'Kumar', 'Waran', 28, 'Jaffna', '0771234567', '1998-03-26', 'Male', 'Single', 'B.Sc. Eng', 0, 'TRIP01', 'HL01'),
('COL02', 'Elena', 'Marie', 'Rostova', 34, 'London', '0777654321', '1992-07-14', 'Female', 'Married', 'Ph.D. Bio', 2, 'TRIP01', 'HL02'),
('COL03', 'David', 'James', 'Miller', 42, 'New York', '0719876543', '1984-11-05', 'Male', 'Married', 'M.D. Medicine', 3, 'TRIP02', 'HL04'),
('COL04', 'Yuki', 'Ken', 'Tanaka', 31, 'Tokyo', '0761122334', '1995-05-19', 'Male', 'Single', 'M.Sc. IT', 0, 'TRIP03', 'HL03'),
('COL05', 'Sofia', 'Grace', 'Silva', 29, 'Colombo', '0724455667', '1997-09-12', 'Female', 'Single', 'B.Sc. Geol', 0, 'TRIP02', 'HL05');

-- 7. Insert Dependents Data
INSERT INTO dependents (Mars_coloni_id, name, gender, relationship, date_of_birth, age) VALUES 
('COL02', 'Arthur Rostov', 'Male', 'Spouse', '1990-05-10', 36),
('COL02', 'Lily Rostova', 'Female', 'Child', '2020-04-12', 6),
('COL03', 'Emma Miller', 'Female', 'Spouse', '1986-12-25', 39),
('COL03', 'Jack Miller', 'Male', 'Child', '2015-08-30', 10),
('COL03', 'Grace Miller', 'Female', 'Child', '2018-02-14', 8);

-- 8. Insert Colonist_job Junction Data
INSERT INTO Colonist_job (Mars_coloni_id, job_id, rank, Qualification, jet_unique_code) VALUES 
('COL01', 'JOB01', 'Junior Engineer', 'B.Sc. Mechanical Eng', 'JET01'),
('COL02', 'JOB02', 'Senior Scientist', 'Ph.D. Astrobiology', 'JET01'),
('COL03', 'JOB03', 'Chief Medical Officer', 'M.D. Trauma Surgery', 'JET02'),
('COL04', 'JOB04', 'Systems Admin', 'M.Sc. Computer Science', 'JET03'),
('COL05', 'JOB06', 'Lead Geologist', 'B.Sc. Geology & Mining', 'JET02');
GO
