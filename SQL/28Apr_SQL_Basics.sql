
# comment - Internal Documentation
# Commnets can start with # or --
# comments dont get executed.

# create database
create database apr28;

# drop database
drop database apr28;

# use database
use apr28;

# Data Types
# int, float, char(40), varchar(40) date etc 
#                                 YYYY-MM-DD or YYYY/MM/DD 

# create table
# table_name
# col_name data_type constraint(optional)

# Primary key - Ensures uniquenes of the record(rows).
# It cant be null.
drop table students;

create table students(
SID int primary key,
FName varchar(30) not null,
Age int,
City varchar(30),
CStart_date date,
Course varchar(25),
Marks int);


# describe the table - check the structure of the table
describe students;

# display all the data in the studnets table
select * from students;


# use 4 different cities, use 3 or 5 differnt course
insert into students values
(51,'Ankit',22,'Delhi','2022-10-18','Python',82),
(52,'Jiten',24,'Noida','2022-11-09','SQL',67),
(53,'Priya',26,'Mumbai','2022-12-04','ML',74),
(54,'Hitesh',28,'Delhi','2022-09-24','Tableau',70),
(55,'Kartik',21,'Bangalore','2022-12-29','SQL',87),
(56,'Rohit',23,'Mumbai','2022-05-15','Python',80),
(57,'Shreya',24,'Noida','2022-07-17','Python',91),
(58,'Nikita',26,'Delhi','2022-10-21','ML',80),
(59,'Ujjwal',28,'Mumbai','2022-11-09','Tableau',94),
(60,'Ajay',24,'Banaglore','2022-12-14','SQL',63),
(61,'Vipin',25,'Delhi','2022-08-09','Python',54);


select * from students;

describe students;

# display all tables in the currently used database
show tables;

# CRUD operation - Create Read Update Delete

# Filtering Operations
# 1) <, <=, >, >=, =, [<>,!=](not equal to)

select * from students;
select Course,City, Marks,sid, FName from students;
select SID,FName, City, Course, Marks from students where Marks>80;
select SID,FName, City, Course, Marks from students where Marks>=87;
select SID,FName, City, Age, Marks from students where Age<25;
select SID, CStart_date, Marks from students where CStart_date>'2022-11-01';
select SID,FName, CIty, Course, Marks from students where City='Delhi';
select SID,FName, CIty, Marks from students where City!='Delhi';


# 2) and, or, in, not in, between
# and - Returns True when both the conditions are True, othewise False
# or - Returns True when any one of the the conditions is True, 
# othewise False
select SID,Fname, City, Course, Marks, age from students
where City='Delhi' and Marks>75;
select SID,Fname, City, Course, Marks, age from students
where City='Delhi' or Marks>75;

select SID,Fname, City, Course, Marks, age from students
where city in ('Delhi','Mumbai','Noida');

select SID,Fname, City, Course, Marks, age from students
where city='Delhi' or City='Mumbai' or City='Noida';

select SID,Fname, City, Course, Marks, age from students
where city not in ('Delhi','Mumbai','Noida');

select SID,Fname, City, Course, Marks, age from students
where city in ('Delhi','Mumbai','Noida') and Marks>80;

select SID,Fname, City, Course, Marks from students
where Marks between 70 and 87;

select SID,Fname, CStart_date, Marks from students
where CStart_Date between '2022-09-01' and '2022-11-30';

# The range in between is inclusive of both the values.

# 3) wildcard filtering - %, _
# % : any number of characters
# _ : Any one character
select * from students;
# Extract all students details whose name starts with A
select * from students where FName like 'a%';
# A% - starting with A followed by n number of chacracters

# Extract all student details whose name ends with n 
select * from students where FName like '%n';

# Extract all student details whose name contains character t
select * from students where FName like '%t%';

# Extract all student details whose name ends with n and 
# name is 5 charcacters long 
select * from students;
select * from students where FName like '____n';

# Extract all student details whose 2nd charcater of name is i
# and its length is not defined.
select * from students where FName like '_i%';


