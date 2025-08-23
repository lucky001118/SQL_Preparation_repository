
USE sql_practice;

-- Craating the table for the sql Practice
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL,
    age INT,
    performance_rating INT CHECK (performance_rating BETWEEN 1 AND 5),
    is_active BOOLEAN DEFAULT TRUE,
    bonus DECIMAL(8,2) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- in serting the value in the created table
INSERT INTO employees 
(first_name, last_name, email, phone_number, department, salary, hire_date, age, performance_rating, is_active, bonus) 
VALUES
('Alice',   'Johnson', 'alice.johnson@company.com',  '9876543210', 'HR',        55000, '2020-05-12', 29, 5, TRUE,  5000),
('Bob',     'Smith',   'bob.smith@company.com',      '9123456780', 'IT',        70000, '2019-03-23', 35, 4, TRUE,  NULL),
('Charlie', 'Brown',   'charlie.brown@company.com',  '9988776655', 'Finance',   80000, '2021-07-15', 41, 3, FALSE, 7000),
('David',   'Wilson',  'david.wilson@company.com',   '9012345678', 'IT',        60000, '2018-11-10', 28, 5, TRUE,  3000),
('Eva',     'Taylor',  'eva.taylor@company.com',     '9345678123', 'Marketing', 50000, '2022-01-05', 24, 2, TRUE,  NULL),
('Frank',   'Miller',  'frank.miller@company.com',   '9765432109', 'Finance',   95000, '2017-08-25', 46, 4, TRUE, 10000),
('Grace',   'Davis',   'grace.davis@company.com',    '9234567812', 'HR',        48000, '2020-10-14', 31, 3, FALSE, NULL),
('Hank',    'Moore',   'hank.moore@company.com',     '9456123789', 'IT',        72000, '2021-09-21', 36, 5, TRUE,  2000),
('Ivy',     'Clark',   'ivy.clark@company.com',      '9345129876', 'Marketing', 58000, '2020-06-30', 27, 4, TRUE,  NULL),
('Jack',    'White',   'jack.white@company.com',     '9678451230', 'Finance',   67000, '2019-02-12', 39, 2, FALSE, 8000);

INSERT INTO employees 
(first_name, last_name, email, phone_number, department, salary, hire_date, age, performance_rating, is_active, bonus) VALUES
('Shray','Rana','shray.rana@company.com','8949362609','Marketing',75819,'2024-02-03',45,4,FALSE,9971),
('Tanya','Sarma','tanya.sarma@company.com','3689143761','Operations',118695,'2019-12-25',36,3,FALSE,NULL),
('Shray','Balan','shray.balan@company.com','1954995110','Marketing',75887,'2022-11-06',47,2,TRUE,NULL),
('Gokul','Shetty','gokul.shetty@company.com','4193320815','Sales',49370,'2023-10-06',27,2,FALSE,13723),
('Nehmat','Ahluwalia','nehmat.ahluwalia@company.com','0117197584','HR',88052,'2021-09-08',22,1,FALSE,NULL),
('Ahana','Das','ahana.das@company.com','1876183503','IT',96896,'2019-05-27',54,1,FALSE,7822),
('Jayant','Mangal','jayant.mangal@company.com','4475020260','Operations',114286,'2019-08-07',40,2,TRUE,NULL),
('Zain','Krishna','zain.krishna@company.com','5855215525','Operations',80851,'2021-04-11',26,4,FALSE,NULL),
('Pari','Master','pari.master@company.com','4173636333','IT',89481,'2025-08-05',31,3,TRUE,NULL),
('Alisha','Ravi','alisha.ravi@company.com','1922117988','Operations',100586,'2020-02-14',34,3,FALSE,12213);

-- select query
select * from employees;

 