/*We have used Interview_Practice database and AlphanumericEmployee table
How to Extract Numbers and Alphabets from an alphanumeric string from Translate function | Sql Patindex and stuff function to retrieve numbers, string*/
-- STEP-1 Translate, Trim, Space, Len
select * from AlphanumericEmployee
/*Translate function is used to remove numeric with space then trim the space before alphabets, now to fetch the numeric in another column we will remove the projectcodename
with Trim(Translate(projectcode_name, '0123456789', '          ')) inside the translate function and for space we will use space function to length of ocupied alphabet*/
select Trim(Translate(projectcode_name, '0123456789', '          ')) as pname from AlphanumericEmployee /*getting projectname from projectcode_name*/
select serial, Trim(Translate(projectcode_name, '0123456789', '          ')) as code,
Translate(projectcode_name, Trim(Translate(projectcode_name, '0123456789', '          ')), Space(len(Trim(Translate(projectcode_name, '0123456789', '          '))))) code,
employee_details from AlphanumericEmployee

-- STEP-2 Patindex, Substring, Right
select Substring(projectcode_name,1, Patindex('%[a-z]%', projectcode_name)-1) code, Right(projectcode_name, len(projectcode_name) - Patindex('%[a-z]%', projectcode_name)+1) pname
from AlphanumericEmployee
select * from AlphanumericEmployee

-- STEP-3 For employee_details where alphabet and number are randomly spread without any order in their index, Using Stuff() and Patindex() function.
Create function UDF_ExtractNumbers
(@input varchar(255))
Returns varchar(255) As Begin 
Declare @alphabetIndex int = Patindex('%[^0-9]%', @input)
Begin
While @alphabetIndex > 0 
Begin
Set @input = Stuff(@input, @alphabetIndex, 1, '')
Set @alphabetIndex = Patindex('%[^0-9]%', @input)
end
end
return @input
end

Create function UDF_ExtractAlphabet
(@input varchar(255))
Returns varchar(255) As Begin 
Declare @alphabetIndex int = Patindex('%[^a-z]%', @input)
Begin
While @alphabetIndex > 0 
Begin
Set @input = Stuff(@input, @alphabetIndex, 1, '')
Set @alphabetIndex = Patindex('%[^a-z]%', @input)
end
end
return @input
end

select *, dbo.UDF_ExtractNumbers(employee_details) as Id, dbo.UDF_ExtractAlphabet(employee_details) as name
from AlphanumericEmployee

-- STEP-4 https://www.youtube.com/watch?v=XAzkr3-Rfjg&t=462s

