/*How to calculate YTD*/
select * from YeartoDate

select *, sum(totalamount) over(Partition by Year(orderdate) order by orderdate) as YTD from YeartoDate
select *, sum(totalamount) over(Partition by Year(orderdate) order by orderdate rows between unbounded preceding and current row) as YTD from YeartoDate
-- rows between unbounded preceding and current row

/*How to calculate the First and Last Order*/
select *, First_value(totalamount) over(Partition by Year(orderdate) order by orderdate rows between unbounded preceding and current row) as FirstOrder,
Last_value(totalamount) over(Partition by Year(orderdate) order by orderdate rows between current row and unbounded following) as LastOrder from YeartoDate


	


	
