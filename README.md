# Pewlett Hackard Analysis
The purpose of this analysis is to evaluate Pewlett Hackard's readiness for upcoming employee retirements. To determine this, employee status will be evaluated based on two metrics. First, the number of retiring employees by their most recent title will be determined. Second, the number of employees eligible to participate in a mentorship program will be determined.

## Results
### Retirement-Eligible Employees by Title
Employees are eligible for retirement if they were born between 1952 and 1955. None of the current employees were born before 1952. Table 1 provides a list of all employees and retirement-eligible employees by title.
- There are 72,459 employees eligible for retirement
- "Senior Engineer" and "Senior Staff" are the titles with the most retirement-eligible employees (25,916, and 24,926 employees, respectively)
- 2,293 retirement-eligible employees started their current position in 2002. This is the most recent start year for any retirement-eligible employee
- Just two employees with the title "Manager" are eligible for retirement. Both became manager in 1991.

**Table 1: Total Employees and Retiring Employees By Title**


![IMAGE](https://github.com/MDHetrick/Pewlett_Hackard_Analysis/blob/main/emp_by_title.png)

#### Engineers
- In the engineering field, there are three levels: Senior Engineer, Engineer, and Assistant Engineer
  - Of the 85,939 Senior Engineers, 25,916 are eligible for retirement
  - Of the 30,983 Engineers, 9,285 are eligible for retirement
  - Of the 3,588 Assistant Engineers, 1,090 are eligible for retirement

#### Staff
- In the "Staff" field, there are two levels: Staff and Senior Staff
  - Of the 82,024 Senior Staff, 24,926 are eligible for retirement
  - Of the 25,526 Staff, 7,636 are eligible for retirement


#### Other Job Categories
- Of the 12,055 Technique Leaders, 3,603 are eligible for retirement
  - The average technique leader salary is $48,094
- Of the 9 managers, 2 are eligible for retirement
  - The average manager salary is $59,612   

### Employees Eligible for Mentorship Program
Employees are eligible for the mentorship program if they were born in 1965
- There are 1549 employees eligible for the mentorship program
- The title with the most employees eligible is "Senior Staff" with 569 employees eligible for the program
- The "Engineer" is the title with the second most employees eligible with 501 employees eligible for the program
- 462 employees eligible for the mentorship program began have held their titles since before 1990


## Summary
**How many roles will need to be filled as the "silver tsunami" begins to make an impact?**
- There are 72,459 employees eligible for retirement, which is about 30% of the current workforce at Pewlett Hackard
- There are 240,124 people currently employed by the company, giving the company 167,666 employees if all retirement-eligible employees left at the same time.


**Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**
- Without more information about the goals and scope of the mentorship program, it is difficult to incorporate that data into the analysis. However, as there are only 1549 employees identified from this, there are not enough employees to mentor the next generation of employees. The program will need to be expanded. Currently employees are eligible if they were born in the year 1965. It is unclear why this birth year makes an employee qualified, but there are likely ways to expand eligiblity. A more inclusive way to identify participants could potentially be length of time in current position.
- To increase the number of participants, we could include anyone who has been in their current position since before 1990. After functioning in a role for at least 20 years, employees in good standing would likely be good candidates for mentorship. This change would include 18,914 employees. Table 3 provides a summary of employees in their current roles since 1990.


**Table 2: Potential Mentors by Position - Expanded**


![IMAGE](https://github.com/MDHetrick/Pewlett_Hackard_Analysis/blob/main/Emp_by_title_from1990.png)

### Additional Considerations
An important consideration for hiring of future employees is salary. While it is beneficial to consider tenure when determining salary, the level of position is also important. It may be difficult to recruit new employees and encourage current employees to take on more responsibility if the compensation package is inadquate. Table 3 provides a summary of salary by job title. A key takeaway from this data is that there is little difference in the pay of employees of different job levels. 

**Table 3: Average Salary by Job Title**


![IMAGE](https://github.com/MDHetrick/Pewlett_Hackard_Analysis/blob/main/Salary_by_title.png)


### Replacement Summary by Position Category

#### Manager
- A query was run to determine the previous roles held by employees currently employed as manager (Table 4).
  - All employees currently employed as manager held at least one role within the company prior to becoming manager.
  - Previous roles included the following: Senior Staff, Senior Engineer, Technique Leader, and Staff, with Senior Staff being the most common
  - With this information, there are many potential options for future managers.

**Table 4: Count of All Roles Held by Current Managers**


![IMAGE](https://github.com/MDHetrick/Pewlett_Hackard_Analysis/blob/main/Count_prev_mgr_roles.png)

#### Engineer
- If all the eligible senior engineers retired, there would be 60,023 senior engineers. The employees with the current title of engineer could be trained and promoted to senior engineer. 
- If all the engineers retired and the remainder (21,968 employees) were promoted to senior engineer, there would be a massive employment gap. Some of the assistant engineers could be promoted, but after retirement there would only be 2,498 remaining assistant engineers to fill those positions. Senior engineers should begin training engineers, and engineers should begin trainig assistant engineers so there is no gap in coverage.
- The company should begin recruitment activities for assistant engineers, engineers, and possibly senior engineers the current engineering staff are not desirable candidates for promotion. The average salary for a senior engineer is $48,510, $48,524 for an engineer, and $47,725 for an assistant engineer. The company may need to adjust pay scales to incentivize more responsibility. 


#### Staff
- If all the eligible senior staff retired, there would be 57,098 remaining senior staff. If the 17,890 staff members remaining after those eligible retired were eligible for transition to senior staff, there would be many openings in staff. Senior staff should begin training staff so there is no gap in coverage.
- The company should begin recruitment activities for staff, and possibly senior staff if the current staff members are not desirable candidates for promotion.
- The average staff salary is $58,327, and the average senior staff salary is $58,481. The company should consider adjusting pay scales to incentivize more responsibility


## Recommendations
- Immediately begin mentorship of all eligible employees. 
- Reevaluate pay scales of the engineer and staff career ladders.
- Begin preparing employees (both engineers and staff of all levels) to compensate for retiring employees.
- Begin recruitment activities to fill positions vacated by retiring employees and/or promoted employees.

