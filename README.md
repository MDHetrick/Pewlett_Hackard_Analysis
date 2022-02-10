# Pewlett Hackard Analysis
The purpose of this analysis is to evaluate employee status based on two metrics. First, the number of retiring employees by their most recent title will be determined. Second, the number of employees eligible to participate in a mentorship program will be determined.

## Results
### Retirement-Eligible Employees by Title
Employees are eligible for retirement if they were born between 1952 and 1955. No current employees were born before 1952
- There are employees eligible for retirement
- "Senior Engineer" and "Senior Staff" are the titles with the most retirement-eligible employees (25916, and 24926 employees, respectively)
- 2293 retirement-eligible employees started their current position in 2002. This is the most recent start year for any retirement-eligible employee
- Just two employees with the title "Manager" are eligible for retirement. Both became manager in 1991
### Employees Eligible for Mentorship Program
Employees are eligible for the mentorship program if they were born in 1965
- There are 1549 employees eligible for the mentorship program
- The title with the most employees eligible is "Senior Staff" with 569 employees eligible for the program
- The "Engineer" is the title with the second most employees eligible with 501 employees eligible for the program
- 462 employees eligible for the mentorship program began have held their titles since before 1990
## Summary
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
  - There are 33,119 current employees in the current_emp table
  - There are 90,328 unique employee IDs in the retirement_titles table
  - There are 72,458 unique employee IDs in the unique_titles table
  - There are 72,459 employees in the retiring_titles table
