USE HospitalSchema;

INSERT INTO Building (BuildingID, Name, Address, NumberOfFloors)
VALUES
(1, 'Main Building', 'Yerevan, Arabkir', 5),
(2, 'East Wing', 'Yerevan, Kentron', 3),
(3, 'West Wing', 'Yerevan, Nor Nork', 4);

INSERT INTO Department (DepartmentID, Name, BuildingID, ServicesOffered)
VALUES
(1, 'Cardiology', 1, 'Heart Health'),
(2, 'Neurology', 1, 'Brain and Nervous System'),
(3, 'Orthopedics', 2, 'Bones and Joints'),
(4, 'Internal medicine', 3, 'Comprehensive Care'),
(5, 'Urology', 3, 'Genitourinary Surgery'),
(6, 'Pediatrics', 3, 'Care and Treatment of Children'),
(7, 'Dermatology', 1, 'Skin Care and Treatment'),
(8, 'Rheumatology', 2, 'Musculoskeletal Disorders Treatment');

INSERT INTO Room (RoomID, BuildingID, DepartmentID, Type, Capacity, Status) 
VALUES
(101, 1, 1, 'Patient Room', 2, 'Occupied'),
(102, 1, 2, 'Patient Room', 2, 'Available'),
(103, 1, 1, 'Operating Room', 1, 'In Use'),
(104, 2, 3, 'Consultation Room', 1, 'Available'),
(105, 2, 8, 'Recovery Room', 3, 'Cleaning'),
(106, 3, 4, 'ICU', 2, 'Occupied'),
(107, 3, 5, 'Patient Room', 3, 'Maintenance'),
(108, 1, 7, 'Operating Room', 1, 'Available'),
(109, 2, 3, 'Consultation Room', 2, 'Occupied'),
(110, 3, 6, 'Recovery Room', 3, 'Available'),
(111, 1, 2, 'ICU', 1, 'In Use'),
(112, 2, 3, 'Patient Room', 4, 'Occupied'),
(113, 3, 6, 'Operating Room', 1, 'Available'),
(114, 1, 1, 'Patient Room', 1, 'Cleaning'),
(115, 1, 7, 'Consultation Room', 1, 'Occupied'),
(116, 2, 8, 'Patient Room', 2, 'Available'),
(117, 3, 4, 'Consultation Room', 1, 'Available'),
(118, 1, 1, 'Operating Room', 1, 'In Use'),
(119, 2, 8, 'Recovery Room', 2, 'Cleaning'),
(120, 3, 5, 'ICU', 2, 'Occupied'),
(121, 1, 2, 'Consultation Room', 1, 'Available'),
(122, 1, 7, 'Recovery Room', 3, 'Maintenance'),
(123, 2, 3, 'Patient Room', 2, 'Occupied'),
(124, 3, 6, 'Consultation Room', 1, 'Available'),
(125, 1, 1, 'Operating Room', 1, 'Cleaning'),
(126, 2, 3, 'Patient Room', 3, 'Available'),
(127, 1, 2, 'ICU', 2, 'Occupied'),
(128, 1, 7, 'Operating Room', 1, 'In Use'),
(129, 2, 8, 'Patient Room', 3, 'Cleaning'),
(130, 3, 4, 'Consultation Room', 2, 'Available');

INSERT INTO Doctor (DoctorID, Name, Specialty, DepartmentID, ContactInfo)
VALUES
(1, 'Dr. Grace', 'Cardiology', 1, '555-0101'),
(2, 'Dr. Mona', 'Cardiology', 1, '555-0102'),
(3, 'Dr. Jack', 'Neurology', 2, '555-0103'),
(4, 'Dr. Alice', 'Neurology', 2, '555-0104'),
(5, 'Dr. Eve', 'Orthopedics', 3, '555-0105'),
(6, 'Dr. Eve', 'Orthopedics', 3, '555-0106'),
(7, 'Dr. Ivy', 'Internal Medicine', 4, '555-0107'),
(8, 'Dr. Karen', 'Internal Medicine', 4, '555-0108'),
(9, 'Dr. Karen', 'Urology', 5, '555-0109'),
(10, 'Dr. Leo', 'Urology', 5, '555-0110'),
(11, 'Dr. Carol', 'Pediatrics', 6, '555-0111'),
(12, 'Dr. Karen', 'Pediatrics', 6, '555-0112'),
(13, 'Dr. Bob', 'Dermatology', 7, '555-0113'),
(14, 'Dr. Bob', 'Dermatology', 7, '555-0114'),
(15, 'Dr. Ivy', 'Rheumatology', 8, '555-0115'),
(16, 'Dr. Frank', 'Rheumatology', 8, '555-0116');

