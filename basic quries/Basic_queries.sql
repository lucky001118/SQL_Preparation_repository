--        ***** SELECT QUERIES *****
-- 1. Select all columns from employees.
select * from employees;

-- 2.	Select only first_name, last_name, and department.
select first_name, last_name, department from employees;

-- 3.	Select first_name and salary of all employees.
select first_name, salary from employees;

-- 4.	Select unique department names.
select distinct department from employees;

-- 5.	Select all employees but display only first 5 rows.
select * from employees limit 5;

-- 6.	Select emp_id and email of all employees.
select emp_id , email from employees;

-- 7.	Select employees who have a bonus.
select * from employees where bonus > 0 ; 

-- 8.	Select employees whose is_active = TRUE.
select concat(" ",first_name,last_name) As Full_name from employees where is_active = TRUE;

-- 9.	Select all employees hired after 2020-01-01.
select concat(" ",first_name,last_name) As Full_Name , hire_date from employees where hire_date > '2020-01-01';

-- 10.	Select employees with a performance rating of 5. 
select * from employees where performance_rating = 5;


--        ***** WHERE QUERIES *****
-- 1.	Get employees with salary greater than 80000.
select * from employees where salary>80000;

-- 2.	Find employees from IT department.
select * from employees where department = 'IT';

-- 3.	Find employees older than 40.
select * from employees where age>40;

-- 4.	Find employees hired before 2020-01-01.
select * from employees where hire_date<'2020-01-01';

-- 5.	Find employees whose bonus is NULL.
select * from employees where bonus is Null;

-- 6.	Find employees with age = 30.
select * from employees where age = 30;

-- 7.	Find employees not active.
select * from employees where is_active = FALSE;

-- 8.	Find employees with performance rating less than 3.
select * from employees where performance_rating<3;

-- 9.	Find employees who belong to HR department and are active.
select * from employees where department='HR' and is_active = TRUE;

-- 10.	Find employees with salary not equal to 50000.
select * from employees where salary != 50000;


--        ***** AND, OR, NOT QUERIES *****
-- 1.	Employees in IT and salary above 70000.
select * from employees where department = 'IT' and salary>70000;

-- 2.	Employees in Finance or Marketing.
select * from employees where department = 'Finance' or department = 'Marketing';

-- 3.	Employees age between 30–40 and salary > 60000.
select * from employees where age>30 and age<40 and salary > 60000;

-- 4.	Employees with rating = 5 or bonus > 10000.
select * from employees where performance_rating = 5 or bonus > 10000;

-- 5.	Employees not in Sales department.
select * from employees where not department = 'Sales';

-- 6.	Employees who are active and not in HR.
select * from employees where is_active = TRUE and not department = 'HR';

-- 7.	Employees with bonus not null and salary > 60000.
select * from employees where bonus is not null and salary > 60000;

-- 8.	Employees in IT or Finance with age < 35.
select * from employees where department = 'IT' or department = 'Finance' and age>35;

-- 9.	Employees who are active and rating >= 4.
select * from employees where is_active = TRUE and performance_rating >= 4;

-- 10.	Employees who are not active or salary < 50000.
select * from employees where is_active = FALSE or salary < 50000;


--        ***** ORDER BY QUERIES *****
-- 1.	List employees ordered by salary ASC
select * from employees ORDER BY salary;

-- 2.	List employees ordered by salary DESC.
select * from employees ORDER BY salary DESC;

-- 3.	List employees ordered by age.
select * from employees ORDER BY age;

-- 4.	List employees ordered by hire_date DESC.
select * from employees ORDER BY hire_date DESC;

-- 5.	Order employees by department, then salary DESC.
select * from employees ORDER BY department , salary DESC;

-- 6.	Order employees by rating DESC.
-- 7.	Order employees by last_name.

-- 8.	Order employees by bonus, NULLs last.
select * from employees ORDER BY bonus is NULL, bonus ASC;
-- select * from employees ORDER BY Bonus ASC NULLs LAST; 

-- 9.	 Order employees by department and first_name.
select * from employees ORDER By department, first_name ASC;

