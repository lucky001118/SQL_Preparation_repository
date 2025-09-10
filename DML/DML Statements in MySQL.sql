use sql_practice;
show tables;

--  ***********  ##### 25 Practice Questions on DML in MySQL #####  ************

--      ##### Section 1: INSERT Statements #####
-- 1.	Insert one new employee into the employees_details table with your own details.
DESC staff;
INSERT INTO staff(f_name,last_name,salary,joining_date,email,age)
	VALUE ('Lucky','Manikpuri',50000,'2025-9-9','manikpurilucky218@gmail.com',23);
select * from staff;

-- 2.	Insert 3 new employees in a single query.
INSERT INTO staff(f_name,last_name,salary,joining_date,email,age)
	VALUE ('Domendra','Nirmalkar',30000,'2025-9-9','domendranirmalkar8@gmail.com',21),
    ('Rahul','Sahu',10000,'2025-9-9','rahulsahu2209@gmail.com',22),
    ('Harish','Sahu',30000,'2025-9-9','harishsahu2709@gmail.com',21);
select * from staff;

-- 3.	Insert a student record into a students table with values for name, age, grade, and admission_date.
				-- currentaly we do not have the student table so we will first make the students table then insert the details
                CREATE TABLE students(std_id int primary key,
					roll_number Varchar(15) NOT NULL UNIQUE,
                    name varchar(50) NOT NULL,
                    age int,
                    grade varchar(10),
                    admission_date DATE);
                    
                    ALTER TABLE students MODIFY COLUMN std_id int auto_increment;
		-- now we will insert the record in the student table.
        INSERT INTO students (roll_number,name,age,grade,admission_date) 
			VALUES ('300302221040','Lucky Manikpuri',23,'A+', '2021-10-27');
		select * from students;
        
-- 4.	Insert a department into departments with dept_name = "Human Resources".
DESC department;
INSERT INTO department(dep_name) 
	VALUES ("Human Resources");
SELECT * FROM department;

-- 5.	Insert a row into employees without providing salary (check how NULL/default values behave).
desc staff;
INSERT INTO staff(f_name,last_name,joining_date,email,age)
	VALUES ("Dhiraj","Sahu",'2025-4-16','dhirajsahu015@gmail.com',20);
SELECT * FROM staff;

--      ##### Section 2: UPDATE Statements #####
-- 6.	Update the salary of employee with emp_id = 2 to 90000.
UPDATE staff 
	SET salary = 90000
		WHERE emp_id = 2;
        
-- 7.	Update the email of an employee with emp_id = 5.
UPDATE staff
	SET email='dhirajsahu75522@gmail.com'
		WHERE emp_id=5;
        
-- 8.	Increase salary of all employees by 10%.
UPDATE staff
	SET salary = salary + (salary*10)/100;
        
-- 9.	Change the dept_name of departments where dept_id = 3 to "Finance".
SELECT * FROM department order by dep_id asc;
UPDATE department 
	SET dep_name = "Finance"
		WHERE dep_id = 3;
        
-- 10.	Update multiple fields (salary and age) for employee emp_id = 4.
UPDATE staff
	SET salary = 40000, age = 25
		WHERE emp_id = 4;

--      ##### Section 3: DELETE Statements #####
-- 11.	Delete an employee whose emp_id = 6.
DELETE FROM staff WHERE emp_id = 5;

-- 12.	Delete all employees with salary < 50000.
DELETE FROM staff WHERE salary < 50000;

-- 13.	Delete all students from students whose age > 25.
DELETE FROM students WHERE age > 25;

-- 14.	Remove all rows from departments table but keep the table structure (compare DELETE vs TRUNCATE).
DELETE FROM department;
                        TRUNCATE TABLE department;  -- we can also use this.
                        
-- 15.	Delete all employees who joined before 2020-01-01.
DESC staff;
DELETE FROM staff
	WHERE joining_date < '2020-01-01';
    
    
--      ##### Section 4: LOCK Statements #####
-- 16.	Apply a READ LOCK on the employees table and then try selecting data.
LOCK TABLES staff READ;
		SELECT * FROM staff;
UNLOCK TABLES;

-- 17.	Apply a WRITE LOCK on the employees table and attempt an UPDATE.
LOCK TABLES staff WRITE;
		UPDATE staff
			SET salary = 45600
            Where emp_id = 9;
UNLOCK TABLES;

-- 18.	Lock the departments table for write operations, insert a new department, and then unlock it.
LOCK TABLES staff WRITE;
	INSERT INTO staff(f_name,last_name,salary,joining_date,email,age)
    VALUES('Dhiraj','Sahu',25000,'2025-01-01','dhiraj@gmail.com',22);
UNLOCK TABLES;

-- 19.	Demonstrate what happens if you try to insert into a locked table from another session.
			-- There is two type of lock present 
				 -- 1. READ LOCK  : allow READ operation to another session and prevent the WRITE operations
                --  2. WRITE LOCK  : prevent both READ and WRITE operation of the another session
			-- both lock prevents the WRITE operation on the locked table by another session if another session tryes to insert a value into the loked table then it will denay the transaction.
                
-- 20.	Unlock all tables using UNLOCK TABLES.
LOCK TABLES staff READ;
-- make transactions
UNLOCK TABLES;

--      ##### Section 5: CALL (Stored Procedures) #####
-- 21.	Create a procedure add_department that inserts a new department into departments and call it.
DELIMITER //
CREATE PROCEDURE add_department(
	IN p_department_name Varchar(50)
								)
BEGIN
	INSERT INTO department(dep_name)
    VALUES(p_department_name);
END  //
DELIMITER ;

CALL add_department("Computer Science Engineering");
CALL add_department("Information Technology");

SELECT * FROM department;
		
-- 22.	Create a procedure get_employee_by_id that selects details of an employee given their emp_id and call it.
DELIMITER //
CREATE PROCEDURE get_employee_by_id(
					IN e_emp_id int
                    )
BEGIN
		SELECT * FROM staff 
			WHERE emp_id = e_emp_id;
END //
DELIMITER ;
      -- calling the Procedure
CALL get_employee_by_id(8);
CALL get_employee_by_id(10);

-- 23.	Create a procedure increase_salary that increases salary of all employees by 5000 and call it.
DELIMITER //
CREATE PROCEDURE increase_salary(IN inc_value int)
BEGIN
	UPDATE staff
		SET salary = salary + inc_value;
END //
DELIMITER ;
     -- calling the procedure now
CALL increase_salary(5000); 

-- 24.	Create a procedure delete_student that deletes a student from students table using student_id and call it.
DELIMITER //
CREATE PROCEDURE delete_student(IN student_id INT)
BEGIN
	DELETE FROM students 
		WHERE std_id = student_id;
END //
DELIMITER ;
       -- call the procedure
       DROP PROCEDURE delete_student;
CALL delete_student(5);

-- 25.	Create a procedure update_email that takes emp_id and new email as parameters and updates the record.
DELIMITER //
CREATE PROCEDURE update_email( IN u_emp_id INT,
								IN u_new_email VARCHAR(50) )
BEGIN
	UPDATE staff
		SET email = u_new_email
        WHERE emp_id = u_emp_id;
END //
DELIMITER ;
    -- call the procedure
CALL update_email(10,"dhirajsahu45891@gmail.com");
