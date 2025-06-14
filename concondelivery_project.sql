SELECT staff_id, CONCAT(first_name," ",last_name)AS full_name, age
FROM staff_profile
WHERE staff_id != 30
ORDER BY full_name ASC;
-- 1.List all staff members with their full names and ages(NULL) --

SELECT CONCAT(first_name," ",last_name)AS full_name, salary
FROM staff_salary
ORDER BY full_name ASC;
-- 2.List the names and salaries of all staff members --

SELECT department_name
FROM department
ORDER BY department_name;
-- 3.Get the list of all department names --

SELECT CONCAT(first_name," ",last_name)AS full_name,
	occupation, department_name
FROM staff_salary AS sal
JOIN department AS dep
ON sal.dept_id = dep.department_id
ORDER BY full_name ASC;
-- 4.List staff full names, occupations, and department names --

SELECT pfl.first_name, pfl.last_name,
	age, occupation
FROM staff_profile AS pfl
JOIN staff_salary AS sal
ON pfl.staff_id = sal.staff_id
WHERE age > 40
ORDER BY pfl.first_name ASC;
-- 5.List staff who are older than 40 years, along with their occupations --

SELECT CONCAT(sal.first_name," ",sal.last_name)AS full_name,
	department_name AS department, salary
FROM staff_salary AS sal
JOIN department AS dep
ON sal.dept_id = department_id
ORDER BY salary DESC;
-- 6.List the staff with their full name, department, and salary, ordered by salary descending --

SELECT department_name,AVG(salary) AS avg_salary
FROM staff_salary sal
JOIN department dep
ON sal.dept_id = dep.department_id
GROUP BY department_name
ORDER BY avg_salary DESC
limit 1;
-- 7.Which department has the highest average salary? --

SELECT first_name, last_name, occupation
FROM staff_salary
WHERE dept_id = 3;
-- 8.List staff who work in the 'Warehouse & Inventory Management' department --

SELECT pfl.first_name, pfl.last_name, 
	age, occupation
FROM staff_profile AS pfl
JOIN staff_salary AS sal
ON pfl.staff_id = sal.staff_id
WHERE age IN
	(SELECT MIN(age)
    FROM staff_profile) OR 
	age IN
    (SELECT MAX(age) 
    FROM staff_profile);
-- 9.Find the youngest and oldest staff members with their age and role --

SELECT department_name, COUNT(staff_id) AS count_staff
FROM staff_salary AS sal
JOIN department AS dep
ON sal.dept_id = dep.department_id
GROUP BY department_name;
-- 10.Count how many staff are in each department --

SELECT first_name,last_name, department_name, salary
FROM staff_salary AS sal1
JOIN department dep
ON sal1.dept_id = dep.department_id
WHERE salary = (
		SELECT MAX(salary)
        FROM staff_salary AS sal2
        WHERE sal1.dept_id = sal2.dept_id)
;
-- 11.Find the staff member with the highest salary in each department --

SELECT *, dep.department_name, AVG(sal.salary) AS avg_dep_salary
FROM staff_salary sal
JOIN department dep
ON sal.dept_id = dep.department_id
GROUP BY sal.dept_id
HAVING sal.salary > (SELECT AVG(salary) FROM staff_salary);

-- 12.List departments where the average salary is above the overall company average.

SELECT *
FROM staff_salary
WHERE salary = (SELECT MAX(salary)
		FROM staff_salary
		WHERE salary < (SELECT MAX(salary) FROM staff_salary));
-- 13.Find the second-highest salary in the organization and the staff who earns it. --

SELECT AVG(salary)
FROM staff_salary;

SELECT *
FROM staff_salary sal1
WHERE sal1.salary > (SELECT AVG(salary)
FROM staff_salary sal2
WHERE sal1.dept_id = sal2.dept_id )
GROUP BY dept_id;

-- 14.List staff who earn more than the average salary of their department --

SELECT *
FROM (Select dept_id,count(dept_id) as staff_count,department_name
from staff_salary as ss
Join department as dp
On ss.dept_id=dp.department_id
group by dept_id) AS morethan_2staffmembers
WHERE staff_count > 2;

-- 15.Find departments that have more than 2 staff members --





