CREATE DATABASE Hospital;
USE hospital;

CREATE TABLE Patients(
Patient_Id int auto_increment PRIMARY KEY ,
FirstName varchar(100),
Lastname varchar(100),
DOB varchar(100),
Gender varchar(6),
Address varchar(100),
Phone varchar(15),
Email varchar(40),
emergency_contact varchar(20)
);

SELECT * FROM Patients;

CREATE TABLE Doctors(
Doctor_Id int auto_increment PRIMARY KEY,
FirstName varchar(30),
Lastname varchar(30),
Specialization varchar(20),
Phone varchar(20),
Email varchar(40)
);

SELECT * FROM Doctors;


CREATE TABLE APPOINTMENTS(
Appointment_Id int  auto_increment PRIMARY KEY ,
Patient_Id int,
Doctor_Id int, 
Appointment_Date datetime,
Status varchar(50),
CONSTRAINT fk_AppPat foreign key (Patient_Id) REFERENCES Patients(Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_AppDoc foreign key (Doctor_Id) REFERENCES Doctors(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Appointments;

CREATE TABLE MedicalRecords(
Record_Id int auto_increment PRIMARY KEY,
Patient_Id int,
Doctor_Id int,
visit_date date,
Diagnosis varchar(50),
Treatment varchar(100),
Prescription varchar(255),
Notes text,
CONSTRAINT fk_MedPat foreign key (Patient_Id) REFERENCES Patients(Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_MedDoc foreign key (Doctor_Id) REFERENCES Doctors(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM MedicalRecords;

CREATE TABLE Staff(
Staff_Id int auto_increment PRIMARY KEY,
FirstName varchar(20),
LastName varchar(20),
Position varchar(20),
Department varchar(30),
Phone varchar(20),
Email varchar(30)
);

SELECT * FROM Staff;

CREATE TABLE Department(
Dept_Id int auto_increment PRIMARY KEY,
DeptName varchar(40),
Location varchar(30)
);

 SELECT * FROM Department;
 
 CREATE TABLE Billing(
 Bill_Id int auto_increment PRIMARY KEY,
 Patient_Id int,
 Amount int,
 Billing_Date date,
 status varchar(100),
 CONSTRAINT fk_BilPat foreign key (Patient_Id) REFERENCES Patients(Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE
 );
 
 SELECT * FROM Billing;
 
 CREATE TABLE Rooms(
 Room_id int auto_increment PRIMARY KEY,
 Room_number int,
 Room_type varchar(20),
 Status varchar(20)
 );
 
 SELECT * FROM Rooms;
 
 CREATE TABLE Admissions(
 Adm_Id int auto_increment PRIMARY KEY,
 Patient_Id int,
 Room_id int,
 Adm_date date,
 Discharge_date date,
 CONSTRAINT fk_AdmPat foreign key (Patient_Id) REFERENCES Patients(Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT fk_AdmRoom foreign key (Patient_Id) REFERENCES Rooms(Room_id) ON DELETE CASCADE ON UPDATE CASCADE
 );
 
 SELECT * FROM Admissions;
 
 CREATE TABLE Inventory(
 Item_Id int auto_increment PRIMARY KEY,
 ItemName varchar(50),
 Quantity int,
 Supplier varchar(100),
 Received_date date
 );
 
 SELECT * FROM Inventory;
 
 /*INSERTING VALUES INTO TABLES*/
 
INSERT INTO Patients (patient_id, FirstName, Lastname, dob, gender, address, phone, email, emergency_contact) VALUES
(1, 'John', 'Doe', '1985-07-12', 'M', '123 Main St', '555-1234', 'john.doe@example.com', 'Jane Doe'),
(2, 'Alice', 'Smith', '1990-02-25', 'F', '456 Elm St', '555-5678', 'alice.smith@example.com', 'Bob Smith'),
(3, 'Michael', 'Johnson', '1978-11-02', 'M', '789 Oak St', '555-9101', 'michael.johnson@example.com', 'Sarah Johnson'),
(4, 'Mary', 'Clark', '1982-03-15', 'F', '101 Maple St', '555-2222', 'mary.clark@example.com', 'John Clark'),
(5, 'James', 'White', '1995-08-20', 'M', '202 Pine St', '555-3333', 'james.white@example.com', 'Laura White'),
(6, 'Linda', 'Lewis', '1987-09-25', 'F', '303 Birch St', '555-4444', 'linda.lewis@example.com', 'Tom Lewis'),
(7, 'David', 'Walker', '1965-04-10', 'M', '404 Cedar St', '555-5555', 'david.walker@example.com', 'Emily Walker'),
(8, 'Barbara', 'Hall', '1971-05-17', 'F', '505 Walnut St', '555-6666', 'barbara.hall@example.com', 'Frank Hall'),
(9, 'William', 'Young', '1988-12-05', 'M', '606 Spruce St', '555-7777', 'william.young@example.com', 'Nancy Young'),
(10, 'Elizabeth', 'King', '1992-11-11', 'F', '707 Ash St', '555-8888', 'elizabeth.king@example.com', 'Andrew King'),
(11, 'Richard', 'Scott', '1983-07-21', 'M', '808 Hickory St', '555-9999', 'richard.scott@example.com', 'Karen Scott'),
(12, 'Susan', 'Green', '1994-03-19', 'F', '909 Willow St', '555-1010', 'susan.green@example.com', 'Steve Green'),
(13, 'Charles', 'Adams', '1976-08-22', 'M', '1010 Maple Ave', '555-1111', 'charles.adams@example.com', 'Alice Adams'),
(14, 'Jessica', 'Baker', '1989-09-18', 'F', '1111 Elm Ave', '555-1212', 'jessica.baker@example.com', 'Mark Baker'),
(15, 'Christopher', 'Nelson', '1974-02-07', 'M', '1212 Oak Ave', '555-1313', 'christopher.nelson@example.com', 'Diane Nelson'),
(16, 'Patricia', 'Carter', '1991-04-25', 'F', '1313 Pine Ave', '555-1414', 'patricia.carter@example.com', 'Samuel Carter'),
(17, 'Thomas', 'Mitchell', '1967-06-30', 'M', '1414 Birch Ave', '555-1515', 'thomas.mitchell@example.com', 'Jessica Mitchell'),
(18, 'Karen', 'Perez', '1984-12-09', 'F', '1515 Cedar Ave', '555-1616', 'karen.perez@example.com', 'Michael Perez'),
(19, 'Matthew', 'Roberts', '1973-11-03', 'M', '1616 Walnut Ave', '555-1717', 'matthew.roberts@example.com', 'Linda Roberts'),
(20, 'Sarah', 'Phillips', '1986-01-14', 'F', '1717 Spruce Ave', '555-1818', 'sarah.phillips@example.com', 'Charles Phillips');

SELECT * FROM Patients;

INSERT INTO Doctors (doctor_id, firstname, lastname, specialization, phone, email) VALUES
(1, 'Emily', 'Davis', 'Cardiology', '555-2222', 'emily.davis@example.com'),
(2, 'Robert', 'Brown', 'Neurology', '555-3333', 'robert.brown@example.com'),
(3, 'Jessica', 'Wilson', 'Pediatrics', '555-4444', 'jessica.wilson@example.com'),
(4, 'Michael', 'Lee', 'Orthopedics', '555-5555', 'michael.lee@example.com'),
(5, 'Sarah', 'Harris', 'Dermatology', '555-6666', 'sarah.harris@example.com'),
(6, 'William', 'Martinez', 'Oncology', '555-7777', 'william.martinez@example.com'),
(7, 'Linda', 'Clark', 'Gynecology', '555-8888', 'linda.clark@example.com'),
(8, 'Richard', 'Lewis', 'General Surgery', '555-9999', 'richard.lewis@example.com'),
(9, 'Karen', 'Robinson', 'ENT', '555-1010', 'karen.robinson@example.com'),
(10, 'James', 'Walker', 'Psychiatry', '555-1111', 'james.walker@example.com'),
(11, 'Patricia', 'Young', 'Gastroenterology', '555-1212', 'patricia.young@example.com'),
(12, 'Charles', 'Hall', 'Ophthalmology', '555-1313', 'charles.hall@example.com'),
(13, 'Barbara', 'Allen', 'Rheumatology', '555-1414', 'barbara.allen@example.com'),
(14, 'Christopher', 'Wright', 'Endocrinology', '555-1515', 'christopher.wright@example.com'),
(15, 'Susan', 'King', 'Urology', '555-1616', 'susan.king@example.com'),
(16, 'David', 'Scott', 'Nephrology', '555-1717', 'david.scott@example.com'),
(17, 'Mary', 'Green', 'Pulmonology', '555-1818', 'mary.green@example.com'),
(18, 'Michael', 'Adams', 'Anesthesiology', '555-1919', 'michael.adams@example.com'),
(19, 'Elizabeth', 'Baker', 'Pediatrics', '555-2020', 'elizabeth.baker@example.com'),
(20, 'Thomas', 'Nelson', 'Cardiology', '555-2121', 'thomas.nelson@example.com');

SELECT * FROM Doctors;

 INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, 1, '2024-05-01 09:00:00', 'Scheduled'),
(2, 2, 2, '2024-05-02 10:30:00', 'Scheduled'),
(3, 3, 3, '2024-05-03 11:00:00', 'Scheduled'),
(4, 4, 4, '2024-05-04 14:00:00', 'Scheduled'),
(5, 5, 5, '2024-05-05 15:30:00', 'Scheduled'),
(6, 6, 6, '2024-05-06 09:00:00', 'Scheduled'),
(7, 7, 7, '2024-05-07 10:30:00', 'Scheduled'),
(8, 8, 8, '2024-05-08 11:00:00', 'Scheduled'),
(9, 9, 9, '2024-05-09 14:00:00', 'Scheduled'),
(10, 10, 10, '2024-05-10 15:30:00', 'Scheduled'),
(11, 11, 11, '2024-05-11 09:00:00', 'Scheduled'),
(12, 12, 12, '2024-05-12 10:30:00', 'Scheduled'),
(13, 13, 13, '2024-05-13 11:00:00', 'Scheduled'),
(14, 14, 14, '2024-05-14 14:00:00', 'Scheduled'),
(15, 15, 15, '2024-05-15 15:30:00', 'Scheduled'),
(16, 16, 16, '2024-05-16 09:00:00', 'Scheduled'),
(17, 17, 17, '2024-05-17 10:30:00', 'Scheduled'),
(18, 18, 18, '2024-05-18 11:00:00', 'Scheduled'),
 (19, 19, 19, '2024-05-19 14:00:00', 'Scheduled'),
(20, 20, 20, '2024-05-20 15:30:00', 'Scheduled');

SELECT * FROM Appointments;
 
INSERT INTO MedicalRecords (record_id, patient_id, doctor_id, visit_date, diagnosis, treatment, prescription, notes) VALUES
(1, 1, 1, '2024-04-01', 'Hypertension', 'Medication', 'Prescription for antihypertensives', 'Follow-up in 1 month'),
(2, 2, 2, '2024-04-02', 'Migraine', 'Lifestyle changes', 'Prescription for triptans', 'Monitor for triggers'),
(3, 3, 3, '2024-04-03', 'Asthma', 'Inhaler', 'Prescription for bronchodilators', 'Regular use of inhaler'),
(4, 4, 4, '2024-04-04', 'Arthritis', 'Physiotherapy', 'Prescription for NSAIDs', 'Continue physiotherapy'),
(5, 5, 5, '2024-04-05', 'Skin rash', 'Topical cream', 'Prescription for corticosteroid cream', 'Apply twice daily'),
(6, 6, 6, '2024-04-06', 'Diabetes', 'Insulin', 'Prescription for insulin', 'Monitor blood sugar levels'),
(7, 7, 7, '2024-04-07', 'Hypertension', 'Medication', 'Prescription for antihypertensives', 'Follow-up in 1 month'),
(8, 8, 8, '2024-04-08', 'Migraine', 'Lifestyle changes', 'Prescription for triptans', 'Monitor for triggers'),
(9, 9, 9, '2024-04-09', 'Asthma', 'Inhaler', 'Prescription for bronchodilators', 'Regular use of inhaler'),
(10, 10, 10, '2024-04-10', 'Arthritis', 'Physiotherapy', 'Prescription for NSAIDs', 'Continue physiotherapy'),
(11, 11, 11, '2024-04-11', 'Skin rash', 'Topical cream', 'Prescription for corticosteroid cream', 'Apply twice daily'),
(12, 12, 12, '2024-04-12', 'Diabetes', 'Insulin', 'Prescription for insulin', 'Monitor blood sugar levels'),
(13, 13, 13, '2024-04-13', 'Hypertension', 'Medication', 'Prescription for antihypertensives', 'Follow-up in 1 month'),
(14, 14, 14, '2024-04-14', 'Migraine', 'Lifestyle changes', 'Prescription for triptans', 'Monitor for triggers'),
(15, 15, 15, '2024-04-15', 'Asthma', 'Inhaler', 'Prescription for bronchodilators', 'Regular use of inhaler'),
(16, 16, 16, '2024-04-16', 'Arthritis', 'Physiotherapy', 'Prescription for NSAIDs', 'Continue physiotherapy'),
(17, 17, 17, '2024-04-17', 'Skin rash', 'Topical cream', 'Prescription for corticosteroid cream', 'Apply twice daily'),
(18, 18, 18, '2024-04-18', 'Diabetes', 'Insulin', 'Prescription for insulin', 'Monitor blood sugar levels'),
(19, 19, 19, '2024-04-19', 'Hypertension', 'Medication', 'Prescription for antihypertensives', 'Follow-up in 1 month'),
(20, 20, 20, '2024-04-20', 'Migraine', 'Lifestyle changes', 'Prescription for triptans', 'Monitor for triggers');

SELECT * FROM MedicalRecords;

INSERT INTO Staff (staff_id, firstname, lastname, position, department, phone, email) VALUES
(1, 'David', 'Smith', 'Nurse', 'Emergency', '555-1000', 'david.smith@example.com'),
(2, 'Linda', 'Brown', 'Technician', 'Radiology', '555-1001', 'linda.brown@example.com'),
(3, 'James', 'Taylor', 'Clerk', 'Administration', '555-1002', 'james.taylor@example.com'),
(4, 'Susan', 'Wilson', 'Lab Assistant', 'Laboratory', '555-1003', 'susan.wilson@example.com'),
(5, 'Robert', 'Johnson', 'Receptionist', 'Front Desk', '555-1004', 'robert.johnson@example.com'),
(6, 'Karen', 'Moore', 'Pharmacist', 'Pharmacy', '555-1005', 'karen.moore@example.com'),
(7, 'Michael', 'Jackson', 'Janitor', 'Maintenance', '555-1006', 'michael.jackson@example.com'),
(8, 'Patricia', 'Garcia', 'Security', 'Security', '555-1007', 'patricia.garcia@example.com'),
(9, 'Charles', 'Martinez', 'Accountant', 'Finance', '555-1008', 'charles.martinez@example.com'),
(10, 'Barbara', 'Davis', 'Nutritionist', 'Dietary', '555-1009', 'barbara.davis@example.com'),
(11, 'Elizabeth', 'Rodriguez', 'Therapist', 'Rehabilitation', '555-1010', 'elizabeth.rodz@example.com'),
(12, 'Christopher', 'Hernandez', 'IT Specialist', 'IT', '555-1011', 'christopher.hernz@example.com'),
(13, 'Thomas', 'Lopez', 'Driver', 'Transport', '555-1012', 'thomas.lopez@example.com'),
(14, 'Sarah', 'Gonzalez', 'Cook', 'Cafeteria', '555-1013', 'sarah.gonzalez@example.com'),
(15, 'Karen', 'Wilson', 'Orderly', 'Patient Services', '555-1014', 'karen.wilson@example.com'),
(16, 'James', 'Anderson', 'Technician', 'Radiology', '555-1015', 'james.anderson@example.com'),
(17, 'Jessica', 'Thomas', 'Clerk', 'Administration', '555-1016', 'jessica.thomas@example.com'),
(18, 'Daniel', 'Lee', 'Lab Assistant', 'Laboratory', '555-1017', 'daniel.lee@example.com'),
(19, 'Susan', 'Harris', 'Receptionist', 'Front Desk', '555-1018', 'susan.harris@example.com'),
(20, 'Mark', 'Clark', 'Pharmacist', 'Pharmacy', '555-1019', 'mark.clark@example.com');

SELECT * FROM Staff;

INSERT INTO Department(dept_id, deptname, location) VALUES
(1, 'Emergency', 'Building A'),
(2, 'Radiology', 'Building B'),
(3, 'Administration', 'Building C'),
(4, 'Laboratory', 'Building D'),
(5, 'Front Desk', 'Building E'),
(6, 'Pharmacy', 'Building F'),
(7, 'Maintenance', 'Building G'),
(8, 'Security', 'Building H'),
(9, 'Finance', 'Building I'),
(10, 'Dietary', 'Building J'),
(11, 'Rehabilitation', 'Building K'),
(12, 'IT', 'Building L'),
(13, 'Transport', 'Building M'),
(14, 'Cafeteria', 'Building N'),
(15, 'Patient Services', 'Building O'),
(16, 'Radiology', 'Building P'),
(17, 'Administration', 'Building Q'),
(18, 'Laboratory', 'Building R'),
(19, 'Front Desk', 'Building S'),
(20, 'Pharmacy', 'Building T');

SELECT * FROM Department;

INSERT INTO Billing (bill_id, patient_id, amount, billing_date, status) VALUES
(1, 1, 200.00, '2024-05-01', 'Paid'),
(2, 2, 150.00, '2024-05-02', 'Pending'),
(3, 3, 300.00, '2024-05-03', 'Paid'),
(4, 4, 250.00, '2024-05-04', 'Pending'),
(5, 5, 100.00, '2024-05-05', 'Paid'),
(6, 6, 175.00, '2024-05-06', 'Pending'),
(7, 7, 225.00, '2024-05-07', 'Paid'),
(8, 8, 275.00, '2024-05-08', 'Pending'),
(9, 9, 125.00, '2024-05-09', 'Paid'),
(10, 10, 150.00, '2024-05-10', 'Pending'),
(11, 11, 200.00, '2024-05-11', 'Paid'),
(12, 12, 150.00, '2024-05-12', 'Pending'),
(13, 13, 300.00, '2024-05-13', 'Paid'),
(14, 14, 250.00, '2024-05-14', 'Pending'),
(15, 15, 100.00, '2024-05-15', 'Paid'),
(16, 16, 175.00, '2024-05-16', 'Pending'),
(17, 17, 225.00, '2024-05-17', 'Paid'),
(18, 18, 275.00, '2024-05-18', 'Pending'),
(19, 19, 125.00, '2024-05-19', 'Paid'),
(20, 20, 150.00, '2024-05-20', 'Pending');

SELECT * FROM Billing;

INSERT INTO Rooms (room_id, room_number, room_type, status) VALUES
(1, '101', 'Single', 'Available'),
(2, '102', 'Double', 'Occupied'),
(3, '103', 'Single', 'Available'),
(4, '104', 'Double', 'Occupied'),
(5, '105', 'Suite', 'Available'),
(6, '106', 'Single', 'Occupied'),
(7, '107', 'Double', 'Available'),
(8, '108', 'Single', 'Occupied'),
(9, '109', 'Suite', 'Available'),
(10, '110', 'Single', 'Occupied'),
(11, '111', 'Double', 'Available'),
(12, '112', 'Single', 'Occupied'),
(13, '113', 'Suite', 'Available'),
(14, '114', 'Double', 'Occupied'),
(15, '115', 'Single', 'Available'),
(16, '116', 'Double', 'Occupied'),
(17, '117', 'Suite', 'Available'),
(18, '118', 'Single', 'Occupied'),
(19, '119', 'Double', 'Available'),
(20, '120', 'Single', 'Occupied');

SELECT * FROM Rooms;

INSERT INTO Admissions (patient_id, room_id, adm_date, discharge_date) VALUES
(1, 1, '2024-01-01', '2024-01-05'),
(2, 2, '2024-01-02', '2024-01-06'),
(3, 3, '2024-01-03', '2024-01-07'),
(4, 4, '2024-01-04', '2024-01-08'),
(5, 5, '2024-01-05', '2024-01-09'),
(6, 6, '2024-01-06', NULL),
(7, 7, '2024-01-07', NULL),
(8, 8, '2024-01-08', NULL),
(9, 9, '2024-01-09', NULL),
(10, 10, '2024-01-10', NULL),
(11, 11, '2024-01-11', NULL),
(12, 12, '2024-01-12', NULL),
(13, 13, '2024-01-13', NULL),
(14, 14, '2024-01-14', NULL),
(15, 15, '2024-01-15', NULL),
(16, 16, '2024-01-16', NULL),
(17, 17, '2024-01-17', NULL),
(18, 18, '2024-01-18', NULL),
(19, 19, '2024-01-19', NULL),
(20, 20, '2024-01-20', NULL);

SELECT * FROM Admissions;

INSERT INTO Inventory (itemname, quantity, supplier, received_date) VALUES
('IV Drip Sets', 800, 'MediSupply', '2024-06-05'),
('Stethoscopes', 50, 'MedEquip', '2024-07-10'),
('Thermometers', 100, 'HealthWare', '2024-08-15'),
('Blood Pressure Monitors', 75, 'MediCorp', '2024-09-20'),
('Defibrillators', 10, 'MediTech', '2024-10-25'),
('Scalpels', 200, 'Surgical Supplies Inc.', '2024-11-30'),
('Surgical Masks', 1000, 'HealthWare', '2024-12-05'),
('Surgical Gowns', 500, 'HealthCo', '2024-01-10'),
('Sutures', 1500, 'MediCorp', '2024-02-15'),
('Alcohol Swabs', 2500, 'ABC Medical Supplies', '2024-03-20'),
('Wheelchairs', 30, 'Mobility Solutions', '2024-04-25'),
('Gloves', 100, 'Mobility Solutions', '2024-05-30'),
('Gauze Pads', 2000, 'ABC Medical Supplies', '2024-06-05'),
('Oxygen Masks', 500, 'PharmaHealth', '2024-07-10'),
('ECG Machines', 20, 'MediTech', '2024-08-15'),
('Hospital Beds', 40, 'HealthCo', '2024-09-20'),
('Pulse Oximeters', 50, 'MedEquip', '2024-10-25'),
('Nebulizers', 30, 'PharmaHealth', '2024-11-30'),
('X-Ray Machines', 5, 'Imaging Solutions', '2024-12-05'),
('Ultrasound Machines', 5, 'Imaging Solutions', '2025-01-10');

SELECT * FROM Inventory;

/* QUERIES*/

/*1. What is the admission date for patient with ID 5?*/

SELECT Adm_date FROM Admissions WHERE Patient_Id=5;

/*2.How many appointments does Doctor Smith have next week?*/

SELECT COUNT(*) FROM APPOINTMENTS 
WHERE DOCTOR_ID=(SELECT DOCTOR_ID FROM DOCTORS WHERE FIRSTNAME='SMITH')
 AND APPOINTMENT_DATE BETWEEN curdate() AND date_add(curdate() , INTERVAL 7 day);
 
 /*3. What is the total billing amount for patient with ID 10? */
 
 SELECT AMOUNT FROM BILLING WHERE PATIENT_ID=10;
 
 /*4.How many departments are there in the hospital?*/
 
 SELECT distinct count(DEPTNAME) FROM DEPARTMENT;

/*5.What is the quantity of gloves available in the inventory?*/

SELECT QUANTITY FROM INVENTORY WHERE ITEMNAME='GLOVES';

/*6.When was the last medical record updated for patient with ID 15?*/

SELECT VISIT_DATE FROM MEDICALRECORDS WHERE PATIENT_ID=15;

/*7.What is the name of the patient with the highest age?*/

SELECT LASTNAME FROM PATIENTS ORDER BY timestampdiff(YEAR,DOB,CURDATE()) DESC LIMIT 1;

/*8.How many single rooms are currently available?*/

SELECT count(ROOM_TYPE) FROM ROOMS WHERE ROOM_TYPE='SINGLE' ;

/*9.Who is the attending physician for patient with ID 8?*/

SELECT d.FirstName, d.LastName
FROM Doctors d
JOIN Appointments a ON d.Doctor_Id = a.Doctor_Id
WHERE a.Patient_Id = 8
LIMIT 1;

/*10.What is the specialty of Doctor Johnson?*/

SELECT Specialization
FROM Doctors
WHERE LastName = 'Davis';

/*11.What is the supplier of the defibrillator with ID 10?*/

SELECT SUPPLIER FROM INVENTORY WHERE ITEM_ID=10;

/*12. What is the total billing amount for all patients in the MEDICATION?  */

SELECT SUM(BILLING.AMOUNT) 
FROM BILLING  JOIN MEDICALRECORDS 
ON BILLING.PATIENT_ID=MEDICALRECORDS.PATIENT_ID 
WHERE MEDICALRECORDS.DIAGNOSIS='MEDICATION';

/*13.How many staff members are assigned to the Emergency department?*/

SELECT COUNT(DEPTNAME) FROM DEPARTMENT WHERE DEPTNAME='EMERGENCY';

/*14.What is the quantity of bandages received on January 10, 2024?*/

SELECT Quantity
FROM Inventory
WHERE ItemName = 'Bandages' AND Received_date = '2024-01-10';

/*15.What is the diagnosis for patient with ID 12?*/

SELECT Diagnosis
FROM MedicalRecords
WHERE Patient_Id = 12;

/*16.What is the current status of room number 102?*/

SELECT Status
FROM Rooms
WHERE Room_number = 102;

/*17.How many single rooms are currently available?*/

SELECT COUNT(*) AS available_single_rooms
FROM Rooms
WHERE Room_type = 'Single' AND Status = 'Available';

/*18.How many patients have been admitted to each room?*/

SELECT Room_number, COUNT(Adm_Id) AS admission_count
FROM Admissions
JOIN Rooms ON Admissions.Room_id = Rooms.Room_id
GROUP BY Room_number;

/*19.What is the total quantity of each item in the inventory?*/

SELECT ItemName, SUM(Quantity) AS total_quantity
FROM Inventory
GROUP BY ItemName;

/*20.What is the total number of appointments scheduled for each doctor?*/

SELECT d.FirstName, d.LastName, COUNT(a.Appointment_Id) AS appointment_count
FROM Doctors d
LEFT JOIN Appointments a ON d.Doctor_Id = a.Doctor_Id
GROUP BY d.Doctor_Id;














