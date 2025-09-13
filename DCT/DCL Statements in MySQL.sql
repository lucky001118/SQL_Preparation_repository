SHOW GRANTS FOR 'root'@'localhost';
SELECT User, Host FROM mysql.user;
SELECT * FROM mysql.user;

-- ********  ##### 25 Practice Questions on DCL in MySQL ####  ***********

--      ##### Section 1: Basic User Management #####
-- 1.	Create a new user named student with password Student@123.
CREATE USER 'student'@'localhost' IDENTIFIED BY 'Student@123';

-- 2.	Create a user manager who can connect only from localhost.
CREATE USER 'manager'@'localhost' IDENTIFIED BY 'manager@123';

-- 3.	Create a user report_user who can connect from any host (%).
CREATE USER 'report_user'@'%' IDENTIFIED BY 'report_user@123';

-- 4.	Change the password of user student to Student@456.
ALTER USER 'student'@'localhost' IDENTIFIED BY 'Student@456';

-- 5.	Delete the user report_user from the MySQL server.
SELECT User, Host From Mysql.user;
DROP USER 'report_user'@'%';


--      ##### Section 2: GRANT Privileges ######
-- 6.	Grant SELECT privilege on all tables in school_db to student.
GRANT ALL PRIVILEGES
ON sql_practice.*
TO 'root'@'localhost';

-- 7.	Grant INSERT privilege on the students table to student.
GRANT INSERT 
ON sql_practice.students
TO 'root'@'localhost';

-- 8.	Grant both SELECT and UPDATE privileges on employees table to manager.
GRANT SELECT,UPDATE
ON sql_practice.staff
TO 'root'@'localhost';

-- 9.	Grant ALL PRIVILEGES on company_db to manager.
GRANT ALL PRIVILEGES 
ON company_db
TO 'manager'@'localhost';

-- 10.	Grant SELECT privilege on only the name and age columns of the students table to student.
-- 			In MySQL, GRANT works at the table or database level, not directly at the column level.
-- 			So you cannot grant privileges on only specific columns (like name and age) with GRANT.
-- 			But there’s a workaround ✅:
-- 			You create a view that exposes only the allowed columns, then grant SELECT on that view.
CREATE VIEW student_view AS
SELECT concat(f_name,last_name) as name, age
FROM staff;

GRANT SELECT 
ON sql_practice.student_view
TO 'root'@'localhost';


-- ##### Section 3: REVOKE Privileges #####
-- 11.	Revoke INSERT privilege on the students table from student.
REVOKE INSERT
ON sql_practice.students
FROM 'root'@'localhost';

-- 12.	Revoke UPDATE privilege on the employees table from manager.
REVOKE SELECT ,  UPDATE
ON sql_practice.staff
FROM 'root'@'localhost';

-- 13.	Revoke ALL PRIVILEGES from manager on company_db.
REVOKE ALL PRIVILEGES
ON company_db
FROM 'manager'@'localhost';

-- 14.	Revoke SELECT on specific columns (name, age) from student.
REVOKE SELECT
ON sql_practice.student_view
FROM 'root'@'localhost';

-- 15.	Revoke all privileges from student on school_db.
REVOKE ALL PRIVILEGES
ON sql_practice.*
FROM 'root'@'localhost';


-- ##### Section 4: SHOW GRANTS #####
-- 16.	Show all privileges assigned to student.
SHOW GRANTS FOR 'student'@'localhost';

-- 17.	Show all privileges assigned to manager.
SHOW GRANTS FOR 'manager'@'localhost';

-- 18.	Verify what privileges the current user has.
SHOW GRANTS FOR 'root'@'localhost';

-- 19.	Display privileges of root user.
SHOW GRANTS FOR 'root'@'localhost';

-- 20.	Show grants for all users connecting from % (any host).
SELECT CONCAT("SHOW GRANTS FOR '", User, "'@'%';") 
FROM mysql.user 
WHERE Host = '%';


-- ##### Section 5: Advanced DCL #####
-- 21.	Create a user admin with password Admin@123 and grant them GRANT OPTION on company_db.
CREATE USER 'admin'@'%' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON company_db.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- 22.	As admin, grant INSERT privilege on employees table to student.
			-- admin user already has GRANT OPTION on company_db, they can grant privileges to others.
			-- To give the INSERT privilege on the employees table to student, run this as admin
            -- firstally login with the username- admit and password - Admin@123 then run this
            GRANT INSERT ON company_db.employees TO 'student'@'localhost';

-- 23.	Revoke GRANT OPTION from admin.
REVOKE GRANT OPTION
ON company_db.*
FROM 'admin'@'%';

-- 24.	Modify privileges directly in MySQL system tables, then use FLUSH PRIVILEGES; to apply changes.
-- 25.	Create a read-only user readonly_user who can only SELECT from all databases.

