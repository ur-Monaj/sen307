-- ============================================-- VUA-SEN307 
-- Lab 6: Aggregate Functions, Grouping and Subqueries
-- Name: Orji Nwanyieze Melisa  Matric: VUG/SEN/24/12252
-- ============================================
-- USE sen307_20231234;
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 5;

SELECT
    c.course_code,
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
    ON c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_title
ORDER BY total_students DESC;

SELECT
    c.course_code,
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
    ON c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_title
HAVING COUNT(e.student_id) > 3
ORDER BY total_students DESC;

SELECT
    s.student_id,
    s.full_name,
    COUNT(e.course_id) AS course_count
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    s.full_name;
    
    
    SELECT ROUND(AVG(course_count), 2) AS average_courses_per_student
FROM (
    SELECT
        s.student_id,
        s.full_name,
        COUNT(e.course_id) AS course_count
    FROM Student s
    LEFT JOIN Enrolment e
        ON s.student_id = e.student_id
    GROUP BY
        s.student_id,
        s.full_name
) AS per_student;

SELECT
    student_id,
    matric_no,
    full_name,
    gender
FROM Student
WHERE student_id NOT IN (
    SELECT student_id
    FROM Enrolment
);

SELECT
    d.dept_name,
    s.full_name,
    (
        SELECT COUNT(*)
        FROM Enrolment e
        WHERE e.student_id = s.student_id
    ) AS courses
FROM Student s
JOIN Department d
    ON s.dept_id = d.dept_id
WHERE (
    SELECT COUNT(*)
    FROM Enrolment e
    WHERE e.student_id = s.student_id
) = (
    SELECT MAX(
        (
            SELECT COUNT(*)
            FROM Enrolment e2
            WHERE e2.student_id = s2.student_id
        )
    )
    FROM Student s2
    WHERE s2.dept_id = s.dept_id
)
ORDER BY d.dept_name;