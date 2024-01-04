/*We are using Interview_Practice database and ColumnsToRows table
Convert Columns to Rows without using Pivot Functions
*/
select * from ColumnsToRows;

select employee_id, 'salary' as salary_component_type, value = salary from ColumnsToRows  
union all
select employee_id, 'bonus' as salary_component_type, value = bonus from ColumnsToRows 
union all
select employee_id, 'hike_percent' as salary_component_type, value = hike_percent from ColumnsToRows order by employee_id 




/* We should use single dots ' ' because we have to consider it like a string
select employee_id, salary as salary_component_type, value = salary from ColumnsToRows  
union all
select employee_id, bonus as salary_component_type, value = bonus from ColumnsToRows 
union all
select employee_id, hike_percent as salary_component_type, value = hike_percent from ColumnsToRows order by employee_id 
*/