-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees AS e 
JOIN salaries AS s 
USING(emp_no);


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name,
    last_name,
    hire_date
FROM employees 
WHERE  EXTRACT('year' FROM hire_date) = '1986';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
    dept_manager.dept_no,
    dept_name,
	employees.emp_no,
	last_name,
    first_name
FROM departments 
LEFT JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- OR 

SELECT 
	last_name,
    first_name,
    dept_name,
	employees.emp_no,
	dept_manager.dept_no
FROM departments 
LEFT JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
	dept_manager.dept_no,
	employees.emp_no,
	last_name,
    first_name,
    dept_name
FROM departments 
LEFT JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE  first_name = 'Hercules' AND last_name LIKE '%B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
	dept_manager.dept_no,
	dept_name,
	employees.emp_no,
	last_name,
    first_name
FROM departments 
LEFT JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_name='Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	dept_manager.dept_no,
	employees.emp_no,
	last_name,
    first_name,
	dept_name
FROM departments 
LEFT JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_name='Sales' OR dept_name='Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name 
ORDER BY count DESC;