# CRUD - Create Read Update and Delete

# update
# 1) Used to change/modify the data in the table.
# 2) We can modify one row or mutiple rows with filtering condition.
# 3) Entire table can be updated as well.

select * from students;
# update one record(row)
update students set Course='SQL', Marks=90 where SID=58;

# update multiple records(rows)
# update students set Course='Power BI' where Marks>80;

drop table t1;
create table t1(
id int primary key,
prod varchar(20),
sales int,
city varchar(20));

insert into t1 values
(1,'P1',25,'Delhi'),(2,'P2',30,'Noida'),
(3,'P3',15,'Delhi'),(4,'P4',18,'Mumbai');

select * from t1;

# updating multiple rows
update t1 set sales=70 where city='Delhi';

# update all the rows
update t1 set City='Lucknow';

select * from t1;

# delete

create table t2(
id int primary key,
prod varchar(20),
sales int,
city varchar(20));

insert into t2 values
(1,'P1',25,'Delhi'),(2,'P2',30,'Noida'),
(3,'P3',15,'Delhi'),(4,'P4',18,'Mumbai'),
(5,'P5',21,'Noida'),(6,'P6',24,'Pune');

select * from t2;

# delete one row
delete from t2 where id=6;

# delete mutliple rows
delete from t2 where city='Delhi';

# delete all rows
delete from t2;

select * from t2;

# truncate
# Used to delete records
# truncate table t2 where City='Delhi';    Error
truncate table t2;

select * from t2;
describe t2;

# drop 
drop table t2;
select * from t2;


# Types of Commands
#1) DML(Data Manipulation Language)- insert,update,delete
#2) DDL(Data Definition Language)- create,alter,drop,truncate, rename
#3) DQL(Data Query Language) - select 

# delete
# 1) It is DML command.
# 2) It is used to delete one or multiple records from the table.
# 3) It can be used with where clause.
# 4) When delete is used without where clause,
#  it deletes all the records. 
# 5) Delete does not remove the table structure.
# 6) Delete cant delete database.


# truncate
# 1) It is DDL command
# 2) It deletes all the records from the table.
# 3) Where clause cant be used with truncate.
# 4) Table structure is not affected with truncate.
# 5) truncate cant be used to delete database.

# drop
# 1) drop is a DDL command
# 2) Drop deletes the entire data as well as the table structure.
# 3) Where clause cant be used with drop.
# 4) drop can also be used to drop database.



# Alter Query
-- 1) Used to make changes in the structure of the table.
-- 2) There are 4 commands with the alter query
-- a) change - Used to rename a column + add/change its data types +
--             add/change/remove its constraints.
-- b) modify - Used to change the data types of a colum +
--             add/change/remove its constraints
-- c) add -  used to add a new column with its data type + add constraint
-- d) drop - used to drop an exitsing column
-- e) rename - used to rename a column.


# a) alter with change 
# rename column + change data type + add/remove/modify constraint
select * from students;

describe students;
#                         old_col  new_col_name
alter table students change City Location varchar(40) not null;
alter table students change Location Location varchar(40);
# rename Course to subject with datatype varchar(30);
alter table students change Course Subject varchar(30);
 
select * from students;

# b) alter with modify - Used to change the data types
#  of a colum + add/change/remove its constraints
describe students;
alter table students modify Location varchar(30) not null;
# convert data type of subject to varchar(25);


# c) alter with add - add a new col, add its data type
# add constraint
describe students;
alter table students add Email varchar(45);

select * from students;

alter table students add Country varchar(45) default 'India';

alter table students add PIN int 
default 1234 after Location; 
 

select * from students;

# d) alter with drop - drop an existing column
alter table students drop PIN;
alter table students drop Email;
alter table students drop Country;
select * from students;
# alter table students drop Email, Country;
SELECT * FROM students;
alter table students drop EMAIL;

# Alter with rename
select * from students;
alter table students rename column Subject to Course;
# alter table students rename Location to City;

