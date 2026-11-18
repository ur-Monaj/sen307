SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers',   COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students',    
COUNT(*) FROM Student
UNION ALL SELECT 'Courses',     
COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments',  COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;