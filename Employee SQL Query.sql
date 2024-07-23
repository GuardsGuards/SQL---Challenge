-- Create departments table
CREATE TABLE departments (
    dept_no TEXT PRIMARY KEY,
    dept_name TEXT NOT NULL
);

Select * from departments 

-- Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no TEXT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from dept_emp

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no TEXT,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from dept_manager

-- Create titles table
CREATE TABLE titles (
    title_id TEXT PRIMARY KEY,
    title TEXT NOT NULL
);

select * from titles

-- Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title TEXT NOT NULL,
    birth_date DATE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex TEXT NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

Select * from employees

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries

-- Analysis 1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

-- Analysis 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Analysis 3
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- Analysis 4
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no;

-- Analysis 5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Analysis 6
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Analysis 7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- Analysis 8
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