# change, modify, add, drop, rename

# Rename the table
select * from students;
rename table students to student;
#         old_table_name  new_table_name

select * from student;
describe student;

# Insert null values
# Insert data into table in a custom order of columns
select * from student;

insert into student
(Location,Course,CStart_date,SID,FName,Age,Marks) values
('Mumbai',null,'2022-11-24',62,'Arpit',25,72),
('Delhi','Python','2022-12-16',63,'Vyshakh',null,81);

select * from student;


# Aggregate Functions - sum, avg, min, max, count
select min(marks), max(marks),avg(marks) from student;
select sum(marks), count(marks) from student;
select * from student;

# Count total number of rows
select count(*) from student;

select count(age),count(fname) from student;

# count does not count null values

# Alias - providing alternate column/table names
select min(marks) as MinMarks, max(marks) as MaxMarks from student;
select min(marks) MinMarks, max(marks) MaxMarks from student;

# distinct
# Used to fetch unique(non-duplicate) values
select distinct course from student;
select distinct(course) from student;

# Count distinct course names
select count(distinct(course)) DistinctCourse from student;
select count(distinct course) DistinctCourse from student;

# Sorting - asc, desc
# default sorting order is ascending, asc is optional
select * from student;
select * from student order by FName; # asc
select * from student order by FName asc; 
select * from student order by FName desc; # desc

# Extract all student deatils where Course is in asc order and
# marks is in desc order wrt Course.
select * from student order by Course, marks desc; 
select * from student order by Course desc, marks; 

# Extract all student details where City is Delhi or Mumbai.
# Sort the result in desc order of Marks.
select * from student where location in ('Delhi','Mumbai')
order by Marks desc;

select * from student where location like '%i'
order by Marks desc;


# Group by
# 1) Used with aggragtaed functions.
# 2) The columns present in group by must be present in select.
# 3) 

# Q) Find Course wise avg marks from student;
select Course, avg(marks) AvgMarks from student 
group by Course;

# Q) Find Course and City wise min marks from student table;
select Course,location, min(marks) MinMarks from student 
group by Course,location
order by Course;

select Course,location, min(marks) MinMarks, 
max(marks) MaxMarks from student 
group by Course,location
order by Course;

# Find location wise sum of Marks where location is Delhi, 
# Noida, Bangalore or Mumbai. Sort the result in asc order of location

select location, sum(marks) from student
where location in ('Delhi','Noida','Mumbai','Bangalore')
group by location
order by location;

# Find location wise sum of Marks where sum of Marks is more 
# than 300. Sort the result in asc order of location
select location, sum(marks) from student
where sum(marks)>300
group by location
order by location;

select location, sum(marks) SumMarks from student
where  SumMarks>300
group by location
order by location;

select location as City, sum(marks) SumMarks from student
where City in ('Delhi','Mumbai')
group by location
order by location;


# Having
# 1) It is used for filtering.

select location, sum(marks) from student
group by location
having sum(marks)>200;

select location, sum(marks) SumMarks from student
group by location
having SumMarks>200;

select location as City, sum(marks) SumMarks from student
group by location
having City in ('Delhi','Mumbai') order by location;

# The column present in having for filtering must be present in 
# select query as well.

select * from student;

select FName, Location, Course, Marks from student
where Age>=24;

# Error
select FName, Location, Course, Marks from student
having Age>=24;

select FName, Location, Course, Marks,Age from student
having Age>=24;

 
-- where
-- 1) It cant be applied on aggregate functions and aliased
--     column names.
-- 2) It is used before group by clause.
-- 3) It is used for filtering

-- having
-- 1) It can be applied on aggregate functions and aliased 
--    column names.
-- 2) It is used after group by clause.
-- 3) It can be used with non-aggregated functions as well for 
--    filtering.
-- 4) Having can be used without group by.
-- 5) The column present in having for filtering must be present in 
--    select query as well.


# Basics
# DDL,DML,DQL, commands
# sorting, filtering, aggregate functions, alias
# where, having, group by










