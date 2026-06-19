CREATE DATABASE HospitalManagementDB;
USE HospitalManagementDB;
-------------create---------------
CREATE TABLE Departments(
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);
---2 create table docters---
create table docters(
DocterId int primary key identity (10,1),
DoctorName varchar(100),
Specialization varchar(50),
Phone varchar(50),
DepartmentID int constraint dp references Departments( DepartmentID )
);

---3 create table patients---
create table patients(
PatientID int primary key identity(101,1), 
PatientName varchar(100),
Gender varchar(100),
DOB date,
Address varchar(200),
Phone varchar(100),
);

----4 create table Appointments---
create table Appointments(
AppointmentID int primary key identity(200,1),
PatientID int constraint fk references patients (PatientID),
DoctorID int constraint did references docters(DocterId),
Appointment date,
status varchar(20),
);

--- 5  create table Treatments---
create table Treatments(
TreatmentID int primary key identity(300,1),
PatientID int constraint fk1 references patients (PatientID),
DoctorID int constraint gh references docters(DocterId),
Diagnosis varchar(200),
TreatmentDate date,
Prescription varchar(200),
);

-----6 create table Billing----
create table Billing (
BillID  int primary key identity(400,1),
PatientID int constraint er references   patients (PatientID),
Amount	 decimal,
BillDate date,
PaymentStatus varchar(20),
);

--------------------------------------Insert-------------------------------------------------------------------------
--------------------------------1)insert into deparment---------------------------------------------------------------
INSERT INTO Departments (DepartmentName, Location)
VALUES
('Cardiology', 'First Floor'),
('Neurology', 'Second Floor'),
('Orthopedics', 'Third Floor'),
('Pediatrics', 'Ground Floor'),
('Dermatology', 'First Floor'),
('Oncology', 'Second Floor'),
('Gynecology', 'Third Floor'),
('ENT', 'First Floor'),
('Radiology', 'Basement'),
('Emergency', 'Ground Floor');

SELECT * FROM departments
-----------------------------------2)insert into table doctor---------------------------------------------------------
INSERT INTO docters(DoctorName, Specialization, Phone, DepartmentID)VALUES
('Dr. Amit Sharma', 'Cardiologist', '9876543210', 1),
('Dr. Neha Patil', 'Neurologist', '9876543211', 2),
('Dr. Rahul Joshi', 'Orthopedic', '9876543212', 3),
('Dr. Priya Deshmukh', 'Pediatrician', '9876543213', 4),
('Dr. Kunal Mehta', 'Cardiologist', '9876543214', 1),
('Dr. Sneha Kulkarni', 'Neurologist', '9876543215', 2),
('Dr. Rohan Verma', 'Orthopedic', '9876543216', 3),
('Dr. Anjali Singh', 'Pediatrician', '9876543217', 4),
('Dr. Vikram Gupta', 'Cardiologist', '9876543218', 1),
('Dr. Pooja Shah', 'Neurologist', '9876543219', 2);

SELECT * FROM docters;
------------------------------------3)insert into table patients------------------------------------------------------
INSERT INTO Patients(PatientName, Gender, DOB, Address, Phone)VALUES
('Rahul Sharma', 'Male', '1995-04-15', 'Pune', '9876543210'),
('Priya Patil', 'Female', '1998-08-22', 'Mumbai', '9876543211'),
('Amit Joshi', 'Male', '1992-12-10', 'Nagpur', '9876543212'),
('Sneha Deshmukh', 'Female', '2000-03-05', 'Nashik', '9876543213'),
('Rohan Kulkarni', 'Male', '1997-07-18', 'Aurangabad', '9876543214'),
('Pooja Jadhav', 'Female', '1999-11-25', 'Kolhapur', '9876543215'),
('Kiran Pawar', 'Male', '2001-01-30', 'Solapur', '9876543216'),
('Neha More', 'Female', '1996-06-12', 'Satara', '9876543217'),
('Sagar Shinde', 'Male', '1994-09-08', 'Amravati', '9876543218'),
('Vaishnavi Hinge', 'Female', '2003-10-20', 'Pune', '9881681552');

SELECT * FROM patients;
------------------------------------4) insert into table appointments-------------------------------------------------
INSERT INTO Appointments(PatientID, DoctorID,Appointment, Status)
VALUES
(101,10,'2026-06-15 10:00:00','Booked'),
(102,12,'2026-06-15 11:00:00','Completed'),
(103,13,'2026-06-16 09:00:00','Booked'),
(104,14,'2026-06-16 12:00:00','Completed'),
(105,15,'2026-06-17 10:30:00','Booked'),
(106,16,'2026-06-17 11:30:00','Cancelled'),
(107,17,'2026-06-18 09:30:00','Booked'),
(108,18,'2026-06-18 01:00:00','Completed'),
(109,19,'2026-06-19 02:00:00','Booked'),
(110,11,'2026-06-20 10:00:00','Completed');

