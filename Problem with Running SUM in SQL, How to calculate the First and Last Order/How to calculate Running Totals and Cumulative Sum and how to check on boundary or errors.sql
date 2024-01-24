/*How to calculate Running Totals and Cumulative Sum and how to check on boundary or errors which may happens*/
select * from CumulativeCheck

select *, sum(cost) over(order by first_name) cumulative_sum from CumulativeCheck --the order by must be primary or no duplicate is their because 780, 780 for different cost
select *, sum(cost) over(order by first_name, last_name) cumulative_sum from CumulativeCheck --we can add more columns to fix this error.
select *, sum(cost) over(order by first_name rows between unbounded preceding and current row) cumulative_sum from CumulativeCheck -- we can fix this by this also.


