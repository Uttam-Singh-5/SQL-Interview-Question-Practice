/*We have used the Interview_Practice dataset in which the table name is Datetimesales
Calculate number of weekdays between two dates(orderdate and shipdate) and Exclude Weekends, extended version of this question- https://www.youtube.com/watch?v=EadlqP6PPEY*/
select * from Datetimesales
/*Here by using DateName we are getting the name of the week by dw and if we use DatePart that returns integer 1 to 7 then  may be different in timezones of countries */
select DateName(dw, orderdate) weakname, orderdate from Datetimesales

/*ExcludeWeekends-should have any regular or inbetween days as saturday and sunday to make 1 weekend and single saturday or sunday is not consider to count a complete weekend
Here we find the differnce between orderdate and ship date and to include the startdate we have done +1 in the difference, to calculate the no. of weaks we use Datediff(ww, , )*/
select orderdate, shipdate, Datediff(dd, orderdate, shipdate) + 1 datedif from Datetimesales /*total days in a week and +1 is to include the start date of the order*/
select orderdate, shipdate, Datediff(ww, orderdate, shipdate) * 2 weakdif from Datetimesales /* we have multiplied it by 2 because each week has 2 hoidays*/

/*if start date is Sunday then the previous saturday is missed so it is not a complete week and if the end date is Saturday then their is no coming sunday so incomplete week*/
select orderdate, shipdate, (Datediff(dd, orderdate, shipdate) + 1) - (Datediff(ww, orderdate, shipdate) * 2) - 
(case when DateName(dw, orderdate) = 'Sunday' then 1 else 0 end) - (case when DateName(dw, shipdate) = 'Saturday' then 1 else 0 end) from Datetimesales