-- 10.	Order employees by created_at.
select * from employees ORDER By created_at;


--        ***** LIMIT QUERIES *****
-- 1.	Get top 5 highest paid employees.
select * from employees order by salary DESC LIMIT 5;

-- 2.	Get 10 youngest employees.
select * from employees ORDER BY age ASC LIMIT 10;

-- 3.	Get 3 most recently hired employees.
select * from employees ORDER BY hire_date DESC LIMIT 3;

-- 4.	Get 5 lowest salary employees.
select * from employees ORDER BY salary ASC LIMIT 5;

-- 5.	Get first 10 employees.
select * from employees Limit 10;

-- 6.	Get top 1 highest salary employee.
select * from employees ORDER by salary desc limit 1;

-- 7.	Get last 2 hired employees.
select * from employees ORDER BY hire_date Desc limit 2;

-- 8.	Get top 5 oldest employees.
select * from employees ORDER BY age DESC LIMIT 5;

-- 9.	Get 7 employees from Finance.
select * from employees where department = 'Finance' LIMIT 7;

-- 10.	Get top 3 employees by rating.
select concat(first_name,' ',last_name) AS fullname, email, phone_number, department, age, performance_rating from employees ORDER BY performance_rating DESC LIMIT 3;


--        ***** MIN, MAX, COUNT, AVG, SUM QUERIES *****
-- 1.	Find minimum salary.
select MIN(salary) AS minimum_salary from employees;

-- 2.	Find maximum salary.
select MAX(salary) AS maximum_salary from employees;

-- 3.	Find average salary.
select AVG(salary) as Avarage_Salary from employees;

-- 4.	Find total salary expense.
select SUM(salary) AS Total_Salary_Expense from employees;

-- 5.	Find number of employees.
select COUNT(emp_id) AS Total_Employees from employees;

-- 6.	Find number of employees in IT.
select COUNT(department) AS Employees_IN_IT from employees where department = 'IT';

-- 7.	Find max bonus.
select MAX(bonus) AS maximum_bonus from employees;

-- 8.	Find min age.
select MIN(age) from employees;

-- 9.	Find avg performance rating.
select AVG(performance_Rating) from employees;

-- 10.	Find sum of all bonuses (ignoring NULL).
select SUM(bonus) from employees where bonus is not null;


--        ***** LIKE, Wildcards QUERIES *****
-- 1.	Find employees whose first name starts with A.
select * from employees where first_name LIKE 'A%';

-- 2.	Find employees whose last name ends with n.
select * from employees where last_name LIKE '%n';

-- 3.	Find employees whose email contains hr.
select * from employees where email LIKE '%hr%';

-- 4.	Find employees whose phone starts with 98.
select * from employees where phone_number LIKE '98%';

-- 5.	Find employees with last name length 5.
select * from employees where last_name Like '_____';

-- 6.	Find employees whose email ends with @company.com.
select * from employees where email LIKE '%@company.com';

-- 7.	Find employees with first name containing sh.
select * from employees where first_name LIKE '%sh%';

-- 8.	Find employees whose last name contains double letters (ll, ss).
select * from employees where last_name LIKE '%ll%' or last_name LIKE '%ss%';

-- 9.	Find employees whose first name ends with a.
select * from employees where first_name LIKE '%a';

-- 10.	Find employees whose phone number contains 123.
select * from employees where phone_number LIKE '%123%'; 


--        ***** IN, BETWEEN QUERIES *****
-- 1.	Employees in departments IT, HR, Finance.
select * from employees where department IN ('IT','HR');

-- 2.	Employees not in Sales or Support.
select * from employees where department not in ('Sales', 'Support');

-- 3.	Employees with salary between 50000 and 80000.
select * from employees where salary BETWEEN 50000 AND 80000;

-- 4.	Employees hired between 2020 and 2022.
select * from employees where hire_date BETWEEN '2020-01-01' AND '2022-01-01';

-- 5.	Employees with age between 25 and 35.
select * from employees where age BETWEEN 25 AND 35;

-- 6.	Employees with rating in (4,5).
select * from employees where performance_rating IN (4,5);

