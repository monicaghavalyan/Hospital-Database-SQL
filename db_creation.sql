CREATE SCHEMA HospitalSchema;

CREATE TABLE HospitalSchema.Building (
    BuildingID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    NumberOfFloors INT
);

CREATE TABLE HospitalSchema.Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    BuildingID INT,
    ServicesOffered VARCHAR(255),
    FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID)
);

CREATE TABLE HospitalSchema.Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    BuildingID INT,
    DepartmentID INT,
    Type VARCHAR(50),
    Capacity INT,
    Status VARCHAR(50),
    FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE HospitalSchema.Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    DepartmentID INT,
    ContactInfo VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE HospitalSchema.Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Condit VARCHAR(255),
    DoctorID INT,
    RoomID INT,
    PersonalDetails TEXT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

CREATE TABLE HospitalSchema.Equipment (
    EquipmentID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(100),
    Status VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE HospitalSchema.Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(100),
    DepartmentID INT,
    ShiftDetails TEXT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);