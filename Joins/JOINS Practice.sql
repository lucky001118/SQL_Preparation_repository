use sql_practice;
show tables;
RENAME TABLE students TO students_sc;
RENAME TABLE courses TO courses_sc;
RENAME TABLE department to department_sc;

--  Create the Student Table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100)
);

-- creating the course table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

-- 3. enrollments (Many-to-Many relation between students and courses)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 4. teachers
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    subject VARCHAR(100)
);

-- 5. course_teacher (Assigns teachers to courses)
CREATE TABLE course_teacher (
    ct_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    teacher_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

SHOW TABLES;

-- Step 3: Insert Sample Data
-- Students
INSERT INTO students (name, age, email) VALUES
('Amit Sharma', 20, 'amit@example.com'),
('Priya Singh', 22, 'priya@example.com'),
('Rahul Verma', 21, 'rahul@example.com'),
('Neha Gupta', 23, 'neha@example.com');

-- Courses
INSERT INTO courses (course_name, credits) VALUES
('Database Systems', 4),
('Operating Systems', 3),
('Computer Networks', 3),
('Data Structures', 4);

-- Enrollments
INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 1, 'A'),
(2, 3, 'C'),
(3, 4, 'B'),
(4, 2, 'A'),
(4, 3, 'B');

-- Teachers
INSERT INTO teachers (name, subject) VALUES
('Dr. Meena', 'Database Systems'),
('Mr. Rakesh', 'Operating Systems'),
('Ms. Kavita', 'Computer Networks'),
('Dr. Arjun', 'Data Structures');

-- Course-Teacher Mapping
INSERT INTO course_teacher (course_id, teacher_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

DESC students;
DESC courses;
DESC teachers;
DESC enrollments;
DESC course_teacher;

SELECT * from students;
SELECT * FROM enrollments;
SELECT * FROM courses;
SELECT * FROM course_teacher;
SELECT * FROM teachers;

INSERT INTO teachers(name) values('Vishal Chaorasia');
INSERT INTO courses(course_name,credits) VALUES ('English Litreture',3);
INSERT INTO students(name,age,email) Values ('Domendra Nirmalkar',21,'nirmalkardomendra@gmail.com');

-- Basic (INNER JOIN)
-- 1.	List all students along with the courses they are enrolled in.
SELECT s.student_id, c.course_id, s.name, s.age, s.email, c.course_name, c.credits
FROM students s
INNER JOIN enrollments e ON s.student_id = e.enrollment_id
INNER JOIN courses c ON e.enrollment_id = c.course_id; 

-- 2.	Show student names with their grades in each course.
SELECT s.name, e.grade
FROM students s 
INNER JOIN enrollments e 
ON s.student_id = e.enrollment_id;

-- 3.	Display course names along with the names of students enrolled.
SELECT s.name, c.course_name
FROM students s 
INNER JOIN enrollments e ON e.enrollment_id = s.student_id
INNER JOIN courses c ON e.enrollment_id = c.course_id;

-- 4.	Find teachers assigned to each course.
SELECT t.name, c.course_name
FROM teachers t 
INNER JOIN course_teacher ct ON t.teacher_id = ct.ct_id
INNER JOIN courses c ON c.course_id = ct.ct_id;

-- 5.	List students who are enrolled in “Database Systems.”
SELECT s.name, c.course_name
FROM students s 
INNER JOIN enrollments e ON s.student_id = e.enrollment_id
INNER JOIN courses c ON e.enrollment_id = c.course_id
	WHERE c.course_name = 'Database Systems';
    
-- LEFT JOIN
-- 6.	Show all students and their enrolled courses (include students with no enrollment).
SELECT s.name, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON c.course_id = e.course_id;

-- 7.	Display all courses and the students enrolled in them (include courses with no students).
SELECT s.name, c.course_name
FROM courses c 
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN students s ON s.student_id = e.student_id;

-- 8.	Show all teachers and their assigned courses (include teachers not assigned to any course).
SELECT t.name, c.course_name
FROM teachers t 
LEFT JOIN course_teacher ct ON t.teacher_id = ct.teacher_id
LEFT JOIN courses c ON c.course_id = ct.course_id;

-- 9.	List students and their grades, but also include students who have not received a grade yet.
SELECT s.name, e.grade 
FROM Students s 
LEFT JOIN enrollments e ON s.student_id = e.student_id;

-- 10.	Display all students and courses together (even if not enrolled).
SELECT s.name, c.course_name
FROM students s 
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON c.course_id = e.course_id;

-- RIGHT JOIN
-- 11.	Show all courses with their enrolled students (include courses even if no students enrolled).
-- 12.	List all enrollments including course names and student names, ensuring no course is missed.
-- 13.	Display all teachers with assigned courses, including courses without teachers.

-- FULL JOIN (via UNION)
-- 14.	Display all students and their courses, including students with no courses and courses with no students.
-- 15.	Show all teachers and courses, even if some teachers don’t teach and some courses don’t have teachers.



