-- Procedure to update instructor for a specific class
DELIMITER //
CREATE PROCEDURE UpdateInstructorForClass(IN classId INT, IN instructorId INT)
BEGIN
    UPDATE class SET instructor_id = instructorId WHERE class_id = classId;
END //
DELIMITER ;
-- Procedure to update attendance for a specific student in a class
DELIMITER //
CREATE PROCEDURE UpdateAttendance(IN studentId INT, IN classId INT, IN attendanceStatus VARCHAR(10))
BEGIN
    UPDATE attendance_report SET attendance_status = attendanceStatus WHERE student_id = studentId AND class_id = classId;
END //
DELIMITER ;
-- Procedure to update transaction status for a specific transaction
DELIMITER //
CREATE PROCEDURE UpdateTransactionStatus(IN transactionId INT, IN status VARCHAR(20))
BEGIN
    UPDATE transaction SET transaction_status = status WHERE transaction_id = transactionId;
END //
DELIMITER ;
-- Procedure to update grade for a specific student in a specific course
DELIMITER //
CREATE PROCEDURE UpdateGrade(IN studentId INT, IN courseId INT, IN grade DECIMAL(5, 2))
BEGIN
    UPDATE grade SET score = grade WHERE student_id = studentId AND course_id = courseId;
END //
DELIMITER ;
-- Procedure to update student information
DELIMITER //
CREATE PROCEDURE UpdateStudentInformation(IN studentId INT, IN newFirstName VARCHAR(50), IN newLastName VARCHAR(50))
BEGIN
    UPDATE student SET first_name = newFirstName, last_name = newLastName WHERE student_id = studentId;
END //
DELIMITER ;
-- Trigger to update instructor_id in the class table when a new staff is inserted
DELIMITER //
CREATE TRIGGER UpdateInstructorId AFTER INSERT ON staff
FOR EACH ROW
BEGIN
    UPDATE class SET instructor_id = NEW.staff_id WHERE instructor_id IS NULL;
END //
DELIMITER ;

-- Trigger to update salary of a instructor when he/she receive a new class
DELIMITER //
CREATE TRIGGER UpdateSalary
AFTER INSERT ON class FOR EACH ROW
BEGIN
    DECLARE idOfInstructor INT;
    SET idOfInstructor = NEW.instructor_id;

    IF (SELECT COUNT(*) FROM instructor WHERE id = idOfInstructor) > 0 THEN
        UPDATE salary
        SET wage = wage + 1000.00  -- Giả sử tăng 1000 đơn vị lương
        WHERE person_id = idOfInstructor AND type = 'instructor';
    END IF;
END;
//
DELIMITER ;