INSERT INTO Patient (PatientID, Name, Condit, DoctorID, RoomID, PersonalDetails) 
VALUES
(1, 'Alice Brown', 'Condition 1', 1, 105, 'DOB: 1989-09-14'),
(2, 'Bob Clark', 'Condition 2', 1, 110, 'DOB: 1974-07-24'),
(3, 'Carol Davis', 'Condition 3', 1, 113, 'DOB: 1987-04-29'),
(4, 'Dave Edwards', 'Condition 4', 2, 105, 'DOB: 1969-12-19'),
(5, 'Eve Foster', 'Condition 5', 2, 104, 'DOB: 1982-07-14'),
(6, 'Frank Green', 'Condition 6', 3, 108, 'DOB: 1953-04-14'),
(7, 'Grace Harris', 'Condition 7', 4, 110, 'DOB: 1962-03-22'),
(8, 'Hank Johnson', 'Condition 8', 5, 117, 'DOB: 1999-08-02'),
(9, 'Ivy King', 'Condition 9', 6, 103, 'DOB: 1970-08-06'),
(10, 'Jack Lee', 'Condition 10', 7, 113, 'DOB: 2006-11-10'),
(11, 'Karen Miller', 'Condition 11', 8, 111, 'DOB: 1970-05-13'),
(12, 'Leo Nelson', 'Condition 12', 8, 114, 'DOB: 1957-05-24');

INSERT INTO Equipment (EquipmentID, Type, Status, DepartmentID)
VALUES
(1, 'Ultrasound Machine', 'Operational', 1),
(2, 'Ventilator', 'Out of Service', 2),
(3, 'Dialysis Machine', 'Out of Service', 3),
(4, 'Surgical Laser', 'Under Repair', 4),
(5, 'Ventilator', 'Out of Service', 5),
(6, 'Surgical Laser', 'Out of Service', 6),
(7, 'Surgical Laser', 'Under Repair', 7),
(8, 'Surgical Laser', 'Maintenance', 8),
(9, 'Defibrillator', 'Under Repair', 3),
(10, 'Ventilator', 'Out of Service', 7),
(11, 'Ultrasound Machine', 'Maintenance', 7),
(12, 'Ultrasound Machine', 'Operational', 8),
(13, 'MRI Machine', 'Maintenance', 7),
(14, 'Surgical Laser', 'Under Repair', 2),
(15, 'Surgical Laser', 'Maintenance', 1),
(16, 'CT Scanner', 'Operational', 5),
(17, 'Dialysis Machine', 'Out of Service', 5),
(18, 'MRI Machine', 'Out of Service', 8),
(19, 'Defibrillator', 'Under Repair', 8),
(20, 'Ultrasound Machine', 'Under Repair', 8),
(21, 'MRI Machine', 'Operational', 5),
(22, 'Surgical Laser', 'Under Repair', 1),
(23, 'ECG Machine', 'Operational', 1),
(24, 'X-Ray Machine', 'Out of Service', 3),
(25, 'CT Scanner', 'Out of Service', 4),
(26, 'Defibrillator', 'Maintenance', 4),
(27, 'CT Scanner', 'Operational', 6),
(28, 'Dialysis Machine', 'Under Repair', 2),
(29, 'Dialysis Machine', 'Under Repair', 8),
(30, 'Anesthesia Machine', 'Operational', 1);

INSERT INTO Staff (StaffID, Name, Role, DepartmentID, ShiftDetails)
VALUES
(1, 'Alice Brown', 'Lab Technician', 6, 'Day Shift'),
(2, 'Bob Clark', 'Lab Technician', 6, 'Day Shift'),
(3, 'Carol Davis', 'Lab Technician', 5, 'Swing Shift'),
(4, 'Dave Edwards', 'Orderly', 5, 'Swing Shift'),
(5, 'Eve Foster', 'Administrator', 5, 'Night Shift'),
(6, 'Frank Green', 'Orderly', 4, 'Day Shift'),
(7, 'Grace Harris', 'Orderly', 2, 'Day Shift'),
(8, 'Hank Johnson', 'Administrator', 8, 'Swing Shift'),
(9, 'Ivy King', 'Administrator', 1, 'Night Shift'),
(10, 'Jack Lee', 'Administrator', 8, 'Night Shift');