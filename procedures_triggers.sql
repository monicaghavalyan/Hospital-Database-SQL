USE HospitalSchema;

#1 updating the status of a specified room
DELIMITER //
CREATE PROCEDURE UpdateRoomStatus(IN room_id INT, IN new_status VARCHAR(255))
BEGIN
    UPDATE Room
    SET Status = new_status
    WHERE RoomID = room_id;
END //
DELIMITER ;

#2 admitting a patient into a room and update the room status
DELIMITER //
CREATE PROCEDURE AdmitPatient(IN p_patient_id INT, IN p_room_id INT)
BEGIN
    UPDATE Patient SET RoomID = p_room_id WHERE PatientID = p_patient_id;
	UPDATE Room SET Status = 'Occupied' WHERE RoomID = p_room_id;
END //
DELIMITER ;

#3 discharging a patient and makes the room available
DELIMITER //
CREATE PROCEDURE DischargePatient(IN p_patient_id INT)
BEGIN
    DECLARE p_room_id INT;
    SELECT RoomID INTO p_room_id FROM Patient WHERE PatientID = p_patient_id;
    UPDATE Room SET Status = 'Available' WHERE RoomID = p_room_id;
    UPDATE Patient SET RoomID = NULL WHERE PatientID = p_patient_id;
END //
DELIMITER ;

#4 updating the room status to 'Occupied' when a new patient is assigned to the room
DELIMITER //
CREATE TRIGGER AfterPatientAdmission
AFTER UPDATE ON Patient
FOR EACH ROW
BEGIN
    UPDATE Room SET Status = 'Occupied' WHERE RoomID = NEW.RoomID;
END //
DELIMITER ;

#5 updating the room status to 'Available' when a patient is discharged
DELIMITER //
CREATE TRIGGER AfterPatientDischarge
AFTER UPDATE ON Patient
FOR EACH ROW
BEGIN
    IF OLD.RoomID IS NOT NULL AND NEW.RoomID IS NULL THEN
        UPDATE Room SET Status = 'Available' WHERE RoomID = OLD.RoomID;
    END IF;
END //
DELIMITER ;

CALL UpdateRoomStatus(104, 'Maintenance');
CALL AdmitPatient(123, 105);
CALL DischargePatient(123);

UPDATE Room SET Status = 'Available' WHERE RoomID = 110;
SELECT Status FROM Room WHERE RoomID = 110;

UPDATE Patient SET RoomID = 110 WHERE PatientID = 4;
SELECT Status FROM Room WHERE RoomID = 110;

UPDATE Patient SET RoomID = NULL WHERE PatientID = 4;
SELECT Status FROM Room WHERE RoomID = 110;







