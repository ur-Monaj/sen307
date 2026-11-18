-- ============================================-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins-- 
-- Name:ORJI NWANYIEZE MELISA   Matric: VUGSEN2412252-- ============================================
-- USE sen307_12252;
-- Task 1: Students in one department, sorted A-Z-- 
SELECT *
FROM Student s
WHERE dept_id = 2
ORDER BY s.full_name ASC;

-- Task 2: Courses with their lecturers (INNER JOIN)
SELECT
    c.course_id,
    c.course_title,
    l.lecturer_id,
    l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca
    ON c.course_id = ca.course_id
INNER JOIN Lecturer l
    ON ca.lecturer_id = l.lecturer_id;
    
    -- Task 3: Students and their courses (LEFT JOIN)
    SELECT
    s.student_id,
    s.matric_no,
    s.full_name,
    c.course_id,
    c.course_title
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;

-- Task 4: Filtering with AND / OR / IN / BETWEEN
SELECT *
FROM Student
WHERE gender = 'F'
AND dept_id IN (1, 3)
AND date_of_birth BETWEEN '2004-01-01' AND '2007-12-31'
ORDER BY full_name ASC;

-- Task 5: Paginating enrolments with LIMIT and OFFSET
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 0;

SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 10;
-- I must use ORDER BY with LIMIT to ensure records are retrieved in a consistent order preventing rows from being skipped or repeated when moving between pages

-- Optional challenge
SELECT
    s.student_id,
    s.matric_no,
    s.full_name,
    c.course_id,
    c.course_title
FROM Enrolment e
RIGHT JOIN Student s
    ON e.student_id = s.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;
-- LEFT JOIN is easier to use because it keeps all records from the Student table, including students without enrollments, making the query simpler to understand and write.
    
    
