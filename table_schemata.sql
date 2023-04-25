-- Create first table and insert values
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