-- 7.	Employees with bonus in (2000,5000,10000).
select * from employees where bonus IN (2000,5000,10000);

-- 8.	Employees with salary not between 60000 and 100000.
select * from employees where salary not BETWEEN 60000 AND 100000;

-- 9.	Employees with emp_id in (1,5,10).
select * from employees where emp_id IN (1,5,10);

-- 10.	Employees with hire_date between 2019-01-01 and 2020-12-31.
select * from employees where hire_date BETWEEN '2019-01-01' AND '2020-12-31';


--        ***** AS (Alias) QUERIES *****
-- 1.	Display full name as employee_name.
-- 2.	Display salary as monthly_salary.
-- 3.	Display bonus as incentive.
-- 4.	Display department as dept.
-- 5.	Display age as years_old.
-- 6.	Display rating as perf_score.
-- 7.	Display total salary (salary+bonus) as total_package.
select concat(first_name,' ',last_name) as Full_Name, salary, bonus, (Salary + IFNULL(Bonus, 0)) as Total_Package from employees;
-- 8.	Display hire_date as joined_on.
-- 9.	Display phone_number as mobile.
-- 10.	Display is_active as status.


--        ***** HAVING QUERIES *****
-- 1.	Find departments with more than and equal 3 employees.
select department, COUNT(*) As Total_employee from employees group by department having COUNT(*) >= 3;

-- 2.	Find departments with avg salary > 80000.
select department, AVG(salary) AS AVG_Salary from employees group by department Having AVG(salary) > 80000;

-- 3.	Find departments with sum salary > 300000.
select department, SUM(salary) AS SUM_OF_SALARY from employees group by department Having SUM(salary) > 400000;

-- 4.	Find departments with min salary > 40000.
select department, MIN(salary) as MIN_Salary from employees GROUP BY department Having MIN(salary) > 40000;

-- 5.	Find departments with max bonus > 10000.
select department, MAX(bonus) AS MAXIMUM_BONUS from employees GROUP BY department Having MAX(bonus) > 10000;

-- 6.	Find departments with avg age < 30.
select department , AVG(age) AS Avarage_Age from employees group by department Having avg(age) < 30 ;

-- 7.	Find departments having inactive employees count > 2.
select department, count(*) as Inactive_Employees from employees group by department Having count(is_active) > 2;

-- 8.	Find departments where avg rating >= 3.
select department, AVG(performance_rating) AS Avarage_Rating from employees group by department Having avg(performance_rating) >= 3;

-- 9.	Find departments with more than 3 employees hired after 2020.
select department, Count(*) AS Total_Employees from employees WHERE Hire_Date > '2020-01-01' group by department Having count(*) > 3;

-- 10.	Find departments with total bonus > 20000.
select department, Sum(bonus) AS TOtal_Bonus from employees group by department Having SUM(bonus) > 20000;

--        ***** CASE QUERIES *****
-- 1.	Label salary as High, Medium, Low.
select concat(first_name, ' ',last_name) as Full_Name, salary, department,
	CASE
		WHEN salary >= 100000 THEN 'High' 
		WHEN salary >= 60000 and salary < 100000 THEN 'Medium' 
		WHEN salary<60000 THEN 'Low' 
	END AS Salary_Label 
 from employees; 
 
-- 2.	Label age group (Young, Mid, Senior).
select concat(first_name, ' ',last_name) as Full_Name, salary, department, age ,
	CASE
		WHEN age>=50 THEN 'Senior'
        WHEN age<50 and age>=40 THEN 'Mid'
        WHEN age<40 and age>=18 THEN 'Young'
	END as Age_Label
from employees;

-- 3.	Label bonus (No Bonus, Low Bonus, High Bonus).
select concat(first_name, ' ',last_name) as Full_Name, salary, department, age , bonus,
	CASE
		WHEN bonus>=20000 THEN 'Hight Bonus'
        WHEN bonus<20000 and bonus>=1000 THEN 'Low Bonus'
        WHEN bonus is Null THEN 'No Bonus'
	END as Bonus_Label
from employees;

