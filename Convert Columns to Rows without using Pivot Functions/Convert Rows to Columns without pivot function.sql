/*We are using Interview_Practice database and RowsToColumns table
Convert Rows to Columns and Columns to Rows without using Pivot Functions
*/
select * from RowsToColumns;
/*Row to column*/
select employee_id,
sum(case when salary_component_type = 'salary' then value end) as salary
,sum(case when salary_component_type = 'Bonus' then value end) as bonus
,sum(case when salary_component_type = 'hike_percentage' then value end) as hike_percent
from RowsToColumns
group by employee_id