SELECT * FROM Appointments;
--------------------------------------5)insert into table treatments--------------------------------------------------
INSERT INTO Treatments
(PatientID, DoctorID, Diagnosis, TreatmentDate, Prescription) VALUES
(101, 10, 'Heart Disease', '2026-06-01', 'Aspirin 75mg Daily'),
(102, 12, 'Migraine', '2026-06-02', 'Paracetamol 500mg'),
(103, 13, 'Fractured Arm', '2026-06-03', 'Calcium Tablets'),
(101, 11, 'High Blood Pressure', '2026-06-04', 'Amlodipine 5mg'),
(102, 12, 'Brain Infection', '2026-06-05', 'Antibiotics'),
(103, 13, 'Knee Pain', '2026-06-06', 'Pain Relief Gel'),
(101, 11, 'Chest Pain', '2026-06-07', 'ECG and Medication'),
(102, 12, 'Stress Disorder', '2026-06-08', 'Counseling and Medicines'),
(103, 13, 'Back Pain', '2026-06-09', 'Physiotherapy'),
(101, 11, 'Heart Checkup', '2026-06-10', 'Routine Monitoring');

SELECT * FROM Treatments;
-------------------------------------------6)insert into table billing------------------------------------------------
INSERT INTO Billing (PatientID, Amount, BillDate, PaymentStatus)
VALUES
(101, 5000.00, '2026-06-01', 'Paid'),
(102, 3500.00, '2026-06-02', 'Pending'),
(103, 4200.00, '2026-06-03', 'Paid'),
(104, 2800.00, '2026-06-04', 'Paid'),
(105, 6500.00, '2026-06-05', 'Pending'),
(106, 3100.00, '2026-06-06', 'Paid'),
(107, 7500.00, '2026-06-07', 'Paid'),
(108, 4800.00, '2026-06-08', 'Pending'),
(109, 5500.00, '2026-06-09', 'Paid'),
(110, 3900.00, '2026-06-10', 'Paid');

SELECT * FROM Billing;
----------------------------------------------------------------------------------------------------------------------
------------------------------------------3). DDL QUERIES------------------------------------------------------------
---------------------------ALTER TABLE
ALTER TABLE Patients
ADD Email VARCHAR(100);
---------------------------DROP TABLE
DROP TABLE TestTable;
----------------------------------------------------------------------------------------------------------------------
--------------------------------------------2). DML QUERIES-----------------------------------------------------------
--------------(INSERT)----------------------
INSERT INTO Patients
(PatientName,Gender,DOB,Address,Phone) VALUES('Vaishnavi Hinge','Female','2003-10-20',
'Pune','9881681552');

-------------(UPDATE)-------------------------
UPDATE Patients SET Phone='9999999999' WHERE PatientID=1;

--------------(DELETE)------------------------
DELETE FROM Patients WHERE PatientID=10;
----------------------------------------------------------------------------------------------------------------------
--------------------------------------3). DQL QUERIES-----------------------------------------------------------------
----------(SELECT)-------------------
SELECT * FROM Patients;

-----------(WHERE)------------------
SELECT * FROM Patients WHERE Gender='Female';

-----------(ORDER BY)----------------
SELECT * FROM Patients ORDER BY PatientName ASC; 

-----------(GROUP BY)--------------
SELECT Gender, COUNT(*) AS TotalPatients FROM Patients GROUP BY Gender;

------------(HAVING)---------------
SELECT Gender, COUNT(*) AS TotalPatients FROM Patients GROUP BY Gender HAVING COUNT(*)> 2;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------4). JOINS--------------------------------------------------------------------
-------------(INNER JOIN)--------------
SELECT P.PatientName, D.DoctorName, A.Appointment FROM Patients P
INNER JOIN Appointments A ON P.PatientID=A.PatientID INNER JOIN Docters D ON D.DocterId=A.DoctorID;

----------(LEFT JOIN)------------------
SELECT P.PatientName, A.Appointment FROM Patients P LEFT JOIN Appointments A ON P.PatientID=A.PatientID;

-----------(RIGHT JOIN)------------------
SELECT D.DocterId, A.Appointment FROM Appointments A RIGHT JOIN Docters D ON D.DocterId=A.DoctorID;

----------------------------------------------------------------------------------------------------------------------
-----------------------------------5). AGGREGATE FUNCTIONS-----------------------------------------------------------
--------------------SUM()
SELECT SUM(Amount) AS TotalRevenue FROM Billing;

