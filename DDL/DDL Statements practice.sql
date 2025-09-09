SHOW TABLES;

--  #####    Section 1: CREATE DATABASE & TABLE   #####
-- 1.	Create a database named sql_practice.
		-- Already create
        USE sql_practice;
        
-- 2.	Inside company_db, create a table employees_details with columns:
-- o	emp_id (INT, primary key, auto-increment)
-- o	first_name (VARCHAR(50))
-- o	last_name (VARCHAR(50))
-- o	salary (DECIMAL(10,2))
-- o	hire_date (DATE).
CREATE TABLE employees_details(
	emp_id INT PRIMARY KEY AUTO_iNCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE );
    
    DESC employees_details;
    
-- 3.	Create another table departments with columns:
-- o	dept_id (INT, primary key, auto-increment)
-- o	dept_name (VARCHAR(50), must be unique).
-- 4.	Create a database named school_db. Inside it, create a students table with:
-- o	student_id (INT, primary key, auto-increment)
-- o	name (VARCHAR(50), not null)
-- o	age (INT)
-- o	class (VARCHAR(20))
-- o	admission_date (DATE).
CREATE TABLE department(
	dep_id INT PRIMARY KEY AUTO_INCREMENT,
    dep_name VARCHAR(50) UNIQUE );
    
    DESC department;
    
-- 5.	Create a table courses with course_id, course_name, credits, instructor_name.
CREATE TABLE courses(
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL UNIQUE,
    credits INT NOT NULL,
    instructor_name VARCHAR(50) NOT NULL  );
    
    DESC courses;


-- #####      Section 2: DROP DATABASE & TABLE      #####
-- 6.	Drop the database school_db.
CREATE DATABASE school_db;
DROP DATABASE school_db;

-- 7.	Drop the table courses from sql_practice.
USE sql_practice;
	SHOW TABLES;
DROP TABLE courses;
	SHOW TABLES;
    
-- 8.	Write a query to delete the departments table.
SHOW TABLES;
DROP TABLE department;
	SHOW TABLES;
    
-- 9.	Delete the entire company_db database (be careful).
DROP DATABASE company_db;    -- it will gives an error that company_db not found becouse we had created sql_practice database instid of company_db


-- #####      Section 3: ALTER TABLE – ADD COLUMN      #####
-- 10.	Add a new column email (VARCHAR(100)) to the employees_details table.
ALTER TABLE employees_details 
	ADD email VARCHAR(100) UNIQUE; 
DESC employees_details;

-- 11.	Add a column phone_number (VARCHAR(15)) to the employees table.
ALTER TABLE employees_details 
	ADD phone_number VARCHAR(15) UNIQUE;
DESC employees_details;

-- 12.	Add a column location (VARCHAR(50)) to the departments table.
ALTER TABLE employees_details 
	ADD location VARCHAR(50); 
DESC employees_details;


-- #####      Section 4: ALTER TABLE – DROP COLUMN      #####
-- 13.	Remove the phone_number column from the employees table.
ALTER TABLE employees_details 
	DROP COLUMN phone_number;
DESC employees_details;

-- 14.	Drop the location column from the departments table.
ALTER TABLE employees_details 
	DROP COLUMN location;
DESC employees_details;

-- 15.	Drop the class column from the students table.
ALTER TABLE employees_details 
	DROP COLUMN class;         -- It will give an error becouse the ''class'' column dose not present in the employees_details table which we wants to drop.
DESC employees_details;


-- #####      Section 5: ALTER TABLE – MODIFY COLUMN      #####
-- 16.	Change the datatype of salary in employees to DECIMAL(12,2).
ALTER TABLE employees_details 
	MODIFY COLUMN salary DECIMAL(12,2);
DESC employees_details;

-- 17.	Modify the column age in employees_details to make it NOT NULL.
ALTER TABLE employees_details
	ADD age INT;
ALTER TABLE employees_details
	MODIFY COLUMN age INT NOT NULL;
DESC employees_details;
    
-- 18.	Change the length of dept_name in departments from 50 characters to 100 characters.
DESC department;
ALTER TABLE department
	MODIFY COLUMN dep_name VARCHAR(100) ;


-- #####      Section 6: ALTER TABLE – CHANGE COLUMN NAME      #####
-- 19.	Rename the column first_name in employees_details to f_name with datatype VARCHAR(20).
ALTER TABLE employees_details
	CHANGE first_name f_name VARCHAR(20);
DESC employees_details;

-- 20.	Change the column name instructor_name in courses table to teacher_name.
ALTER TABLE courses
	CHANGE instructor_name teacher_name VARCHAR(50);
DESC courses;

-- 21.	Rename the column hire_date in employees_details to joining_date.
ALTER TABLE employees_details
	CHANGE hire_date joining_date DATE;
DESC employees_details;


-- #####      Section 7: TRUNCATE TABLE      #####
-- 22.	Truncate the employees_detals table (remove all data but keep structure).
				-- Before the remove all the information in the employees_details table we have to all some values in to this table.
                INSERT INTO employees_details (f_name, last_name, salary, joining_date, email, age)
				VALUES
				('Amit', 'Sharma', 55000.75, '2021-03-15', 'amit.sharma@example.com', 28),
				('Priya', 'Verma', 72000.00, '2020-07-10', 'priya.verma@example.com', 32),
				('Rahul', 'Mehta', 60000.50, '2022-01-25', 'rahul.mehta@example.com', 26),
				('Sneha', 'Gupta', 80000.00, '2019-11-05', 'sneha.gupta@example.com', 35),
				('Vikram', 'Singh', 45000.25, '2023-06-18', 'vikram.singh@example.com', 24);
                SELECT * FROM employees_details;
-- now do the  (remove all data but keep structure).
TRUNCATE TABLE employees_details;
SELECT * FROM employees_details;
DESC employees_details;

-- 23.	Truncate the students table.
			-- same like above query only chage the table name.
            
            
-- #####      Section 8: RENAME TABLE      #####
-- 24.	Rename the employees_details table to staff.
RENAME TABLE 
	employees_details TO staff;
SHOW TABLES;

-- 25.	Rename the students table to learners.
			-- same like above query.
