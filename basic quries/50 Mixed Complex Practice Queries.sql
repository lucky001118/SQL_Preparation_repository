--                         *****  🔹 50 Mixed Complex Practice Queries *****
select * from employees where department = 'IT';

-- 1.	Find top 5 highest salary employees from IT department.
select * from employees 
	where department='IT' order by salary desc limit 5;

-- 2.	Find avg salary of employees hired after 2020 grouped by department.
select department, AVG(salary) as Avarage_Salary_Of_Employee_Department from employees 
	where hire_date > '2020-12-31' group by department;
    
-- 3.	Find employees with salary > avg salary of Finance dept.
SELECT 
    emp_id, first_name, last_name, salary, department
FROM employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department = 'Finance'
);

-- 4.	Find employees who don’t belong to HR or IT but earn > 70000.
select emp_id, first_name, last_name, salary, department 
	from employees 
		where department not in ('HR','IT') and salary > 70000;
        
-- 5.	Find departments with total salary > 50000 and avg rating > 3.
select department, count(department) as total_employee_department_vise, avg(performance_rating) as avg_rating
from employees
	where salary > 50000 group by department 
		having avg(performance_rating) > 3;
-- or
select  department, count(department) as total_employee_department_vise, avg(performance_rating) as avg_rating
from employees 
	where salary > 50000 and (select avg(performance_rating) from employees) > 3.0 group by department;
    
-- 6.	Find employees whose bonus is null but salary > 80000.
select concat(first_name,' ',last_name) as Full_Name, department, age, email, salary, bonus, phone_number, hire_date
from employees
	where bonus is null and salary > 80000;
    
-- 7.	Find 3 employees with highest bonus.
select concat(first_name,' ',last_name) as Full_Name, department, age, email, salary, bonus, phone_number, hire_date
from employees 
	order by bonus desc limit 3;

-- 8.	Find employees older than avg age of Marketing dept.
select concat(first_name,' ',last_name) as Full_Name, department, age, email, salary, bonus, phone_number, hire_date 
from employees 
	where department = 'Marketing' and age > (select avg(age) from employees);
-- select * from employees where department = 'Marketing' and age>35.7500;      -- to verify above query

-- 9.	Find employees with salary > ALL employees in HR.
select concat(first_name,' ',last_name) as Full_Name, department, age, email, salary, bonus, phone_number, hire_date
from employees
	where salary > (select sum(salary + ifnull(salary,0) ) from employees where department = 'HR');
    
-- 10.	Find employees hired before ANY employee in IT.
select concat(first_name,' ',last_name) as Full_name, hire_date, department 
from employees 
	where department != 'HR' 
		and hire_date < (select hire_date from employees where department = 'IT' order by hire_date asc limit 1);
    
-- 11.	Find youngest employee in each department.
select concat(first_name,' ',last_name) as full_name, department, age, salary
from employees e
	where age = (select min(age) from employees where department = e.department);
    
-- 12.	Find highest paid employee per department.
select concat(first_name,' ',last_name) as full_name, department, age, salary
from employees e
	where salary = (select max(salary) from employees where department = e.department) order by salary desc;
    
-- 13.	Find departments with more than 4 employees.
select department, count(department) as count
from employees 
	 group by department having count(department) >= 4;
     
-- 14.	Find employees who are inactive but bonus > 5000.
select concat(first_name,' ',last_name) as full_name, department, age, salary, bonus
from employees
	where is_active=FALSE and bonus > 5000;
    
-- 15.	Find employees whose phone starts with 98 and salary > 50000.
select concat(first_name,' ',last_name) as full_name, department, age, salary, bonus, phone_number
from employees
	where phone_number like '98%' and salary > 50000;
    
-- 16.	Find employees who joined between 2018–2020 with rating > 3.
select concat(first_name,' ',last_name) as full_name, department, age, salary, bonus, phone_number, hire_date, performance_rating
from employees
	where performance_rating>3 between '2018-01-01' and '2020-01-01';
    
-- 17.	Find employees whose total salary (salary+bonus) is highest.
select concat(first_name,' ',last_name) as full_name, department, age, salary, bonus, phone_number, hire_date, performance_rating, (salary+ifnull(bonus,0)) as total_salary
from employees 
	order by (salary+ifnull(bonus,0)) desc limit 3;
    
-- 18.	Find employees grouped by department where avg bonus > 5000.
select department, avg(bonus) as Avarage_bonus, count(department) as Total_employee
from employees 
	group by department 
    having avg(bonus) > 5000;
    
-- 19.	Find top 5 oldest employees with bonus not null.
select concat(first_name,' ',last_name) as full_name, department, salary, email, age
from employees
	where bonus is not null 
    order by age desc limit 5;
    
