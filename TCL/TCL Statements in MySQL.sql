--   ********************##### 25 TCL Practice Questions in MySQL #####**********************

-- Basic Level (Q1–Q8)
-- 1.	Start a transaction and insert a new row into a table. Then rollback so the change is undone.
USE sql_practice;
DESC staff;

START TRANSACTION;
INSERT INTO staff(f_name,last_name,salary,joining_date,age) VALUES ('Lalu','Yadav',10000,'2025-01-01',60);
ROLLBACK;

-- 2.	Start a transaction, insert a row, and then commit it. Verify that the row is permanently saved.
START TRANSACTION;
INSERT INTO staff(f_name,last_name,salary,joining_date,age) VALUES ('Lalu','Yadav',10000,'2025-01-01',60);
COMMIT;
SELECT * FROM staff WHERE f_name='Lalu';

-- 3.	Disable autocommit, insert a record, then rollback to confirm it doesn’t persist.
SET AUTOCOMMIT = 0;
START TRANSACTION;
INSERT INTO staff(f_name,last_name,salary,joining_date,age) VALUES ('Rajnath','Koving',10000,'2025-01-01',60);
ROLLBACK;
SET AUTOCOMMIT=1;
SELECT * FROM staff;

-- 4.	Re-enable autocommit and insert a record. Check if the record is saved without commit.
SET AUTOCOMMIT=1;
INSERT INTO staff(f_name,last_name,salary,joining_date,age) VALUES ('Rajnath','Koving',10000,'2025-01-01',60);
SELECT * FROM staff;

-- 5.	Insert multiple rows in a transaction. Use commit to save them.
START TRANSACTION;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Sunder','Pitchai',10000,'2025-01-01',60,'sunder@gmail.com');
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Ravi','Shastri',10000,'2025-01-01',60,'shastri@gmail.com');
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Sachin','Tendulkar',10000,'2025-01-01',64,'sachintendulkar@gmail.com');
COMMIT;
SELECT * FROM staff;

-- 6.	Insert multiple rows in a transaction. Use rollback to discard them.
START TRANSACTION;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('kali','charan',10000,'2025-01-01',60,'kalicharn@gmail.com');
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('pandit','mishra',10000,'2025-01-01',60,'mishra@gmail.com');
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Maila','Maolana',10000,'2025-01-01',64,'maolana@gmail.com');
ROLLBACK;
SELECT * FROM staff;

-- 7.	Perform an update inside a transaction, rollback it, and check whether the original value remains.
START TRANSACTION;
UPDATE staff
	SET email='yadavlalu2312@gmail.com'
    WHERE f_name='Lalu' and last_name='Yadav';
ROLLBACK;
SELECT * FROM staff;

-- 8.	Perform a delete inside a transaction, rollback it, and confirm the row still exists.
START TRANSACTION;
DELETE FROM staff 
	WHERE f_name = 'Rajnath';
ROLLBACK;
SELECT * FROM staff;


--  ##### Intermediate Level (Q9–Q17) #####
-- 9.	Update two different rows inside a transaction. Use commit to save both changes.
START TRANSACTION;
UPDATE staff
	SET last_name='Singh'
    WHERE emp_id = 14;
    
UPDATE staff
	SET salary = 1000000
    WHERE f_name='SAchin' and last_name='Tendulkar';

COMMIT;
SELECT * FROM staff WHERE emp_id in (14,17);

-- 10.	Update two rows inside a transaction. Use rollback to discard both changes.
START TRANSACTION;
UPDATE staff
	SET last_name='Kalyan'
    WHERE emp_id = 14;
UPDATE staff
	SET salary = 100
    WHERE f_name='SAchin' and last_name='Tendulkar';
ROLLBACK;
SELECT * FROM staff WHERE emp_id in (14,17);

-- 11.	Use SAVEPOINT after an insert, then perform another insert. Rollback to the savepoint. Check which rows remain.
START TRANSACTION;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Satya','Pandey',40000,'2025-01-01',42,'spandey@gmail.com');
SAVEPOINT sp_point1;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Priti','Gurucharan',50000,'2025-01-01',28,'priti@gmail.com');
ROLLBACK TO sp_point1;
COMMIT;
SELECT * FROM staff;

-- 12.	Start a transaction, update a salary in an employees table, create a savepoint, update again, then rollback to the savepoint.
START TRANSACTION;
UPDATE staff
	SET last_name='Kalyanhajhajhjasd'
    WHERE emp_id = 14;
SAVEPOINT update1;
UPDATE staff
	SET salary = 800000
    WHERE f_name='Sachin' and last_name='Tendulkar';
ROLLBACK to update1;
COMMIT;
SELECT * FROM staff WHERE emp_id in (14,17);

