/*
We have used the sql server, Interview Practice database and EmployeesSalary Table
How to find nth highest salary.
Images for clarity and visualizing: https://prnt.sc/X4JWoSNJBBiM, https://prnt.sc/dUvI5G4n7Y6d, https://prnt.sc/ISiym62vhHES, https://prnt.sc/Ph9a38tYovBF
*/
select * from EmployeesSalary;

/*Using Rank or DenseRank window function*/
With Salary_CTE as
(select employee_id, first_name, last_name, salary, Dense_Rank() over(order by salary desc) nth_salary from EmployeesSalary)
select * from Salary_CTE where nth_salary = (2)


/*Using Subquery*/
select * from EmployeesSalary where salary = 
(select max(salary) from EmployeesSalary); /* this is for first value the top most salary and for 2nd, 3rd.... check out below code*/

select top 1 * from EmployeesSalary where salary < 
(select max(salary) from EmployeesSalary)
Order by salary desc;

select top 1 * from (select top 3 * from EmployeesSalary order by salary desc) as position order by salary; /*3rd position*/

select top 1 * from (select top 4 * from EmployeesSalary order by salary desc) as position order by salary; /*4th position*/

select top 1 * from (select top 5 * from EmployeesSalary order by salary desc) as position order by salary; /*5th position*/

select * from EmployeesSalary;
