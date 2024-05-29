# HosiptalManagementSystem
Hospital Management System (HMS) automates hospital operations. Manage patients, doctors, appointments, medical records, billing, inventory, staff, and departments efficiently. Improves patient care and streamlines hospital workflows.
# Hospital Information Management System (HIMS) Tables Description

## Patients Table

This table stores information about patients who visit the hospital.

- **patient_id**: Primary key, INT, auto-increment.
- **first_name**: VARCHAR.
- **last_name**: VARCHAR.
- **dob**: DATE.
- **gender**: CHAR.
- **address**: VARCHAR.
- **phone**: VARCHAR.
- **email**: VARCHAR.
- **emergency_contact**: VARCHAR.

## Doctors Table

This table contains records of doctors working at the hospital.

- **doctor_id**: Primary key, INT, auto-increment.
- **first_name**: VARCHAR.
- **last_name**: VARCHAR.
- **specialization**: VARCHAR.
- **phone**: VARCHAR.
- **email**: VARCHAR.

## Appointments Table

Stores appointment information.

- **appointment_id**: Primary key, INT, auto-increment.
- **patient_id**: Foreign key, INT.
- **doctor_id**: Foreign key, INT.
- **appointment_date**: DATETIME.
- **status**: VARCHAR.

## Medical Records Table

Stores medical records and history of patients.

- **record_id**: Primary key, INT, auto-increment.
- **patient_id**: Foreign key, INT.
- **doctor_id**: Foreign key, INT.
- **visit_date**: DATE.
- **diagnosis**: VARCHAR.
- **treatment**: VARCHAR.
- **prescription**: TEXT.
- **notes**: TEXT.

## Staff Table

Stores hospital staff information.

- **staff_id**: Primary key, INT, auto-increment.
- **first_name**: VARCHAR.
- **last_name**: VARCHAR.
- **position**: VARCHAR.
- **department**: VARCHAR.
- **phone**: VARCHAR.
- **email**: VARCHAR.

## Departments Table

Stores information about different departments in the hospital.

- **department_id**: Primary key, INT, auto-increment.
- **department_name**: VARCHAR.
- **location**: VARCHAR.

## Billing Table

Stores billing information for patients.

- **bill_id**: Primary key, INT, auto-increment.
- **patient_id**: Foreign key, INT.
- **amount**: DECIMAL.
- **billing_date**: DATE.
- **status**: VARCHAR.

## Rooms Table

Stores information about hospital rooms.

- **room_id**: Primary key, INT, auto-increment.
- **room_number**: VARCHAR.
- **room_type**: VARCHAR.
- **status**: VARCHAR.

## Admissions Table

Stores information about patient admissions.

- **admission_id**: Primary key, INT, auto-increment.
- **patient_id**: Foreign key, INT.
- **room_id**: Foreign key, INT.
- **admission_date**: DATE.
- **discharge_date**: DATE.

## Inventory Table

Stores information about hospital inventory.

- **item_id**: Primary key, INT, auto-increment.
- **item_name**: VARCHAR.
- **quantity**: INT.
- **supplier**: VARCHAR.
- **received_date**: DATE.

