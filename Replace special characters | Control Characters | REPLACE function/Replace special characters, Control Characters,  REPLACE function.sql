/*We are using Interview_Practice database and SpecialChar table
Replace special characters | Control Characters | REPLACE function */

select * from SpecialChar /*After executing the query we realise that their is a special character in the address column in 2nd and 4th rows let us remove it with trim function*/

select *, Trim(Address) as SpecialChar from SpecialChar /*Trim function only removes space but not the special character , so nothing changed in this query*/

select *, Replace(Address, CHAR(9), '') from SpecialChar /*we will use replace function Replace(Address, CHAR(), '') and CHAR() has special character ex- 9, 13 given list char we can't see*/

select *, REPLACE(Address, '?', '') AS CleanedAddres from SpecialChar; /*we have used the replace function REPLACE(Address, '?', '') for special character we can see and above we can't*/