-- 13.	Insert 3 records in a transaction with 2 savepoints. Rollback only to the second savepoint.
START TRANSACTION;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Pape','Pandey',40300,'2025-01-01',42,'pape@gmail.com');
SAVEPOINT sp_point1;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Taplu','Rasila',450000,'2025-01-01',28,'Tatti@gmail.com');
SAVEPOINT sp_point2;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Tijku','Charan',50000,'2025-01-01',28,'Charan@gmail.com');

ROLLBACK TO sp_point2;
COMMIT;
SELECT * FROM staff;

-- 14.	Create and release a savepoint. Try rolling back to the released savepoint and note what happens.
START TRANSACTION;
savepoint sp11;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Tijku','Charan',50000,'2025-01-01',28,'Charan@gmail.com');
RELEASE SAVEPOINT sp11;
ROLLBACK TO sp11;         -- after releasing the savepoint and then rollbacking the released savepoint it will says that SAVEPOINT sp11 dose not exist.
COMMIT;
SELECT * FROM staff;

-- 15.	Disable autocommit, perform multiple inserts, then use commit. Verify all are saved.
SET AUTOCOMMIT = 0;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Tanjiro','anime',500054,'2025-01-01',28,'tanjiro@gmail.com');
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Kanao','anime',5000045,'2025-01-01',28,'kanao@gmail.com');
COMMIT;
SELECT * FROM staff;
SET AUTOCOMMIT = 1;

-- 16.	Disable autocommit, perform multiple inserts, then use rollback. Verify none are saved.
SET AUTOCOMMIT = 0;
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Inuske','anime',500054,'2025-01-01',28,'inuske@gmail.com');
INSERT INTO staff(f_name,last_name,salary,joining_date,age,email) VALUES ('Zenetsu','anime',5000045,'2025-01-01',28,'Zenetsu@gmail.com');
ROLLBACK;
SELECT * FROM staff;
SET AUTOCOMMIT = 1;

-- 17.	Demonstrate the difference between SET AUTOCOMMIT = 0 and START TRANSACTION.
-- SET AUTOCOMMIT = 0 is used to save the default behaviour of the MySql that will every time commit the every operations (like Insert, update, delete etc.) without commit.
-- START TRANSACTION is allowed us to perpormming some group of the operations that affects the db, when operations are done then we have options to either COMMIT the operation or ROLLBACK it.alter. 
			-- if we do not COMMIT the operations it dose not save permanent in the db. only save for the temprary.

