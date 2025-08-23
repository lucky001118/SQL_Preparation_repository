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
-- 19.	Find top 5 oldest employees with bonus not null.
-- 20.	Find employees whose name starts with ‘A’ and ends with ‘a’.
-- 21.	Find employees with hire_date = earliest in company.
-- 22.	Find employees whose salary = max salary in Marketing.
-- 23.	Find all departments and number of employees in them.
-- 24.	Find employees with duplicate first names.
-- 25.	Find employees with salary > company’s overall avg salary.
-- 26.	Find top 3 employees by performance rating and salary.
-- 27.	Find employees with salary > 1 lakh OR bonus > 10000.
-- 28.	Find employees in IT where bonus is null.
-- 29.	Find employees grouped by age range (20s,30s,40s).
-- 30.	Find employees active in HR with salary > 60000.
-- 31.	Find employees inactive but still have rating >= 4.
-- 32.	Find 5 most recently hired employees in Finance.
-- 33.	Find departments sorted by avg salary DESC.
-- 34.	Find employees with total salary > ALL employees in Sales.
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
