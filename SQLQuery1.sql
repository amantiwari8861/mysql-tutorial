use AdventureWorks2019;
go
select * from HumanResources.Department
go
select * from mytable;
select * from sys.tables ;

select 'Department Name'=Name from HumanResources.Department

select Name 'Department Name' from HumanResources.Department

select Name as 'Department Name' from HumanResources.Department

select 'snow'+'ball';

select 'my name' as 'any',Name from HumanResources.Department

select 'my name is '  + Name as 'text' from HumanResources.Department

select rate=8*5;

select top 10 DepartmentID from HumanResources.Department order by DepartmentID asc;

select  top 10 with ties * from HumanResources.Department order by DepartmentID asc ;

-- with ties -- doubt

select * from HumanResources.Employee order by EmployeeId;


CREATE FUNCTION dbo.udf_find_product(@Product_Value money, @Product_Status varchar(8)='A') RETURNS int
WITH SCHEMABINDING,ENCRYPTION
AS
BEGIN DECLARE @v_prd int;