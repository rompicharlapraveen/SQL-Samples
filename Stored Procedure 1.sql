
--Create
create proc dbo.GetDetails
as
Begin
select * from Assignment3
End

exec dbo.GetDetails

--Alter Taable
alter proc dbo.GetDetails
as 
Begin 
select * from Assignment3
End 

--Drop Table
drop proc dbo.GetDetails

--Input Parameter(Pass Values to Stored Procedure)

create proc dbo.GetDetails1
@Id int
as
Begin
select * from Assignment3 where Id=@Id;
End

Exec dbo.GetDetails1 101 -- or Exec dbo.GetDetails1 @Id=101 

--Output Parameter(Return Values to Stored Procedure)

create proc dbo.GetDetails2(@EmpCount int output)
as
Begin
select @EmpCount = COUNT(Id) from Assignment3;  
End

-- Declare an Int Variable that corresponds to the Output parameter in SP  
DECLARE @TotalEmp INT   
  
-- Don't forget to use the keyword OUTPUT  
EXEC  [dbo].[GetDetails2] @TotalEmp OUTPUT  
  
-- Print the result  
print @TotalEmp 

--Local temp procedure
CREATE PROCEDURE #Temp  
AS  
BEGIN  
PRINT 'Local temp procedure'  
END  

--Global temp procedure
CREATE PROCEDURE ##TEMP  
AS  
BEGIN  
PRINT 'Global temp procedure'  
END  

--Optional Parameter
create proc [dbo].[Persons]
(
	@Id int,
	@Name varchar(20)='N/A',
	@FatherName varchar(20)
)
as
Begin
	insert into Person2 values(@Id, @Name, @FatherName)
End

exec Persons 122,'','Srinivas'

select * from Person2

