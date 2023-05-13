
-- Views
-- 1) A view is a stored query. 
-- 2) Views are the database objects that can also be called as 
--    virtual tables.
-- 3) Views do not store any data.
-- 4) They are logical representation of actual data.
-- 5) It is doable to write a complex query once or twice. However, if we need 
-- to use it many times, a more practical approach is necessary. This is where SQL
-- views come into picture.

use demo2;

# drop table customers;

create table Customers(
ID int primary key,
FName varchar(30) not null,
LName varchar(30),
Age int,
City varchar(30),
Salary float
);

# drop table Orders;

create table Orders(
Order_ID int primary key,
C_ID int not null,
Order_date text,
Transaction_Amount int,
foreign key (C_ID) references Customers(ID)
);

insert into Customers values
(1,'Mohit','Shukla',23,'Mathura',35000.00),
(2,'Ujjwal','Singh',22,'Noida',33000.00),
(3,'Karthik','Dogra',28,'Gurgugram',46000.00),
(4,'Ashish','Shukla',23,'Mumbai',35000.00),
(5,'Jiten','Pandey',26,'Noida',37000.00),
(6,'Vrinda','Kohli',31,'Delhi',44000.00),
(7,'Ritu','Gupta',21,'Mumbai',28000.00),
(8,'Manan','Dueby',Null,'Mumbai',Null),
(9,'Aakriti','Gaur',26,null,37000.00);

select * from Customers;

insert into Orders values
(132,1,'2018-03-14',3540),
(134,2,'2019-05-29',4032),
(145,3,'2020-07-23',2133),
(133,4,'2017-02-11',1232),
(137,5,'2019-04-08',4210),
(144,6,'2019-06-05',5240),
(140,7,'2020-12-18',6123),
(141,8,'2022-10-27',1431),
(143,9,'2021-11-20',2500);

select * from Customers; -- 9 records
select * from Orders; -- 9 records

# Customers(ID, FName, LName, Age, City, Salary)
# Orders(Order_ID, C_ID, Order_date, Transaction_amount)

-- create a view
create view C1 as  # C1 is the name of the view
select FName, LName, Salary from Customers;

-- Execute the View
select * from C1;
select FName, LName, Salary from Customers;

-- Filter the view
select * from C1 where Salary>35000;
select FName, LName, Salary from Customers where Salary>35000;

-- Replacing an exitsing view 
create or replace view C1 as
select ID, FName as FirstName, LName, Salary from Customers;

select * from C1;

-- drop the view
drop view C1;

-- Types of View
-- 1) Vertical View - A view where source table is sliced vertically
-- (consisting of 1 column)
-- 2) Horizontal View - A view where source table is sliced horizontally
-- (consisting of 1 row)
-- 3) Row_Column subset View - View consisting of subset of rows and columns
-- 4) Grouped View - View consisting of group by operation.
-- 5) Joined View - View consisting of join operations.

# Customers(ID, FName, LName, Age, City, Salary)
# Orders(Order_ID, C_ID, Order_date, Transaction_amount)

-- 1) Vertical View -
# drop view VV1;
create or replace view VV1 as
select FName from Customers;

select * from VV1;

-- 2) Horizontal View
# drop view HV1;
create or replace view HV1 as
select ID,FName, Age, City from Customers where ID=7;

select * from HV1;


-- 3) Row_Column subset View
drop view RCSV1; 

create or replace view RCSV1 as 
select ID,FName, Age from Customers
where Age>24;

select * from RCSV1;

select * from customers;

create or replace view RSCV2 as
select ID,FName, Age from Customers
where ID between 1 and 5;

select * from RSCV2;

# Rename a View
# rename table old_name to new_name
rename table RSCV2 to RSCV3; 

# rename view RSCV2 to RSCV3;    # error

select * from customers;

# Grouped View
create or replace view C3 as
select c.city, avg(o.Transaction_amount) as AvgTrAmt
from customers c
inner join orders o
on c.id = o.c_id
group by c.city;

