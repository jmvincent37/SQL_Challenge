CREATE TABLE departments (
    dept_no VARCHAR,
	dept_name VARCHAR
);

-- Create second table and insert values
CREATE TABLE dept_emp (
    emp_no INT,
	dept_no VARCHAR
);

-- Create third table and insert values
CREATE TABLE dept_manager (
    dept_no VARCHAR,
	emp_no INT
);

-- Create fourth table and insert values
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

-- Create fifth table and insert values
CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

-- Create sixth table and insert values
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/86' AND '12/31/86'
ORDER BY employees.hire_date;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments on dept_manager.dept_no = departments.dept_no
ORDER BY dept_manager.emp_no;

--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.

SELECT dept_manager.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM dept_manager
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments on dept_manager.dept_no = departments.dept_no
ORDER BY dept_manager.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%' 
ORDER BY employees.emp_no;

--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees 
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name in ('Sales')
ORDER BY employees.emp_no;

--7. List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name in ('Sales','Development')
ORDER BY employees.emp_no;

--8. List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).
 SELECT employees.last_name, count(*) as name_count
 FROM employees
 GROUP BY employees.last_name
 ORDER BY name_count DESC;