---------------------AVG()
SELECT AVG(Amount) AS AverageBill FROM Billing;

----------------------MAX()
SELECT MAX(Amount) AS HighestBill FROM Billing;

------------------------MIN()
SELECT MIN(Amount) AS LowestBill FROM Billing;

------------------------COUNT()
SELECT COUNT(*) AS TotalPatients FROM Patients;

----------------------------------------------------------------------------------------------------------------------
-------------------------------------------6). WINDOW FUNCTIONS--------------------------------------------------------
--------------------ROW_NUMBER()
SELECT PatientName, ROW_NUMBER() OVER(ORDER BY PatientName) AS RowNo FROM Patients;
-----------------------------RANK()
SELECT DoctorID,
COUNT(*) AS TotalAppointments,RANK() OVER(ORDER BY COUNT(*) DESC) AS DoctorRank FROM Appointments GROUP BY DoctorID;

---------------------------DENSE_RANK()
SELECT DoctorID,COUNT(*) AS TotalAppointments,
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS DoctorRank FROM Appointments GROUP BY DoctorID;
----------------------------------------------------------------------------------------------------------------------
-------------------------------------7). STORED PROCEDURE 1-----------------------------------------------------------
---------------------(Add New Patient)
CREATE PROCEDURE AddNewPatient
@PatientName VARCHAR(100),
@Gender VARCHAR(10),
@DOB DATE,
@Address VARCHAR(200),
@Phone VARCHAR(15)
AS
BEGIN
INSERT INTO Patients( PatientName,Gender,DOB,Address,Phone)
VALUES
(
@PatientName,
@Gender,
@DOB,
@Address,
@Phone)
END

EXEC AddNewPatient'Vaishnavi Hinge','Female','2003-10-20','Pune','9881681552';
----------------------------------------------------------------------------------------------------------------------
----------------------------------------8). STORED PROCEDURE 2--------------------------------------------------------
----------------------(Book Appointment)
CREATE PROCEDURE BookAppointment
@PatientID INT,
@DoctorID INT,
@AppointmentDate DATETIME,
@Status VARCHAR(20)
AS
BEGIN
INSERT INTO Appointments
(PatientID,DoctorID,Appointment,Status)
VALUES
(
@PatientID,
@DoctorID,
@AppointmentDate,
@Status
)
END

EXEC BookAppointment 101,12,'2026-06-20 10:00','Booked';
select * from Appointments
----------------------------------------------------------------------------------------------------------------------
---------------------------------------9). STORED PROCEDURE 3--------------------------------------------------------
-----------------------------Generate Bill
CREATE PROCEDURE GenerateBill
@PatientID INT,
@Amount DECIMAL(10,2)
AS
BEGIN
INSERT INTO Billing(PatientID,Amount,BillDate,PaymentStatus)
VALUES
(
@PatientID,
@Amount,
GETDATE(),
'Pending'
)
END

EXEC GenerateBill 101,5000;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------10). FUNCTION 1--------------------------------------------------------------
---------------------Calculate Patient Age
CREATE FUNCTION CalculateAge
(
@DOB DATE
)
RETURNS INT
AS
BEGIN
RETURN DATEDIFF(YEAR,@DOB,GETDATE())
END

SELECT dbo.CalculateAge('2003-10-20') AS Age;
----------------------------------------------------------------------------------------------------------------------
--------------------------------------11). FUNCTION 2----------------------------------------------------------------
-----------------------Calculate Total Bill Amount
CREATE FUNCTION TotalBillAmount
(
@PatientID INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @Total DECIMAL(10,2)
SELECT
@Total=SUM(Amount)
FROM Billing
WHERE PatientID=@PatientID
RETURN @Total
END

SELECT dbo.TotalBillAmount(1) AS TotalAmount;
---------------------------------------------------------------------------------------------------------------------
-----------------------------------------12). TRIGGER 1--------------------------------------------------------------
-----------------------Prevent Duplicate Appointment
CREATE TRIGGER PreventDuplicateAppointment
ON Appointments
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM Appointments A
        JOIN inserted I
            ON A.PatientID = I.PatientID
           AND A.DoctorID = I.DoctorID
           AND A.Appointment = I.Appointment
    )
    BEGIN
        RAISERROR ('Duplicate Appointment Not Allowed', 16, 1);
        RETURN;
    END

    INSERT INTO Appointments
    (
        PatientID,
        DoctorID,
        Appointment,
        Status
    )
    SELECT
        PatientID,
        DoctorID,
        Appointment,
        Status
    FROM inserted;
