create table Assignment3(Id int, Name nvarchar(100), FirstName varchar(30), MiddleName varchar(30), LastName varchar(30), Initial varchar(10),
FatherName varchar(30),  Salary float, DeptName varchar(80), Dob date)
insert into Assignment3 values(101,'Praveen Kumar Rompicharla','Praveen','Kumar','Rompicharla','R','Srinivas',3000,'Dev','01/27/2022')
insert into Assignment3 values(102,'Sai Ram Kumar','Sai','Ram','Kumar','A','Ramu',4000,'Qa','02/27/2022')
insert into Assignment3 values(103,'Ram Kumar Sai','Ram','Kumar','Sai','C','Raju',30000,'Dev','05/28/2022')
insert into Assignment3 values(104,'Kumar Sai Ram','Kumar','Sai','Ram','D','Sri',2000,'Analyst','06/22/2021')
insert into Assignment3 values(105,'Venkata Sasi Kunuku','Venkata', 'Sasi',' Kunuku','K','Srinu',50000,'Dev','02/09/2021')
insert into Assignment3 values(106,'Chandra Khan','Chandra','Khan','Sri','E','Suresh',60000,'Dev','06/07/2021')
insert into Assignment3 values(107,'Ramesh Khan','Ramesh','Khan','Madhu','T','Rajesh',10000,'AI','06/07/2021')

select * from Assignment3

select left(Name, charindex(' ', Name) - 1) as 'FirstName' from Assignment3
select reverse(substring(reverse(Name), 1, charindex(' ', reverse(Name)) - 1))  as 'LastName' From Assignment3
select Name, Dob from Assignment3 where Salary>30000
select Name, Dob from Assignment3 where Salary<3000
select Name, Dob from Assignment3 where Salary Between 3000 and 5000
select * from Assignment3 where Name like '%Khan%'
select * from Assignment3 where Name like 'Chandra%'




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
insert into Assignment3 values(107,'Ramesh Khan Ram','Ramesh','Khan','Madhu','T','Rajesh',10000,'AI','06/07/2021')

select * from Assignment3

select left(Name, charindex(' ', Name) - 1) as 'FirstName' from Assignment3

Declare @str varchar(20)
select @str=Name from Assignment3
select *from  string_split(@str,' ')

select reverse(substring(reverse(Name), 1, charindex(' ', reverse(Name)) - 1))  as 'LastName' From Assignment3
select Name,FatherName, Dob from Assignment3 where Salary>30000
select Name,FatherName, Dob from Assignment3 where Salary<3000
select Name,FatherName, Dob from Assignment3 where Salary  Between 3000 and 5000
select * from Assignment3 where Name like 'Chandra%' and name like '%Khan'
select * from Assignment3 where Name like 'Chandra%'
select * from Assignment3 where Name like '%Khan'
select * from Assignment3 where DeptName='Dev' 
select Name, DeptName from Assignment3 where Name='Praveen Kumar Rompicharla'
select DeptName, Name from Assignment3 where Name='Praveen Kumar Rompicharla'
select Name, DeptName from Assignment3 where DeptName='Dev'
select Name from Assignment3 where DeptName='Qa'
select DeptName from Assignment3
select * from Assignment3 where FirstName='Ram' or MiddleName='Ram' or LastName='Ram'
select * from Assignment3 where FirstName='Ram'
select * from Assignment3 where MiddleName='Ram'
select * from Assignment3 where LastName='Ram'

select top 1 Name from Assignment3 order by Salary desc

