----- Create retirement_info table-----
--retrieve emp_no, first_name, last name columns from employees table
--retrieve title, from_date, to_date from titles table
SELECT  
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
--create new table
INTO 
	retirement_titles
--first table
FROM 
	employees
--second table
INNER JOIN 
	titles
--join on primary key
ON 
	employees.emp_no = titles.emp_no	
-- Filter by birth date to retrieve employees born between 1952 and 1955
WHERE 
	(employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--order by employee number
ORDER BY 
	employees.emp_no;

-----Unique Titles-----
--Retrieve employee numbers, firstname, last name, title from retirement titles
SELECT DISTINCT ON 
	(emp_no) emp_no,
	first_name,
	last_name,
	title
--add to new table
INTO unique_titles
FROM retirement_titles
--exclude employees who left the company
WHERE to_date = '9999-01-01'
--sort for most recent title
ORDER BY emp_no ASC, to_date DESC;



-----Retiring Titles-----
-- retrieve the number of titles from the Unique Titles table
SELECT COUNT(title), title 

-- create a Retiring Titles table to hold the required information
INTO retiring_titles
FROM unique_titles

-- Group the table by title, then sort the count column in descending order
GROUP BY title
ORDER BY COUNT(title) DESC;

-----Mentorship Eligibility-----
--retrieve from_date and to_date from department employee table
--retrieve emp_no, first_name, last_name, birth_date columns from employees table
SELECT DISTINCT ON (emp_no)
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	titles.title

-- add to new table
INTO 
	mentorship_eligibility
FROM 
	employees as e

-- join on primary key
INNER JOIN
	dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN
	titles ON e.emp_no = titles.emp_no

-- filter data on to_date to all current employees
WHERE 
	de.to_date = '9999-01-01'
	AND
-- filter data on birth date to get all employees with birth date bt '1965-01-01' and '1965-12-31'
	e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY
	emp_no ASC;