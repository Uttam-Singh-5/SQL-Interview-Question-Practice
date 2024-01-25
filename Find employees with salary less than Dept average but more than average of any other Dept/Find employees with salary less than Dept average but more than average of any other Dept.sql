/*Find employees with salary less than Dept average but more than average of any other Dept*/
select * from SalarythanDepartment;
-- We have fetched employees with salary less than Dept average
with department_avgsalary as (select department, cast(avg(salary) as float) average from SalarythanDepartment group by department) 
select * from department_avgsalary join SalarythanDepartment on 
department_avgsalary.average > SalarythanDepartment.salary and department_avgsalary.department = SalarythanDepartment.department

-- We have fetched employees with salary less than Dept average but more than average of any other Dept
with department_avgsalary as (select department, cast(avg(salary) as float) average from SalarythanDepartment group by department) 
SELECT emp.*, other_dept_avg.department
FROM SalarythanDepartment emp
JOIN department_avgsalary own_dept_avg ON emp.department = own_dept_avg.department
JOIN department_avgsalary other_dept_avg ON emp.department <> other_dept_avg.department
WHERE emp.salary < own_dept_avg.average AND emp.salary > other_dept_avg.average;

