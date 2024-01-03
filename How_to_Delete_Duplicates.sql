/* 
we have used SQL SERVER, Interview_Practice, DuplicateRemoveEmployee table.
How to delete duplicates from a table.
*/

select * from DuplicateRemoveEmployee

select first_name, last_name, count(*) as number_of_times from DuplicateRemoveEmployee group by first_name, last_name having count(*) > 1
/* fetch all duplicate records */

select * from DuplicateRemoveEmployee
order by first_name, last_name; /*here we can see a difference in employee_id so we keep the recent or greater employee_id duplicate nd remove the other one*/

delete from DuplicateRemoveEmployee where employee_id not in(
select max(employee_id) as keep_the_table from DuplicateRemoveEmployee group by first_name, last_name) /*we have used subquery to keep the selected row and remove other */


/*With window function and cte*/
CTE DuplicateRemover as
(select Employee_id, first_name, last_name, RANK() OVER(Partition by first_name, last_name order by employee_id desc) as rank from DuplicateRemoveEmployee)

delete from DuplicateRemover where Rank > 1

https://github.com/Uttam-Singh-5/SQL-Interview-Question-Practice/assets/144462640/4eff11b6-4a18-4a38-bd76-54b2b0b7b847
https://github.com/Uttam-Singh-5/SQL-Interview-Question-Practice/assets/144462640/75dcf5ca-9b68-430e-afc7-a8fea4aae02e
https://github.com/Uttam-Singh-5/SQL-Interview-Question-Practice/assets/144462640/63225ff4-82e3-44b4-aba5-7c936f1ca2d8
