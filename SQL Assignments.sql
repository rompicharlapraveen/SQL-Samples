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



--Assignment2
create table Assignment4(Id int primary key, Name varchar(max), Age int, Dob date)
insert into Assignment4 values(1,'Praveen123',23,'06/09/1998'),(2,'121Sai',22,'10/03/1997'),(3,'Sa11i',21,'02/21/2000'),(4,'Ma1d1hu',23,'08/29/1996')
insert into Assignment4 values(5,'Srinu',25,'01/01/2017'),(6,'Vasu',28,'12/31/2017'),(7,'Ram',27,'12/31/2000')
select * from Assignment4


--1. Write a script to extracts all the numerics from Alphanumeric String

create function AlPhanumericName(@input varchar(30))  
Returns varchar(30)  
As  
Begin  
  Declare @Index int = Patindex('%[^0-9]%', @input)  
  Begin  
    While @Index > 0  
    Begin  
	  set @input = Stuff(@input, @Index, 1, '' )
      set @Index = Patindex('%[^0-9]%', @input )  
    End  
  End  
  Return @input
End
select dbo.AlPhanumericName(Name) as Number from Assignment4


--2. Write a script to calculate age based on the Input DOB

select Dob, datediff(year,Dob,getdate()) as Age from Assignment4
SELECT Dob, datediff(yy,convert(datetime, Dob),getdate()) AS Age from Assignment4
select Dob, datediff(month,Dob,getdate())/12 as Age from Assignment4

--3. Create a column in a table and that should throw an error when we do SELECT * or SELECT of that column. 
--If we select other columns then we should see results




--4. Display Calendar Table based on the input year. If I give the year 2017 then populate data for 2017 only
--Date e.g.  1/1/2017 

--DayofYear 1 – 365/366 (Note 1)

--Week 1-52/53

--DayofWeek 1-7

--Month 1-12

--DayofMonth 1-30/31 (Note 2)

--Note 1: DayofYear varies depending on the number of days in the given year.

--Note 2: DayofMonth varies depending on number of days in the given month

--Weekly calculations are always for a 7 day period Sunday to Saturday.


--DECLARE @d date = '1/1/2017'
Declare @d date = '12/31/2020'
select datepart (dy , @d)as 'Day Of year' , datename(ww,@d) as 'Week' , datepart(dw,@d) as 'Day of Week' ,month(@d) as 'Month', day(@d) as 'Day of Month'

--5.Display Emp and Manager Hierarchies based on the input till the topmost hierarchy. (Input would be empid)

create table Employee2(Empid int primary key, Empname varchar(30), Managerid int, ManagerName varchar(30), SeniorManagerName varchar(30))
insert into Employee2 values(1,'Praveen',1,'Sumith','Pradeep'),(2,'Sasi',2,'Raju','Pranav'),(3,'Sai',3,'Sam','Raju'),(4,'Madhu',4,'Ravi','Babu')
select * from Employee2
select Empid,Empname,ManagerName,SeniorManagerName from Employee2 where Empid=Managerid 

--Top N
select Top 5 FirstName,MiddleName ,LastName, DeptName from Assignment3 where DeptName = 'Dev' order by Id

--Set Operators(SET operators are special type of operators which are used to combine the result of two queries)

select * from Employee1 union select * from Department
select * from Employee1 union all select * from Department
select * from Employee1 intersect select * from Department
select * from Employee1 except select * from Department


--Joins

--Join
select * from person1, Praveen where person1.Age = Praveen.Age

--Inner Join
select person1.Id, person1.Firstname, Praveen.Name from person1 inner join Praveen on person1.Age = Praveen.Age

--Self Join
select person1.Lastname, Praveen.Name, Praveen.Age from person1, Praveen where person1.Id <> Praveen.Id and person1.Age = Praveen.Age order by Praveen.Age 

--Cross Join
select person1.Id, person1.Firstname, Praveen.Name from person1 cross join Praveen where person1.Age = Praveen.Age

--Left Outer Join
select person1.Id, person1.Firstname, Praveen.Name from person1 left outer join Praveen on person1.Firstname = Praveen.Name 

--Right Outer Join
select person1.Id, person1.Firstname, Praveen.Name from person1 right outer join Praveen on person1.Firstname = Praveen.Name group by Firstname

--Full Outer Join
select person1.Id, person1.Firstname, Praveen.Name from person1 full outer join Praveen on person1.Firstname = Praveen.Name

--Cross Apply
select person1.Id, person1.Firstname, Praveen.Name from person1 cross apply Praveen where  person1.Age = Praveen.Age 

--Outer Apply
select person1.Id, person1.Firstname, Praveen.Name from person1 outer apply Praveen where  person1.Age = Praveen.Age


--Ranking Functions()

select * from Emp14
select Name, Age, City, rank() over(partition by City order by Name) as RankNo from Emp14 
select Name, Age, City, rank() over(order by City) as RankNo from Emp14 

select Name, Age, City, row_number() over(partition by City order by Name) as RankNo from Emp14
select Name, Age, City, row_number() over(order by City) as RankNo from Emp14

select Name, Age, City, dense_rank() over(partition by City order by Name) as RankNo from Emp14 
select Name, Age, City, dense_rank() over(order by City) as RankNo from Emp14 

select Name, Age, City, ntile(5) over(partition by Name order by City) as RankNo from Emp14 
select Name, Age, City, ntile(5) over(order by City) as RankNo from Emp14 

--Group By
select count(Id) as "Person Id", Address from person1 group by Address order by Address



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


