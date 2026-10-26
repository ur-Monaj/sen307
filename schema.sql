-- VUA-SEN307 Week 4 Practical: Course Registration Schema (3NF)
-- Replace database name with your own sen307_<matric_number> database.
CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    matric_no VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT fk_student_department FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);

CREATE TABLE Lecturer (
    lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
    lecturer_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT fk_lecturer_department FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);

CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_title VARCHAR(100) NOT NULL
);

CREATE TABLE Enrolment (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    session VARCHAR(20) NOT NULL,
    PRIMARY KEY (student_id, course_id, session),
    CONSTRAINT fk_enrolment_student FOREIGN KEY (student_id)
        REFERENCES Student(student_id),
    CONSTRAINT fk_enrolment_course FOREIGN KEY (course_id)
        REFERENCES Course(course_id)
);

CREATE TABLE CourseLecturer (
    course_id INT NOT NULL,
    lecturer_id INT NOT NULL,
    session VARCHAR(20) NOT NULL,
    PRIMARY KEY (course_id, lecturer_id, session),
    CONSTRAINT fk_courselecturer_course FOREIGN KEY (course_id)
        REFERENCES Course(course_id),
    CONSTRAINT fk_courselecturer_lecturer FOREIGN KEY (lecturer_id)
        REFERENCES Lecturer(lecturer_id)
);
