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

-- Retrieve start dates from retirement eligible employees
SELECT 
	EXTRACT(year FROM from_date)
	, COUNT(emp_no)
FROM mentorship_eligibility
GROUP BY EXTRACT(year FROM from_date)
ORDER BY EXTRACT(year FROM from_date);

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

-- Count total number of employees eligible for mentorship eligibility
SELECT COUNT(emp_no)
FROM mentorship_eligibility;
-- Count number of employees by title eligible for mentorship eligibility
SELECT COUNT(title), title
FROM mentorship_eligibility
GROUP BY title;


----- Additional Queries -----
-- Count start year for people in each position
SELECT 
	EXTRACT(year FROM from_date),
	COUNT(emp_no)
FROM mentorship_eligibility
GROUP BY EXTRACT(year FROM from_date)
ORDER BY EXTRACT(year FROM from_date);

-- Sum count of start year for people in each position
SELECT 
	EXTRACT(year FROM from_date), 
	SUM(COUNT(emp_no)) 
		OVER 
		(ORDER BY EXTRACT(year FROM from_date))
FROM mentorship_eligibility
GROUP BY EXTRACT(year FROM from_date)
LIMIT 5;

--# retiring w/ title manager
SELECT *
FROM unique_titles
WHERE title = 'Manager';

----- Create table with all current employee info-----
SELECT  
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
--create new table
INTO
	total_emp_info
--first table
FROM 
	employees
--second table
INNER JOIN 
	titles
--join on primary key
ON 
	employees.emp_no = titles.emp_no	

WHERE
	titles.to_date = '9999-01-01'
;

----- Count all current employees
SELECT 
COUNT(*) FROM (SELECT DISTINCT emp_no FROM titles) AS emp;


----- Find current title of all current employees
SELECT DISTINCT ON 
	(emp_no) emp_no,
	first_name,
	last_name,
	title
--add to new table
INTO unique_titles_all
FROM total_emp_info
--exclude employees who left the company
WHERE to_date = '9999-01-01'
--sort for most recent title
ORDER BY emp_no ASC, to_date DESC;




---------------------------------------------------------------------------
------------------------ADDITONAL QUERIES----------------------------------
---------------------------------------------------------------------------
----- compare count of total employees to retiring employees by title -----
SELECT 
	uta.title, 
	COUNT(uta.title) AS total_titles,
	rt.count AS retiring_titles
INTO title_count
FROM unique_titles_all AS uta
INNER JOIN retiring_titles as rt
ON uta.title=rt.title
GROUP BY uta.title, rt.count;

----- Find salaries for current employees w/ titles-----
SELECT DISTINCT ON 
	(tei.emp_no) tei.emp_no,
	ei.salary,
	tei.title
--add to new table
INTO role_pay
FROM total_emp_info as tei
INNER JOIN emp_info as ei
ON
tei.emp_no = ei.emp_no
--exclude employees who left the company
WHERE tei.to_date = '9999-01-01'
;

----- Find average salary for each title -----
select title, ROUND(AVG(salary),2) AS Salary
INTO pay_by_role
from role_pay
GROUP BY title;



----- current managers
select * 
into current_managers
from titles
WHERE title = 'Manager' 
	AND
	to_date = '9999-01-01';

----- Find other roles for mgrs
SELECT
	cm.emp_no
	, t.title AS all_titles
	, t.from_date AS title_from
	, t.to_date AS title_to
	, s.salary AS Salary
INTO
	mgr_info
FROM
	current_managers AS cm
JOIN 
	titles AS t
ON
	cm.emp_no = t.emp_no
JOIN 
	salaries as s
ON
	cm.emp_no = s.emp_no
ORDER BY
	cm.emp_no,
	t.to_date DESC
;
SELECT
	COUNT(all_titles), all_titles
FROM
	mgr_info
GROUP BY
	all_titles;
----- New possible mentors #1 - employees holding their current position since 1990
select  
	t.emp_no
	, e.first_name
	, e.last_name
	, t.title AS Current_title
	, t.from_date AS Current_from_date
INTO
	possible_mentors
from titles as t
JOIN
	employees as e
On
	t.emp_no = e.emp_no
WHERE 
	t.from_date < '1990-01-01'
	AND
	t.to_date = '9999-01-01'


----- New possible mentees - employees holding their current position since 2000
select  
	t.emp_no
	, e.first_name
	, e.last_name
	, t.title AS Current_title
	, t.from_date AS Current_from_date
INTO
	possible_mentees
from titles as t
JOIN
	employees as e
On
	t.emp_no = e.emp_no
WHERE 
	t.from_date < '2000-01-01'
	AND
	t.to_date = '9999-01-01'