END;
----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------13). TRIGGER 2------------------------------------------------------------------
----------------------Audit Patient Updates
------------------Create Audit Table
CREATE TABLE PatientAudit
(
AuditID INT PRIMARY KEY IDENTITY,
PatientID INT,
OldPhone VARCHAR(15),
NewPhone VARCHAR(15),
UpdateDate DATETIME
);

CREATE TRIGGER AuditPatientUpdates
ON Patients
AFTER UPDATE
AS
BEGIN
INSERT INTO PatientAudit
(
PatientID,
OldPhone,
NewPhone,
UpdateDate
)
SELECT
D.PatientID,
D.Phone,
I.Phone,
GETDATE()
FROM deleted D
JOIN inserted I
ON D.PatientID=I.PatientID
END
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------14). VIEW 1-------------------------------------------------------------
----------------------Doctor Appointment View
CREATE VIEW DoctoresAppointmentView
AS
SELECT
D.DoctorName,
P.PatientName,
A.AppointmentDate,
A.Status
FROM Appointments A
JOIN Doctors D
ON D.DoctorID=A.DoctorID
JOIN Patients P
ON P.PatientID=A.PatientID;

SELECT * FROM DoctorAppointmentView;
----------------------------------------------------------------------------------------------------------------------
-------------------------------------------------15). VIEW 2----------------------------------------------------------
------------------------------Patient Billing View
CREATE VIEW PatientBillingView
AS
SELECT
P.PatientName,
B.Amount,
B.BillDate,
B.PaymentStatus
FROM Patients P
JOIN Billing B
ON P.PatientID=B.PatientID;

SELECT * FROM PatientBillingView;
----------------------------------------------------------------------------------------------------------------------
---------------------------------------------16). REPORT 1------------------------------------------------------------
--------------------Total Patients Department Wise
SELECT
Dep.DepartmentName,
COUNT(DISTINCT A.PatientID)
AS TotalPatients
FROM Departments Dep
LEFT JOIN Doctors Doc
ON Dep.DepartmentID=Doc.DepartmentID
LEFT JOIN Appointments A
ON Doc.DoctorID=A.DoctorID
GROUP BY Dep.DepartmentName;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------17). REPORT 2-----------------------------------------------------------
------------------Doctor Wise Appointment Count
SELECT
D.DoctorName,
COUNT(A.AppointmentID)
AS AppointmentCount
FROM Doctors D
LEFT JOIN Appointments A
ON D.DoctorID=A.DoctorID
GROUP BY D.DoctorName;
-----------------------------------------------------------------------------------------------------------------------
-------------------------------------------------18). REPORT 3---------------------------------------------------------
Monthly Revenue Report
SELECT
MONTH(BillDate) AS MonthNo,
SUM(Amount) AS Revenue
FROM Billing
GROUP BY MONTH(BillDate);
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------19). REPORT 4-----------------------------------------------------
-------------------------Top 5 Doctors by Appointments
SELECT TOP 5
D.DoctorName,
COUNT(A.AppointmentID)
AS TotalAppointments
FROM Doctors D
JOIN Appointments A
ON D.DoctorID=A.DoctorID
GROUP BY D.DoctorName
ORDER BY COUNT(A.AppointmentID) DESC;
----------------------------------------------------------------------------------------------------------------------
--------------------------------------------------20). REPORT 5-------------------------------------------------------
Pending Payments Report
SELECT *
FROM Billing
WHERE PaymentStatus='Pending';
----------------------------------------------------------------------------------------------------------------------
-------------------------------------------------21). REPORT 6-------------------------------------------------------
----Daily Appointment Report
SELECT
P.PatientName,
D.DoctorName,
A.Appointment,
A.Status
FROM Appointments A
JOIN Patients P
ON P.PatientID=A.PatientID
JOIN Docters D
ON D.DocterId=A.DoctorID
WHERE CAST(A.Appointment AS DATE)
= CAST(GETDATE() AS DATE);
----------------------------------------------------------------------------------------------------------------------
-------------------------------------------------22). SUBQUERY--------------------------------------------------------
SELECT *
FROM Billing
WHERE Amount >
(
SELECT AVG(Amount)
FROM Billing
);
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------23). CTE----------------------------------------------------------
WITH RevenueCTE AS
(
SELECT
PatientID,
SUM(Amount) AS TotalRevenue
FROM Billing
GROUP BY PatientID
)
SELECT *
FROM RevenueCTE;
----------------------------------------------------------------------------------------------------------------------
--------------------------------------------------24). INDEX----------------------------------------------------------
CREATE INDEX IDX_PatientName
ON Patients(PatientName);
----------------------------------------------------------------------------------------------------------------------
