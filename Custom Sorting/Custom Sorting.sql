/*
We will use the Interview_practice database and SalesData table.
Custom Sorting | Order by Month in an Year
*/
select * from SalesData

select MonthName, City, Sales from SalesData order by MonthName;

select MonthName, City, Sales from SalesData order by case when MonthName = 'January' then 1
when MonthName = 'February' then 2
when MonthName = 'March' then 3
when MonthName = 'April' then 4 
when MonthName = 'May' then 5 
when MonthName = 'June' then 6 
when MonthName = 'July' then 7 
when MonthName = 'August' then 8
when MonthName = 'September' then 9 
when MonthName = 'October' then 10 
when MonthName = 'November' then 11 
when MonthName = 'December' then 12 
else Null end

/*If date is given in 'yyyy-mm-dd' then*/
select DatePart(month,Date) AS MonthNumber , MonthName, city , sales from SalesData
select * from SalesData