-- 4.	Label rating (Excellent, Good, Poor, Avarage).
select concat(first_name, ' ',last_name) as Full_Name, salary, department, age , performance_rating,
	CASE
		WHEN performance_rating>=4 THEN 'Excellent'
        WHEN performance_rating<4 and performance_rating>=3 THEN 'Good'
        WHEN performance_rating<3 and performance_rating>=1 THEN 'Avarage'
        When performance_rating is Null then 'Poor'
	END as RAting_Label
from employees;

-- 5.	Label is_active (Active, Inactive).
select concat(first_name, ' ',last_name) as Full_Name, salary, department, age , is_active,
	CASE
		WHEN is_active=TRUE THEN 'ACTIVE'
        ELSE 'INACTIVE'
	END as Activ_Label
from employees;

-- 6.	Label department (Tech if IT/Support, Non-Tech otherwise).
select concat(first_name, ' ',last_name) as Full_Name, salary, department, age , is_active,
	CASE
		WHEN department='IT' or department='Support' THEN 'Tech'
        ELSE 'Non-Tech'
	END as Department_Label
from employees;

-- 7.	Label salary as Above Avg or Below Avg.
-- 8.	Label employees as New if hire_date > 2022, else Old.

-- 9.	Label employees as Eligible for Promotion if rating=4 & salary>80000.
select concat(first_name, ' ',last_name) as Full_Name, salary, department, age , performance_rating,
	CASE
		WHEN performance_rating=4 and salary>80000 THEN 'Eligible'
        Else 'Not Eligible'
	END as Promotion_Label
from employees;

-- 10.	Label employees as Experienced if age > 40.
select concat(first_name, ' ',last_name) as Full_Name, salary, department, age , performance_rating,
	CASE
		WHEN age>40 THEN 'Experienced'
        Else 'Not Experienced'
	END as Experienc_Label
from employees;


--        ***** NULL FUNCTIONS QUERIES *****
-- 1.	Replace null bonus with 0.
select emp_id , first_name, (0 + IFNULL(bonus,0)) as bonus from employees;

-- 2.	Show total salary with bonus replaced by 0.
select emp_id , salary, bonus, first_name, (salary + IFNULL(bonus,0)) as Total_Salary from employees;

-- 3.	Count employees with bonus IS NULL.
select bonus, COUNT(0 + IFNULL(bonus,0)) AS Count_Bonus from employees where bonus is null group by bonus;

-- 4.	Count employees with bonus IS NOT NULL.
select bonus, COUNT(0 + IFNULL(bonus,0)) AS Count_Bonus from employees where bonus is not null group by bonus;

-- 5.	Use IFNULL(bonus, 1000) to display bonus.
select first_name,  (0 + IFNULL(bonus,1000)) AS bonus from employees;

-- 6.	Use COALESCE(bonus, salary*0.1) for bonus.
select concat(first_name,' ',last_name) as Full_Name, bonus, salary, coalesce(bonus,salary*0.1) as New_Bonus from employees;

-- 7.	List employees with no bonus.
-- 8.	Add 2000 bonus if null.alter
select concat(first_name,' ',last_name) as Full_Name, bonus, salary, coalesce(bonus,2000) as New_Bonus from employees;

-- 9.	Show employees with null phone number (if any).
-- 10.	Use NULLIF(salary, 50000) to avoid duplicates.


--        ***** Operators QUERIES *****
-- 1.	Employees with salary + bonus > 90000.
select * from employees where (salary + IFNULL(bonus,0)) > 90000;

-- 2.	Employees with salary - bonus < 60000.
select * from employees where (salary - IFNULL(bonus,0)) > 60000;

-- 3.	Employees with age * rating > 150.
select * from employees where age*performance_rating > 150; 

-- 4.	Employees with salary / 12 as monthly pay.
-- 5.	Employees with bonus % 2000 = 0.
-- 6.	Employees where salary + IFNULL(bonus,0) > 1 lakh.
-- 7.	Employees with age + 10 > 50.

-- 8.	Employees with salary - 10000 between 50000 and 80000.
select * from employees where salary - 10000 between 50000 and 80000; 

-- 9.	Employees with bonus * 2 > 15000.
-- 10.	Employees with salary/1000 > rating * 100.
