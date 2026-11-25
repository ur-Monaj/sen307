USE sen307_12252;

-- =====================================================
-- VUA-SEN307 DATABASE SYSTEMS - WEEK 6 PRACTICAL
-- Lab 4: Data Manipulation Language (DML)
-- =====================================================

-- PART 1: DEPARTMENTS AND COURSES

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
 'Architectural styles, design patterns, microservices and how to structure large software systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
 'Processes, threads, CPU scheduling, memory management and file systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
 'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
 'Intelligent agents, search algorithms, knowledge representation and reasoning.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
 'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
 'Exploratory data analysis, charts, dashboards and telling stories with data.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
 'Distributed storage and processing of very large datasets with Hadoop and Spark.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d
LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;



INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/SEN/001', 'Chinedu Okafor', 'chinedu.okafor@university.edu.ng', 1),
('VUA/CSC/002', 'Amina Bello', 'amina.bello@university.edu.ng', 2),
('VUA/SEN/003', 'Emeka Nwosu', 'emeka.nwosu@university.edu.ng', 1),
('VUA/AIT/004', 'Fatima Abubakar', 'fatima.abubakar@university.edu.ng', 3),
('VUA/CSC/005', 'Tunde Adeyemi', 'tunde.adeyemi@university.edu.ng', 2),
('VUA/DSC/006', 'Ngozi Eze', 'ngozi.eze@university.edu.ng', 4),
('VUA/AIT/007', 'Ibrahim Musa', 'ibrahim.musa@university.edu.ng', 3),
('VUA/DSC/008', 'Chiamaka Obi', 'chiamaka.obi@university.edu.ng', 4),
('VUA/CST/009', 'Samuel Oladipo', 'samuel.oladipo@university.edu.ng', 5),
('VUA/CST/010', 'Grace Okonkwo', 'grace.okonkwo@lectureruniversity.edu.ng', 5);



INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/12252', 'Orji Nwanyieze Melisa', 'F', '2007-04-30', 1),
('VUG/SEN/12431', 'Ubaka Patrick', 'M', '2005-06-12', 1),
('VUG/CSC/12432', 'Michelle Benjamin', 'F', '2004-09-21', 2),
('VUG/AIT/12433', 'Nita Tile', 'F', '2005-02-14', 3),
('VUG/DSC/12434', 'Opurum Paula', 'F', '2004-11-08', 4),
('VUG/SEN/12435', 'Chinedu Okafor', 'M', '2005-03-17', 1),
('VUG/CSC/12436', 'Amina Bello', 'F', '2004-07-25', 2),
('VUG/AIT/12437', 'Emeka Nwosu', 'M', '2005-01-19', 3),
('VUG/DSC/12438', 'Fatima Abubakar', 'F', '2004-12-03', 4),
('VUG/CST/12439', 'Tunde Adeyemi', 'M', '2005-08-11', 5),
('VUG/SEN/12440', 'Ngozi Eze', 'F', '2004-05-29', 1),
('VUG/CSC/12441', 'Ibrahim Musa', 'M', '2005-10-16', 2),
('VUG/AIT/12442', 'Chiamaka Obi', 'F', '2004-04-07', 3),
('VUG/DSC/12443', 'Samuel Oladipo', 'M', '2005-09-13', 4),
('VUG/CST/12444', 'Grace Okonkwo', 'F', '2004-06-22', 5),
('VUG/SEN/12445', 'David Eze', 'M', '2005-12-01', 1),
('VUG/CSC/12446', 'Blessing Ojo', 'F', '2004-03-15', 2),
('VUG/AIT/12447', 'Peter Nnamdi', 'M', '2005-07-09', 3),
('VUG/DSC/12448', 'Esther James', 'F', '2004-10-27', 4),
('VUG/CST/12449', 'Michael Chukwu', 'M', '2005-02-18', 5);



SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;

INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (1, 2), (2, 1), (2, 3),
(3, 1), (3, 4), (4, 1), (4, 5),
(5, 1), (5, 6), (6, 1), (6, 7),
(7, 1), (7, 8), (8, 2), (8, 9),
(9, 2), (9, 10), (10, 2), (10, 3),
(11, 2), (11, 4), (12, 3), (12, 5),
(13, 3), (13, 6), (14, 4), (14, 7),
(15, 4), (15, 8), (16, 5), (16, 9),
(17, 6), (17, 10), (18, 7), (18, 8),
(1, 9), (2, 10), (3, 5), (4, 6);



INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2), (2, 2),
(3, 3), (4, 4), (5, 5), (6, 6),
(7, 7), (8, 8), (9, 9), (10, 10);




SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = 'VUG/SEN/12252';

SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET dept_id = 2 WHERE matric_no = 'VUG/SEN/12252';
SET SQL_SAFE_UPDATES = 1;

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = 'VUG/SEN/12252';



INSERT INTO Department (dept_name)
VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
        (SELECT dept_id FROM Department
         WHERE dept_name = 'Library and Information Science'));



SET SQL_SAFE_UPDATES = 0;
DELETE FROM Department
WHERE dept_name = 'Library and Information Science';
SET SQL_SAFE_UPDATES = 1;



SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department
               WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department
WHERE dept_name = 'Library and Information Science';
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Department;




SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;
