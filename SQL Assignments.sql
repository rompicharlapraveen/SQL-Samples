create table Assignment3(Id int, Name nvarchar(100), FirstName varchar(30), MiddleName varchar(30), LastName varchar(30), Initial varchar(10),
FatherName varchar(30),  Salary float, DeptName varchar(80), Dob date)

insert into Assignment3 values(101,'Praveen Kumar Rompicharla','Praveen','Kumar','Rompicharla','R','Srinivas',3000,'Dev','01/27/2022')
insert into Assignment3 values(102,'Sai Ram Kumar','Sai','Ram','Kumar','A','Ramu',4000,'Qa','02/27/2022')
insert into Assignment3 values(103,'Ram Kumar Sai','Ram','Kumar','Sai','C','Raju',30000,'Dev','05/28/2022')
insert into Assignment3 values(104,'Kumar Sai Ram','Kumar','Sai','Ram','D','Sri',2000,'Analyst','06/22/2021')
insert into Assignment3 values(105,'Venkata Sasi Kunuku','Venkata', 'Sasi',' Kunuku','K','Srinu',50000,'Dev','02/09/2021')
insert into Assignment3 values(106,'Chandra Khan','Chandra','Khan','Sri','E','Suresh',60000,'Dev','06/07/2021')
insert into Assignment3 values(107,'Ramesh Khan','Ramesh','Khan','Madhu','T','Rajesh',10000,'AI','06/07/2021')
insert into Assignment3 values(108,'Sri Kiran Ram','Sri','Kiran','Ram','G','Raj',1,'Qa','08/29/1998')
insert into Assignment3 values(109,'Ramesh Khan Ram','Ramesh','Khan','Madhu','T','Rajesh',10000,'AI','06/07/2021')
insert into Assignment3 values(110,'Chandra Bose Khan','Chandra','Bose','Khan','L','Ramu',5000,'Qa','07/06/1996')

select * from Assignment3


--Write a query to Get a List of Employees who have a one part name.
select left(Name, charindex(' ', Name) - 1) as 'FirstName' from Assignment3


--Write a query to Get a List of Employees who have a three part name.
select reverse(substring(reverse(Name), 1, charindex(' ', reverse(Name)) - 1))  as 'LastName' From Assignment3


--Write a query which returns Name, FatherName, DOB of employees whose PresentBasic is
--i. Greater than 30000.
--ii. Less than 3000.
--iii. Between 3000 and 5000. (Note:Assume 1 as least unit in currency).
select Name, FatherName, Dob from Assignment3 where Salary>30000
select Name, FatherName, Dob from Assignment3 where Salary<3000
select Name, FatherName, Dob from Assignment3 where Salary  Between 3000 and 5000


--Write a query which returns All the details of employees whose Name
--i. Ends with 'KHAN'
--ii. Starts with 'CHANDRA'
--iii. Is 'RAMESH' and their initial will be in the range of alphabets a-t.
--EX:If an employee name is T.Ramesh then your query should return his record.
select * from Assignment3 where Name like 'Chandra%'
select * from Assignment3 where Name like '%Khan'
select * from Assignment3 where Name like 'Chandra%' and Name like '%Khan'
select Initial, FirstName from Assignment3 where FirstName = 'Ramesh' and Initial Between 'A' and 'T'
select Initial, FirstName from Assignment3 where Initial like '[A-T]' order by Initial

--Write a query which gives employee types in the organization.
select DeptName from Assignment3
select Distinct DeptName from Assignment3
select Name, DeptName from Assignment3
select * from Assignment3 where DeptName='Dev' 
select Name, DeptName from Assignment3 where Name = 'Praveen Kumar Rompicharla'
select Name, DeptName from Assignment3 where DeptName = 'Dev'
select Name from Assignment3 where DeptName = 'Qa'


--write a query to get a list of Employees who have a First Middle Or last name as Ram, and not anything else
select * from Assignment3 where FirstName = 'Ram' or MiddleName = 'Ram' or LastName = 'Ram'
select FirstName from Assignment3 where FirstName = 'Ram'
select MiddleName from Assignment3 where MiddleName = 'Ram'
select LastName from Assignment3 where LastName = 'Ram'


--Max(Salary)
select top 1 Name from Assignment3 order by Salary desc

--Top N
select Top 5 FirstName,MiddleName ,LastName, DeptName from Assignment3 where DeptName = 'Dev' order by Id

--Set Operators(SET operators are special type of operators which are used to combine the result of two queries)

select * from Employee1 union select * from Department
select * from Employee1 union all select * from Department
select * from Employee1 intersect select * from Department
select * from Employee1 except select * from Department