-- Advanced Level (Q18–Q25)
-- 18.	Simulate a bank transfer: Deduct money from one account and add to another inside a transaction. Commit it.
		-- for that firstally i have to generate the table 
	CREATE TABLE BANK (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    account_holder_name VARCHAR(100) NOT NULL,
    bank_branch VARCHAR(100) NOT NULL,
    account_number BIGINT UNIQUE NOT NULL,
    ifsc_code VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    mobile_number VARCHAR(15) UNIQUE,
    total_amount DECIMAL(15,2) DEFAULT 0.00,
    
    last_operation ENUM('Debit', 'Credit') DEFAULT NULL,
    last_operation_money DECIMAL(15,2) DEFAULT 0.00,
    last_operation_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DESC bank;
				-- some dummy values
		INSERT INTO BANK 
		(account_holder_name, bank_branch, account_number, ifsc_code, email, mobile_number, total_amount, last_operation, last_operation_money) 
		VALUES
		('Amit Sharma', 'Delhi Main Branch', 123456789012, 'SBIN0001234', 'amit.sharma@example.com', '9876543210', 50000.00, 'Credit', 50000.00),
		('Priya Verma', 'Mumbai Andheri Branch', 123456789013, 'HDFC0005678', 'priya.verma@example.com', '9876501234', 75000.00, 'Debit', 5000.00),
		('Rohit Mehta', 'Bangalore Whitefield Branch', 123456789014, 'ICIC0009876', 'rohit.mehta@example.com', '9898123456', 30000.00, 'Credit', 30000.00),
		('Sneha Patel', 'Ahmedabad CG Road Branch', 123456789015, 'PNB0004455', 'sneha.patel@example.com', '9123456789', 120000.00, 'Debit', 20000.00),
		('Arjun Reddy', 'Hyderabad Banjara Hills Branch', 123456789016, 'AXIS0003322', 'arjun.reddy@example.com', '9988776655', 90000.00, 'Credit', 90000.00);
SELECT * FROM BANK;
		-- now doing the operations
        START TRANSACTION;
        UPDATE bank SET total_amount=total_amount-1000 , last_operation = 'Debit', last_operation_money = 1000 WHERE account_number = 123456789012;  -- DEDUCTING 1000 rupees from ac-123456789012. 
        UPDATE bank SET total_amount=total_amount+1000 , last_operation = 'Credit', last_operation_money = 1000 WHERE account_number = 123456789013; -- ADDING 1000 rupees. 
        COMMIT;
        SELECT * FROM BANK;
        
-- 19.	Simulate a bank transfer: Deduct money but do not add it. Rollback to ensure no loss occurs.
START TRANSACTION;
UPDATE bank SET total_amount=total_amount-400 , last_operation = 'Debit', last_operation_money = 400 WHERE account_number = 123456789012;  -- DEDUCTING 400 rupees from ac-123456789012. 
ROLLBACK;
SELECT * FROM BANK WHERE account_number=123456789012;

-- 20.	Use multiple savepoints in a single transaction (sp1, sp2, sp3). Rollback to sp2 and commit the rest.
START TRANSACTION;
-- First operation
INSERT INTO BANK (account_holder_name, bank_branch, account_number, ifsc_code, email, mobile_number, total_amount, last_operation, last_operation_money)
VALUES ('Vikram Singh', 'Chennai Mount Road Branch', 123456789017, 'BOB0002211', 'vikram.singh@example.com', '9090909090', 45000.00, 'Credit', 45000.00);
SAVEPOINT sp1;
-- Second operation
INSERT INTO BANK (account_holder_name, bank_branch, account_number, ifsc_code, email, mobile_number, total_amount, last_operation, last_operation_money)
VALUES ('Kiran Gupta', 'Pune Camp Branch', 123456789018, 'CANB0001111', 'kiran.gupta@example.com', '9191919191', 60000.00, 'Credit', 60000.00);
SAVEPOINT sp2;
-- Third operation
INSERT INTO BANK (account_holder_name, bank_branch, account_number, ifsc_code, email, mobile_number, total_amount, last_operation, last_operation_money)
VALUES ('Anjali Nair', 'Kochi Marine Drive Branch', 123456789019, 'IDBI0003344', 'anjali.nair@example.com', '9292929292', 80000.00, 'Credit', 80000.00);
SAVEPOINT sp3;
-- Rollback to sp2 (Anjali’s insert will be undone, but Kiran’s will remain)
ROLLBACK TO sp2;
-- Commit the rest (Vikram & Kiran stay in DB)
COMMIT;
SELECT * FROM BANK;

-- 21.	Insert rows in a transaction with nested savepoints. Release one savepoint and rollback to another.
-- 22.	Perform an update, set a savepoint, perform a delete, then rollback to the savepoint. Confirm only the delete was undone.
-- 23.	Perform an update and commit. Then try rollback. Verify that committed changes cannot be undone.

-- 24.	Simulate concurrent transactions: Open two sessions, update the same row in each, and observe the effect of commit/rollback.
START TRANSACTION;
-- Session A
-- Check Amit's balance
SELECT total_amount FROM BANK WHERE customer_id = 1;
-- Update balance in Session A
UPDATE BANK SET total_amount = total_amount - 5000, 
                last_operation = 'Debit', 
                last_operation_money = 5000
WHERE customer_id = 1;
-- Do NOT commit yet

-- Session B (while Session A is still open)
START TRANSACTION;
-- Check Amit's balance
SELECT total_amount FROM BANK WHERE customer_id = 1;
-- Update balance in Session B
UPDATE BANK SET total_amount = total_amount - 3000,
                last_operation = 'Debit',
                last_operation_money = 3000
WHERE customer_id = 1;

-- Session A commits:
COMMIT;
-- Session A rollbacks:
ROLLBACK;
select * from bank;

-- 25.	Write a transaction that includes INSERT, UPDATE, and DELETE operations. Use savepoints and rollback to undo only specific changes while keeping others.
START TRANSACTION;
-- Step 1: Insert a new customer
INSERT INTO BANK (account_holder_name, bank_branch, account_number, ifsc_code, email, mobile_number, total_amount, last_operation, last_operation_money)
VALUES ('Ramesh Kumar', 'Jaipur MI Road Branch', 123456789020, 'UBIN0005678', 'ramesh.kumar@example.com', '9393939393', 20000.00, 'Credit', 20000.00);
SAVEPOINT sp1;
-- Step 2: Update an existing customer balance
UPDATE BANK 
SET total_amount = total_amount + 10000, 
    last_operation = 'Credit', 
    last_operation_money = 10000 
WHERE customer_id = 2;  -- Priya Verma
SAVEPOINT sp2;
-- Step 3: Delete a customer
DELETE FROM BANK WHERE customer_id = 3;  -- Rohit Mehta
SAVEPOINT sp3;
-- Rollback only the DELETE (sp3), so Rohit Mehta is restored
ROLLBACK TO sp2;
-- Commit the rest (Ramesh’s insert + Priya’s update are kept, delete undone)
COMMIT;

