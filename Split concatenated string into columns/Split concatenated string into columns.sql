/* We are using Interview_Practice database and SplitString Table
Split concatenated string into columns */
select * from SplitString;

select employeeID, CHARINDEX(',', FullName) as position from SplitString; /*CHARINDEX(',', FullName) is use to get the index of the character the delimiter i.e ',' */

select Value from string_split('John , Doe', ','); /*String_split funtion is used to split it into columns with rows John and Doe with column name Value*/

select EmployeeID, Value from SplitString cross apply string_split(FullName, ','); /*String_split function is used in FullName column to split then use pivot table*/ 

with SplitCTE as (select EmployeeID, ROW_NUMBER() Over(Partition by EmployeeID order by employeeid) as RowNum, Value from SplitString cross apply string_split(FullName, ','))
select EmployeeID, [1] as FirstName, [2] as LastName from SplitCTE pivot (Max(Value) for RowNum in ([1],[2])) as PVT