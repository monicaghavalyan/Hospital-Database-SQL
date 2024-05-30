USE HospitalSchema;

#1 finding all equipment in need of repair or maintenance:
SELECT EquipmentID, Type, Status
FROM Equipment
WHERE Status IN ('Under Repair', 'Maintenance');

#2 listing doctors with their patients:
SELECT dr.Name AS DoctorName, p.Name AS PatientName
FROM Doctor dr
JOIN Patient p ON dr.DoctorID = p.DoctorID;

#3 getting patient details by room number:
SELECT p.Name AS PatientName, p.Condit AS Condit, r.RoomID, r.Type AS RoomType
FROM Patient p
JOIN Room r ON p.RoomID = r.RoomID
WHERE r.RoomID = 110;

#4 all staff members working the night shift in Cardiology dep:
SELECT s.Name, s.Role, d.Name AS DepartmentName
FROM Staff s
JOIN Department d ON s.DepartmentID = d.DepartmentID
WHERE s.ShiftDetails LIKE '%Night%' AND d.Name = 'Cardiology';

#5 checking the schedule of equipment maintenance:
SELECT e.EquipmentID, e.Type, e.Status, d.Name AS DepartmentName
FROM Equipment e
JOIN Department d ON e.DepartmentID = d.DepartmentID
WHERE e.Status = 'Maintenance';

#6 get all patients in Neurology department:
SELECT p.Name AS PatientName, p.Condit AS Condit, d.Name AS DepartmentName
FROM Patient p
JOIN Doctor dr ON p.DoctorID = dr.DoctorID
JOIN Department d ON dr.DepartmentID = d.DepartmentID
WHERE d.Name = 'Neurology';

#7 counting the number of available beds in a given department:
SELECT d.Name AS DepartmentName, COUNT(r.RoomID) AS AvailableBeds
FROM Room r
JOIN Department d ON r.DepartmentID = d.DepartmentID
WHERE r.Status = 'Available'
GROUP BY d.Name;

#8 listing all the staff members and their roles in a department:
SELECT s.Name, s.Role
FROM Staff s
JOIN Department d ON s.DepartmentID = d.DepartmentID
WHERE d.Name = 'Pediatrics'; -- Replace 'Cardiology' with the desired department name

#9 counting the number of available beds in a given department:
SELECT d.Name AS DepartmentName, COUNT(r.RoomID) AS AvailableBeds
FROM Room r
JOIN Department d ON r.DepartmentID = d.DepartmentID
WHERE r.Status = 'Available'
GROUP BY d.Name;

#10 finding available equipment for emergency situations:
SELECT EquipmentID, Type
FROM Equipment
WHERE Status = 'Operational' AND Type IN ('Defibrillator', 'Ventilator', 'ECG Machine');

#11 returning the name of the department with the most occupied rooms in a given building
DELIMITER //
CREATE FUNCTION GetDepartmentWithMostOccupiedRooms(buildingId INT)
RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE maxOccupiedRooms INT;
    DECLARE departmentName VARCHAR(255);
    SELECT MAX(occupied_count) INTO maxOccupiedRooms
    FROM (
        SELECT COUNT(*) AS occupied_count
        FROM Room
        WHERE BuildingID = buildingId AND Status = 'Occupied'
        GROUP BY DepartmentID
    ) AS subquery;
    SELECT Name INTO departmentName
    FROM Department
    WHERE DepartmentID IN (
        SELECT DepartmentID
        FROM (
            SELECT DepartmentID, COUNT(*) AS occupied_count
            FROM Room
            WHERE BuildingID = buildingId AND Status = 'Occupied'
            GROUP BY DepartmentID
        ) AS subquery
        WHERE occupied_count = maxOccupiedRooms
    );
    RETURN departmentName;
END //
DELIMITER ;

#12 counting the number of patients in a given department
DELIMITER //
CREATE FUNCTION CountPatientsInDepartment(departmentId INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE patientCount INT;
    SELECT COUNT(*) INTO patientCount
    FROM Patient
    WHERE DepartmentID = departmentId;
    RETURN patientCount;
END //
DELIMITER ;

#13 counting the total number of patients with a specified medical condition
DELIMITER //
CREATE FUNCTION GetTotalPatientsWithCondition(conditionName VARCHAR(255))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE patientsWithConditionCount INT;
    SELECT COUNT(*) INTO patientsWithConditionCount
    FROM Patient
    WHERE Condit = conditionName;
    RETURN patientsWithConditionCount;
END //
DELIMITER ;

#14 counting the number of doctors in a specified department
DELIMITER //
CREATE FUNCTION GetTotalDoctorsInDepartment(departmentId INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE doctorsInDepartmentCount INT;
    SELECT COUNT(*) INTO doctorsInDepartmentCount
    FROM Doctor
    WHERE DepartmentID = departmentId;
    RETURN doctorsInDepartmentCount;
END //
DELIMITER ;

#15 counting the number of staff members with a specified role
DELIMITER //
CREATE FUNCTION GetTotalStaffMembersByRole(roleName VARCHAR(255))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE staffMembersCount INT;
    SELECT COUNT(*) INTO staffMembersCount
    FROM Staff
    WHERE Role = roleName;
    RETURN staffMembersCount;
END //
DELIMITER ;

SELECT GetDepartmentWithMostOccupiedRooms(3);
SELECT CountPatientsInDepartment(3);
SELECT GetTotalPatientsWithCondition('Condition 1');
SELECT GetTotalDoctorsInDepartment(5);
SELECT GetTotalStaffMembersByRole('Orderly');