-- 20.	Find employees whose name starts with ‘A’ and ends with ‘s’.
select concat(first_name,' ',last_name) as full_name, department, salary, email, age
from employees
	where first_name like 'A%' and last_name like '%s';
    -- if wants to first name start with 'A' and first name also ends with 'a' then
select first_name, department, salary, email, age
from employees
	where first_name like 'A%a';
    
-- 21.	Find employees with hire_date = earliest in company.
select concat(first_name,' ',last_name) as full_name, department, salary, email, age , hire_date
from employees
order by hire_date asc limit 6;

-- 22.	Find employees whose salary = max salary in Marketing.
select concat(first_name,' ',last_name) as full_name, department, salary, email, age , hire_date
from employees
where department = 'Marketing' and salary = (select max(salary) from employees where department = 'Marketing');

-- 23.	Find all departments and number of employees in them.
select department, count(department) As Number_of_Employees 
from employees
group by department;

-- 24.	Find employees with duplicate first names.
select first_name , count(first_name) as duplicate_name_count 
from employees
group by first_name having count(first_name) > 1;

-- 25.	Find employees with salary > company’s overall avg salary.
select concat(first_name, ' ', last_name) as Full_Name, salary, department
from employees 
where salary >= (select avg(salary) as salary from employees) ;

select avg(salary) from employees;

-- 26.	Find top 3 employees by performance rating and salary.
select concat(first_name,' ',last_name) as full_name, department, salary, performance_rating, email, age , hire_date
from employees
order by performance_rating desc , salary desc limit 3;

-- 27.	Find employees with salary > 1 lakh OR bonus > 10000.
select concat(first_name,' ',last_name) as full_name, department, salary, bonus, performance_rating, email, age , hire_date
from employees 
where salary >= 100000 or bonus >= 10000
order by salary desc, bonus desc;

-- 28.	Find employees in IT where bonus is null.
select concat(first_name,' ',last_name) as full_name, department, salary, bonus, performance_rating, email, age , hire_date
from employees 
where department = 'IT' and bonus is null;

-- 29.	Find employees grouped by age range (20s,30s,40s).
select concat(first_name,' ',last_name) as full_name, department, salary, bonus, performance_rating, email, age ,
CASE
	WHEN age>=20 and age<30 THEN '20s'
    WHEN age >=30 and age<40 THEN '30s' 
    WHEN age >=40 and age<50 THEN '40s'
    WHEN age>=50 THEN 'Super Seniour'
END as Age_Group
from employees 
order by age asc;

-- 30.	Find employees active in HR with salary > 60000.
select concat(first_name,' ',last_name) as full_name, department, salary, bonus, performance_rating, email, age,
CASE
	WHEN is_active=TRUE THEN 'Active'
    ELSE 'Not Active'
END as Availability
from employees
where department = 'HR' and salary>60000 and is_active=TRUE; 

-- 31.	Find employees inactive but still have rating >= 4.
select concat(first_name,' ',last_name) as full_name, department, salary, bonus, performance_rating, email, age, is_active,
CASE
	WHEN is_active=TRUE THEN 'Active'
    ELSE 'Not Active'
END as Availability
from employees
where is_active=FALSE and performance_rating>=4;

-- 32.	Find 5 most recently hired employees in Finance.
select concat(first_name,' ',last_name) as full_name, department, hire_date, salary, bonus, performance_rating, email, age, is_active
from employees 
where department='Finance'
order by hire_date desc limit 5;

-- 33.	Find departments sorted by avg salary DESC.
select department, avg(salary) as Avarage_Salary
from employees
group by department
order by avg(salary) desc;

-- 34.	Find employees with total salary > ALL employees in Sales.
select concat(first_name,' ',last_name) as full_name, department, hire_date, salary, bonus, performance_rating, email, age, is_active
from employees as e
where salary + ifnull(bonus,0) > (select sum(salary) from employees where department='Sales');

-- 35.	Find employees older than 50 and salary < avg salary.
-- 36.	Find employees where email contains dept name.
-- 37.	Find employees with bonus null but rating = 5.
-- 38.	Find employees with emp_id in top 10 but ordered by salary.
-- 39.	Find count of employees per department hired after 2021.
-- 40.	Find employees whose salary is between 2nd highest and 5th highest salary.
-- 41.	Find employees grouped by is_active and avg salary.
-- 42.	Find employees with no bonus but highest rating.
-- 43.	Find employees with phone number containing ‘1234’.
-- 44.	Find employees whose salary is exactly avg salary of company.
-- 45.	Find employees grouped by dept where max age < 40.
-- 46.	Find employees where salary + bonus = max(salary+bonus).
-- 47.	Find employees hired in same year as emp_id=10.
-- 48.	Find employees whose first_name length > 6.
-- 49.	Find employees with salary > 80000 ordered by hire_date.
-- 50.	Find employees where bonus > avg bonus of company.
