use fap;
INSERT INTO class (name, semester, room, number_slots, class_time, course_id, instructor_id)
VALUES
('SE1801', 'Fall 2023', '132', 20, 2, 1, 1);
delete from class where name = 'SE1801';

select * from class;
select * from staff;
INSERT INTO staff (name, email, phone) VALUES ('New Instructor', 'new@example.com', '555-555-5555');
delete from staff where name = 'New Instructor';

INSERT INTO exam (start_time, end_time, course_id)
VALUES ('2023-12-20 09:00:00', '2023-12-20 11:00:00', 3);

-- test trigger salary
select * from salary;
INSERT INTO class (name, semester, room, number_slots, class_time, course_id, instructor_id)
VALUES
('SE1801', 'Fall 2023', '132', 20, 2, 1, 2);
delete from class where name = 'SE1801';

CALL GetStudentsByCourse('CSI104');
CALL GetAttendanceReportsForStudent('SE183659');
CALL GetTimeTableStudent('SE182426');
CALL GetExamScheduleForStudent('SE183659');
CALL GetGradeReportsForStudent(3);
CALL GetAllGradeReportsForStudents();
CALL GetTransactionHistoryForStudent(1);
CALL GetNews();
CALL ShowAbsentStudentsInClass();
CALL GetInstructorsOfEachMajor();

