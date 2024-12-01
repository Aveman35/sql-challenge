SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM employees ORDER BY emp_no Asc;
SELECT * FROM salaries;
SELECT * FROM titles;
-----------------------------------
--Data Analysis 1:
--List the employee number, last name, first name, 	
--sex, and salary of each employee.
SELECT
e.emp_no,e.last_name,e.first_name,e.sex,
s.salary
FROM employees AS e

FULL OUTER JOIN 
salaries AS s ON e.emp_no = s.emp_no
ORDER BY emp_no ASC;
----------------------------------------------
--Data Analysis 2:
--List the first name, last name, 
--and hire date for the employees who were hired in 1986.
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';
--Alternative solution--EXTRACT function from XpertLearningAssistant
SELECT first_name,last_name,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
----------------------------------------------
--Data Analysis 3:
--List the manager of each department along 
--with their department number, department name, 
--employee number, last name, and first name.
SELECT
m.dept_no,
d.dept_name,
m.emp_no,
e.last_name,
e.first_name
FROM dept_manager AS m

INNER JOIN departments d ON m.dept_no=d.dept_no
LEFT JOIN employees e ON m.emp_no=e.emp_no; 
----------------------------------------------
--Data Analysis 4:
--List the department number for each employee 
--along with that employee’s employee number, 
--last name, first name, and department name.
SELECT
d.dept_no,
d.emp_no,
e.last_name,
e.first_name,
n.dept_name
FROM dept_emp AS d

INNER JOIN employees e ON d.emp_no=e.emp_no
LEFT JOIN departments n ON d.dept_no=n.dept_no
ORDER BY emp_no ASC;
-------------------------------------------------
--Data Analysis 5:
--List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.
SELECT first_name,last_name,sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';
-------------------------------------------------
--Data Analysis 6:
--List each employee in the Sales department, 
--including their employee number, last name, and first name.
SELECT n.dept_name,e.emp_no,e.last_name,e.first_name
FROM departments AS n

INNER JOIN dept_emp d ON n.dept_no=d.dept_no
RIGHT JOIN employees e ON d.emp_no=e.emp_no

WHERE dept_name = 'Sales';
-------------------------------------------------
--Data Analysis 7:
--List each employee in the Sales and Development 
--departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,n.dept_name
FROM departments AS n

INNER JOIN dept_emp d ON n.dept_no=d.dept_no
RIGHT JOIN employees e ON d.emp_no=e.emp_no

WHERE dept_name = 'Sales' OR dept_name = 'Development';
-------------------------------------------------
--Data Analysis 8:
--List the frequency counts, in descending order, 
--of all the employee last names (that is, 
--how many employees share each last name).
SELECT last_name, COUNT(*) AS "frequency_counts"
FROM employees
GROUP BY last_name
ORDER BY "frequency_counts" DESC;