select * from C3;
select * from C3 where AvgTrAmt>4000;
select * from C3 order by AvgTrAmt desc;
select * from C3 where City in ('Noida','Delhi','Mathura');

# Joined View
create or replace view C2 as
select c.ID, c.FName, c.Age, c.City, c.Salary, 
o.order_id, o.order_date, o.Transaction_amount
from customers c
inner join orders o 
on c.id = o.c_id;

select * from c2;
select * from c2 where City in ('Mumbai','Delhi');

-- Modifying a View - Inserting , deleting and Update data

create or replace view C4 as
select * from Customers;

select * from C4; # 9 -- ID,FName,Lname,Age,City,Salary
select * from Customers;  # ID,FName,LName,Age,City,Salary;

-- insert into views
insert into C4 values(10,'Aryan','Singh',20,'Delhi',43000); 
insert into Customers values(11,'Vipin','Shukla',22,'Noida',37000); 

select * from customers;
select * from C4;

-- Conclusion
-- Inserting into a view made out of 1 table, the updated data
-- is reflected in both the view as well as parent table.

describe customers;

create or replace View C5 as
select ID,Age,City,Salary from customers;

select * from C5;

insert into C5 values(12,27,'Noida',52000);

# Insert into Joined View
select * from c2;

insert into C2  
(ID,FName,Age,City,Salary,Order_ID,Order_Date,Transaction_amount)
values
(12,'Ankit',25,'Delhi',48000,150,'2021-10-12',3425);

# Conclusion
# 1) Joined View insertion requires column names as well. 
# 2) Joined View cant be used to modify more than 1 base table.

select * from c2;

insert into C2 (ID,FName,Age,City,Salary) values
(12,'Ankit',25,'Delhi',48000);

select * from customers;

# Conculsion
# 1) When joined view is used to insert data into 1 table, then
# parent table gets modified with the inserted data. But the correspodning 
# view is not modified.

-- update a view
select * from C4;
update C4 set Salary=32000, Age=24 where ID=8;
select * from C4;

select * from customers;

update customers set City='Pune' where ID=9;

-- Conclusion
-- Updating a record in view, updates it in actual 
-- table and in the view as well, if the view is made up of 1 table.

# Update Joined View
select * from C2;
# Updating columns from multiple tables
update c2 set city='Delhi', transaction_amount=6200 where ID=2;

# Updating columns from single parent table.
update c2 set City='Mumbai',Age=28 where ID=2;

select * from customers;
select * from C2;

update c2 set transaction_amount=6200 where order_id=134;
select * from C2;
select * from orders;

-- Conclusion
-- Updating a record in joined view, 
-- 1) Cant modify more than one base table using update query.
-- 2) If we update one oen table in the joined view, the result
-- gets reflected in both the view and the parent table as well.

drop table orders;
drop table customers;

select * from C4;

# Dropping a table invariably generates invalid reference to the parent table.
# Dropping a view does not impact the parent table.

# Work on delete opertaion on joined View.

# delete on Views

# Delete on View made out of 1 table

create or replace view C6 as
select * from Orders;

select * from C6;
# delete one record
delete from C6 where Order_ID=137;

# delete multiple records
delete from C6 where Transaction_amount<2000;

# delete entire View
delete from C6;

select * from C6;
select * from Orders;


# Conclusion
# In View made out of 1 table, delete opertion on View is impacting
# the view as well as the parent table for single record deletion,
# multiple record deletion or all rows deletion.

# Delete on Joined View
select * from C2;

delete from C2 where ID=9;
delete from C2 where Order_ID=143;

create or replace View C2 as
select c.*,o.* from customers c
inner join orders o on c.ID = o.C_ID;

select * from C2;
select FName,LName from C2; 

delete from C2 where ID=2;
# delete one record
delete from C2 where Order_ID=140;

# delete multiple records
delete from c2 where City='Mumbai';

# delete entire View
delete from C2;

select * from C2;

# Conclusion
# Joined view do not allow delete operation on 
# individual rows,multiple rows or entire table.
 








 

