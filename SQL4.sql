create table Employee1(Id int, Name varchar(20), Age int, Salary float, Address varchar(30), Email varchar(30))
insert into Employee1 values(1,'Praveen',23,5000,'Bhimavaram','praveen@gmail.com'),
							(2,'Sasi', 24, 8000, 'Undi','Sasi@gmail.com'),
							(3,'Sai', 25, 10000, 'Tanuku', 'Sai@gmail.com')
select * from Employee1


create table Department(Id int, Name varchar(20), Age int, Salary float, Address varchar(30), Email varchar(30))
insert into Department values(1,'Praveen',23,5000,'Bhimavaram','praveen@gmail.com'),
							 (2,'Sasi', 24, 8000, 'Undi','Sasi@gmail.com'),
							 (3,'Sai', 25, 10000, 'Tanuku', 'Sai@gmail.com')
insert into Department (Id,Name,Age,Salary,Address,Email) values (4,'Madhu',26,15000,'Akividu','Madhu@gmail.com')
select * from Department
select Name, Age, Address from Department order by Id offset 2 rows fetch next 2 rows only


with average_salary (avg_sal) as (select avg(Salary) from Department) select * from Department d, average_salary av where d.Salary > av.avg_sal

