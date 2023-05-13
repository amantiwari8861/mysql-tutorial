
use demo2;
# drop table w1,w2;

create table w1(
PID int not null primary key,
PName varchar(20),
Sales int
);

insert into w1 values
(12,'Cap',800),
(13,'Bottle',700),
(14,'Notebook',650),
(15,'Pen',250);

create table w2(
PID int not null primary key,
PName varchar(20),
Sales int,
Qty int
);

insert into w2 values
(11,'Soap',1100,30),
(13,'Bottle',700,10),
(16,'Mobile Charger',1500,12),
(18,'Bag',1350,4),
(15,'Pen',250,15);

select * from w1; -- (PID,Pname,Sales)
select * from w2; -- (PID,PName,Sales,Qty)

#       (PID,PName,Sales)    (PID,PName,Sales,Qty)
# In w1 (13,Bottle,700)   w2 (13,Bottle,700,10)
# In w1 (15,Pen,250)      w2 (15,Pen,250,15)

# Stu - student details, Course - Course details
# w1 and w2 have similar data

# Sales table  for Jio Mart
# Sales_Feb and Sales_Mar

-- Union
-- It combines the result set from multiple similar tables and 
-- returns distinct records (entire row is not duplicate) 
-- into a single result set.

-- Rules
-- 1) The number and order of columns should be same
-- 2) The column name of the first SELECT query will be the 
--    column names of the output.
-- 3) The number of columns used in each select query should be same.

select * from w1;
-- PID(12,13,14,15),PName, Sales
select * from w2;
-- PID(11,13,15,16,18),PName, Sales, Qty

-- common PID - 13,15
 
-- Ex1
select PID,PName, Sales from w1
union
select PID,PName, Sales from w2;

-- Ex2
select PID,PName as Product, Sales from w1
union
select PID,PName, Sales from w2;

-- Ex3
select PID,PName, Sales from w1
union
select PID,PName as Product, Sales from w2;

-- Ex3
select PID Prod_ID,PName as P1, Sales from w1
union
select PID,PName as P2, Sales from w2;

-- Ex4 -- Inconsistent result
select PID,PName, Sales from w1
union
select PID, Sales,PName from w2;

-- Ex5 -- Error
select PID,PName, Sales from w1
union
select PID,PName, Sales,Qty from w2;

-- Ex6 - Working query
select PID,PName, Sales, null as Qty from w1
union
select PID,PName, Sales,Qty from w2;

select PID,PName, Sales,0 as Qty from w1
union
select PID,PName, Sales,Qty from w2;

select PID,PName, Sales from w2
union
select PID, PName,Sales from w1
order by PID;

# Extract all product details from both table where Sales>750

# Scenario - 1
select PID, PName, Sales from w1 
union
select PID, PName,Sales from w2
where Sales>750;

# Scenario - 2
select PID, PName, Sales from w1 
where Sales>750
union
select PID, PName,Sales from w2;

# Scenario - 3
select PID, PName, Sales from w1 
where Sales>750
union
select PID, PName,Sales from w2
where Sales>750;

# Scenario 4 - Sub Query
select * from (
select PID,PName, Sales from w1
union
select PID,PName, Sales from w2
) as z
where z.Sales>750;

-- Union All
-- It combines the result set from multiple similar tables and 
-- returns records(which might include even dupliactes) into a
-- single result set.

select PID,PName, Sales from w1
union all
select PID,PName, Sales from w2;

select PID,PName as P1, Sales from w1
union all
select PID,PName as P2, Sales from w2;

select * from w1;

update w1 set Sales=350 where PID=15;

select PID,PName, Sales from w1
union
select PID,PName, Sales from w2;

select PID,PName, Sales from w1
union all
select PID,PName, Sales from w2;


select * from w2;
drop table w3;

create table w3(
PID int not null primary key,
PName varchar(20),
Sales int
);

insert into w3 values
(13,'Bottle',700),
(22,'Mobile',16500),
(24,'EarPod',1299);

select *,0 As Qty from w1
union 
select * from w2
union 
select *,0 As Qty from w3;


-- Constraints
-- primary key, foreign key, not null, default, check, unique

drop table dummy1;

create table dummy1(
ID int primary key auto_increment,
name varchar(20) not null,
age int,
check (age>=18),
adhar int unique,
city varchar(20) default 'Delhi'
);

select * from dummy1;

insert into dummy1 (name,age,adhar) 
values 
('Amit',20,1234),
('Vikas',19,1235);

select * from dummy1;

insert into dummy1 (name,age,adhar) values ('Mohit',14,2345); -- Error(check constraint violated)
insert into dummy1 (name,age,adhar,city) values ('Anuj',23,5662,'Mumbai');
insert into dummy1 (name,age,adhar) values ('Arun',25,5662);   -- Error(unique constraint violated)
insert into dummy1 (name,age,adhar) values ('Arjun',23,7131);

select * from dummy1;

# 1) auto increment is not affected by check constraint violation.
# 2) auto_increment is incremented by 1 if unique constraint 
# is violated.

insert into dummy1 (name,age,adhar) 
values 
('ABCD',26,null),('PQRS',27,null);

select * from dummy1;

alter table dummy1 auto_increment=50; 

insert into dummy1 (name,age,adhar) 
values 
('Vipul',25,2340),('Hitesh',27,2869);

select * from dummy1;

insert into dummy1 (name,age,adhar) values 
('Priyank',23,2869);

select * from dummy1;

insert into dummy1 (name,age,adhar) values
('Mayank',21,2341),   
('Shreya',22,5321);

select * from dummy1;   

insert into dummy1 (ID,name,age,adhar,city) values
(20,'Bhavya',22,5731,'Lucknow'); 


insert into dummy1 (name,age,adhar,city) values 
('Priya',25,6238,null);

select * from dummy1;  

update dummy1 set ID=100 where ID=4; 

insert into dummy1(name,age,adhar) values
('Abhishek',24,8560);

select * from dummy1;

insert into dummy1(name,age,adhar) values
('Abhijeet',27,8561);

select * from dummy1;

update dummy1 set ID=12 where ID=6;

insert into dummy1(name,age,adhar) values
('Aditya',28,8562);

select * from dummy1;

update dummy1 set ID=130 where ID=12;

insert into dummy1(name,age,adhar) values
('Aditi',24,8569);

select * from dummy1;

# 1) Inserting a custom ID (column with auto increment) does not affect
# the auto_increment counter that was initialzed with alter query.
# 2) Updating a custom ID (column with auto increment) affects the
# auto_increment counter.
# 3) Largest auto_increment value will preavil even with update.


drop table dummy2;

create table dummy2(
ID int primary key auto_increment,
name varchar(20) not null,
age int,
adhar int unique,
city varchar(20) default 'Ayodhya',
check (length(city)=7)    # exactly 7
);

insert into dummy2 (name,age,adhar,city) 
values ('Pushkar',23,12334,'Mathura');

select * from dummy2;


insert into dummy2 (name,age,adhar,city) 
values ('Nikita',21,12335,'Del  hi');   # error

alter table dummy2 auto_increment=50; 

insert into dummy2 (name,age,adhar,city) 
values ('Shikhar',22,12337,'Chennai');

select * from dummy2;

insert into dummy2 (name,age,adhar) 
values ('Ankit',24,12338);