--Write a query to Get a List of Employees who have a one part name.(The PARSENAME function returns the specified part of an object name.)
select parsename (replace(Name,' ','.'),3) as "FirstName" from Assignment3
select left(Name, charindex(' ', Name) - 1) as 'FirstName' from Assignment3


--Write a query to Get a List of Employees who have a three part name.
select parsename (replace(Name,' ','.'),1) as "LastName" from Assignment3
select reverse(substring(reverse(Name), 1, charindex(' ', reverse(Name)) - 1))  as 'LastName' From Assignment3
select Name from Assignment3 where Name like '% % %'

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
select distinct Initial, FirstName from Assignment3 where FirstName = 'Ramesh' and Initial Between 'A' and 'T'
select distinct Initial, FirstName from Assignment3 where Initial like '[A-T]%' order by Initial

--Write a query which gives employee types in the organization.
select DeptName from Assignment3
select Distinct DeptName from Assignment3
select Name, DeptName from Assignment3
select * from Assignment3 where DeptName='Dev' 
select Name, DeptName from Assignment3 where Name = 'Praveen Kumar Rompicharla'
select Name, DeptName from Assignment3 where DeptName = 'Dev'
select Name from Assignment3 where DeptName = 'Qa'


--write a query to get a list of Employees who have a First Middle Or last name as Ram, and not anything else
select * from Assignment3 where Name like 'Ram%' or Name like '% Ram %' or Name like '%Ram' 


--Max(Salary)
select top 1 Name from Assignment3 order by Salary desc

--Top N
select Top 5 FirstName,MiddleName ,LastName, DeptName from Assignment3 where DeptName = 'Dev' order by Id

--Set Operators(SET operators are special type of operators which are used to combine the result of two queries)

select * from Employee1 union select * from Department
select * from Employee1 union all select * from Department
select * from Employee1 intersect select * from Department
select * from Employee1 except select * from Department

select * from Employee1
select * from Department

--Ranking Functions()

select * from Emp14
select Name, Age, City, rank() over(partition by City order by Name) as RankNo from Emp14 
select Name, Age, City, rank() over(order by City) as RankNo from Emp14 

select Name, Age, City, row_number() over(partition by City order by Name) as RankNo from Emp14
select Name, Age, City, row_number() over(order by City) as RankNo from Emp14

select Name, Age, City, dense_rank() over(partition by City order by Name) as RankNo from Emp14 
select Name, Age, City, dense_rank() over(order by City) as RankNo from Emp14 

select Name, Age, City, ntile(4) over(partition by City order by Name) as RankNo from Emp14 
select Name, Age, City, ntile(4) over(order by Name) as RankNo from Emp14 
select Name, Age, City, ntile(4) over(order by City) as RankNo from Emp14 

--Joins

--Join
select * from person1, Praveen where person1.Age = Praveen.Age

--Self Join
select person1.Lastname, Praveen.Name, Praveen.Age from person1, Praveen where person1.Age = Praveen.Age

--Inner Join
select person1.Id, person1.Firstname, Praveen.Name from person1 inner join Praveen on person1.Age = Praveen.Age

--Cross Join
select person1.Id, person1.Firstname, Praveen.Name from person1 cross join Praveen where person1.Age = Praveen.Age

--Left Outer Join
select person1.Id, person1.Firstname, Praveen.Name from person1 left outer join Praveen on person1.Firstname = Praveen.Name 

--Right Outer Join
select person1.Id, person1.Firstname, Praveen.Name from person1 right outer join Praveen on person1.Firstname = Praveen.Name group by Firstname

--Full Outer Join
select person1.Id, person1.Firstname, Praveen.Name from person1 full outer join Praveen on person1.Firstname = Praveen.Name

--Cross Apply
select person1.Id, person1.Firstname, Praveen.Name from person1 cross apply Praveen where  person1.Id = Praveen.Id

--Outer Apply
select person1.Id, person1.Firstname, Praveen.Name from person1 outer apply Praveen where  person1.Id = Praveen.Id


--Group By
select count(Id) as "Person Id", Address from person1 group by Address order by Address

--Assignment2
create table Assignment4(Id int primary key, Name varchar(max), Age int, Dob date)
insert into Assignment4 values(1,'Praveen123',23,'06/09/1998'),(2,'121Sai',22,'10/03/1997'),(3,'Sa11i',21,'02/21/2000'),(4,'Ma1d1hu',23,'08/29/1996')
select * from Assignment4

--1. Write a script to extracts all the numerics from Alphanumeric String

select Name from Assignment4 where Name like '%[^a-zA-Z]%' 
SELECT Name FROM Assignment4 WHERE patindex ('%[A-Z]%', Name) > 0 AND PATINDEX('%[0-9]%', Name) > 0

select substring(Name, PatIndex('%[0-9]%', Name, len(Name))) as number from Assignment4 
SELECT Name FROM Assignment4 where ISNUMERIC(Name) = 1
SELECT * FROM Assignment4 WHERE Name NOT LIKE '%[^0-9]%'


SELECT LEFT(subsrt, PATINDEX('%[^0-9]%', subsrt + 't') - 1) 
FROM (
    SELECT subsrt = SUBSTRING(Name, pos, LEN(Name))
    FROM (
        SELECT Name, pos = PATINDEX('%[0-9]%', Name)
        FROM Assignment4
    ) d
) t
select * from Assignment4
select  substring(Name,patindex('%[0-9]%', Name),len(Name)) from Assignment4


--2. Write a script to calculate age based on the Input DOB

select Dob, datediff(year,Dob,getdate()) as Age from Assignment4
SELECT Dob, datediff(yy,convert(datetime, Dob),getdate()) AS Age from Assignment4
select Dob, datediff(month,Dob,getdate())/12 as Age from Assignment4
