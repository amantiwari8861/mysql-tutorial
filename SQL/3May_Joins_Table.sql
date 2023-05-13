
create database demo2;
use demo2;

-- Joins 
-- 1) Used to combine multiple related tables.
-- 2) Types of Joins - inner, outer, left, right, cross-join, self-join 
-- 3) To create joins in 2 tables - there must be a common column
-- 4) Foreign Key - Common column which refers to the primary key of 
-- another table 

-- Course (Course_ID(PK),CName,Start_date,duration...)
-- Students (S_ID(Pk),Name,age,City,C_ID(Fk),....)

drop table course;
drop table stu1;
drop table stu1_bio;

create table course(
CID int primary key,
CName varchar(20) not null,
start_date date not null
);

insert into course (CID,CName,start_date)
values
(215,'Data Science','2019-04-15'),
(216,'ML','2019-06-20'),
(217,'SQL','2019-08-05'),
(218,'R Programming','2019-07-10'),
(219,'Deep Learning','2019-05-25'),
(220,'Apache Spark','2019-03-01'),
(221,'Tableau','2019-10-01'),
(222,'Power BI','2019-11-01'),
(224,'Excel','2019-05-01'),
(223,'Linux','2019-12-01'),
(225,'Statistics','2019-10-15'),
(227,'NLP','2019-08-15');

select * from course;

create table stu1(
SID int primary key,
Name varchar(30) not null,
email varchar(50),
age int,
score int,
C_ID int,
foreign key (C_ID) references course(CID) 
);


insert into stu1 (SID,Name,email,age,score,C_ID)
values 
(11,'Ankit','a1@gmail.com',23,87,219),
(12,'Peeyush','a2@gmail.com',24,75,220),
(13,'Gaurav','a3@gmail.com',22,93,215),
(14,'Lakshya','a4@gmail.com',25,65,220),
(15,'Paritosh','a5@gmail.com',22,70,216),
(16,'Ujjwal','a6@gmail.com',24,89,215),
(17,'Neha','a7@gmail.com',24,91,217),
(18,'Shreya','a8@gmail.com',25,58,221),
(19,'Mudit','a9@gmail.com',22,64,219),
(20,'Shrishti','a10@gmail.com',21,62,220),
(21,'Smriti','a11@gmail.com',24,77,215),
(22,'Garima','a12@gmail.com',25,82,216),
(23,'Akshay','a13@gmail.com',21,62,218),
(24,'Ayush','a14@gmail.com',24,77,215),
(25,'Krishna','a15@gmail.com',25,82,220),
(26,'Udit','a16@gmail.com',21,62,221),
(27,'Tanmay','a17@gmail.com',24,77,219),
(28,'Tarun','a18@gmail.com',25,82,222),
(29,'Divya','a19@gmail.com',24,77,219),
(30,'Rohit','a20@gmail.com',25,93,null),
(31,'Jatin','a21@gmail.com',21,89,null),
(32,'Siddharth','a22@gmail.com',25,73,null);

create table stu1_bio(
 Stu_ID int not null primary key,
 city varchar(30),
 degree varchar(15),
 grad_year year,
 cgpa float,
 foreign key (stu_id) references stu1(SID)
 );
 

insert into stu1_bio
values
(11,'Delhi','BCOM','2018',7.5),
(12,'Noida','BA','2019',7.6),
(13,'Mumbai','BTECH','2017',8.0),
(14,'Delhi','MA','2018',8.1),
(15,'Pune','BTECH','2020',7.7),
(16,'Mumbai','BTECH','2021',7.3),
(17,'Mumbai','BCA','2021',7.2),
(18,'Bangalore','BCOM','2018',6.3),
(19,'Chennai','BA','2019',6.7),
(20,'Bangalore','MCA','2020',8.4),
(21,'Pune','BCOM','2019',8.3),
(22,'Bangalore','BA','2020',6.5),
(23,'Bangalore','MCA','2019',6.4),
(24,'Noida','BTECH','2020',6.7),
(25,'Delhi','BA','2021',6.8),
(26,'Noida','MA','2019',7.0);

select * from stu1; -- 22 records
-- (SID,Name,email,age,score,C_ID)
select * from course;  -- 12 records
-- (CID,CName, Start_date)
select * from stu1_bio; -- 16 records
-- (Stu_ID,City,Degree,grad_year,cgpa)

select count(distinct(C_ID)) from stu1;

select distinct(C_ID) from stu1;
-- 215,216,217,218,219,220,221,222, null

select distinct(CID) from course; 
-- 215,216,217,218,219,220,221,222,223,224,225,227

# Common CID in both tables (Stu1 and Course)
# 215,216,217,218,219,220,221,222

-- Inference
-- SID - 30,31,32 are not enrolled in any course
-- No student has enrolled for course with CID - 223,224,225,227

# left join (Left table - stu1, Right table - course)
# all stu1 ID including SID 30,31,32

# Right join (Left table - stu1, Right table - course)
# all course  details including CID - 223,224,225,227

# Types of Joins
# 1) Inner Join
# Returns the matching records(common records) from both the tables for 
# the selected columns.

-- stu1(SID,Name,email,age,score,C_ID)
-- course(CID,CName, Start_date)
-- stu1_bio(Stu_ID,City,Degree,grad_year,cgpa)

# s is the alias for stu1
# c is the alias for course

select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from course c       # left table
inner join stu1 s   # right table
on s.c_id = c.cid;

select s.*,c.*
from course c       # left table
inner join stu1 s   # right table
on s.c_id = c.cid;

select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from course as c       # left table
inner join stu1 as s   # right table
on c.cid = s.c_id;

# Default join is inner join
select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from course c       # left table
join stu1 s         # right table
on s.c_id = c.cid;

# Implementing Joins without join keyword
select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from stu1 s, course c
where s.c_id = c.cid;

-- stu1(SID,Name,email,age,score,C_ID)
-- course(CID,CName, Start_date)
-- stu1_bio(Stu_ID,City,Degree,grad_year,cgpa)

# Find Cname wise avg Score in desc order of Avg Score
select c.cname, avg(s.score) AvgScore from stu1 s
join course c
on s.c_id = c.cid
group by c.cname
order by AvgScore desc;

select c.cname, avg(s.score) AvgScore
from stu1 s, course c
where s.c_id = c.cid
group by c.cname
order by AvgScore desc;

# Ex :- Fetch SID, Name, Score,Age, Course name, Start_date where
# course name is either ML or Deep Learning and Age is more than 23.
# Arrange result in descreaing order of score.

select s.SID,s.name,s.score,s.age,c.cname,c.start_date
from stu1 s
join course c
on s.c_id = c.cid
where c.cname in ('ML','Deep Learning') and s.Age>23
order by s.score desc;


# 2 Table Joins (Use Inner Join)
-- Q1) Fetch SID, Name, Score, Course name, Start_date where 
-- Score is greater than 80 and start_date is in Quarter3.

select s.SID,s.name,s.score,c.cname,c.start_date
from stu1 s
join course c
on s.c_id = c.cid
where s.score>80 and quarter(c.start_date)=3;
#                    July, Aug, Sept

select s.SID,s.name,s.score,c.cname,c.start_date
from stu1 s, course c
where s.c_id = c.cid and s.score>80 and quarter(c.start_date)=3;

-- Q2) Find Course name wise Avg_score where Avg_Score<80 and 
-- CName is not R Programming or Deep Learning.

select c.cname, avg(s.score)
from stu1 s
join course c
on s.c_id = c.cid
# where c.cname not in ('R Programming','Deep Learning')
group by c.cname
having avg(s.score)<80 and
c.cname not in ('R Programming','Deep Learning');


-- Q3) Find student ID,name,age,score,course_name where age is greater than 
-- equal to 23 and course name is not ML, data science or Tableau.

select s.SID,s.name,s.age,s.score,c.cname
from stu1 s
join course c
on s.c_id = c.cid
where s.age>=23 and c.cname not in ('ML','Data Science','Tableau');

-- Q4) Select all student and course related details where course 
-- start_date is in Jun,July or Aug

select * from course;

select s.*,c.*
from stu1 s
join course c
on s.c_id = c.cid
# where month(c.start_date) in (6,7,8);
# where monthname(c.start_date) in ('June','July','August');
where c.start_date between '2019-06-01' and '2019-08-31';



-- Q5) Find course start date quarter and course name wise 
-- Avg_Score. Arrange result in descending order of Avg_Score

select quarter(c.start_date) Qtr, c.cname, avg(s.score) AvgScore
from stu1 s
join course c
on s.c_id = c.cid
group by Qtr, c.cname
order by AvgScore desc;

select quarter(c.start_date) Qtr, c.cname, avg(s.score) AvgScore
from stu1 s
join course c
on s.c_id = c.cid
group by Qtr, c.cname
order by Qtr, AvgScore desc;

-- Q6) Find course start month wise avg score. 

select month(c.start_date) Course_Start_Month, avg(s.score)
from stu1 s
join course c
on s.c_id = c.cid
group by Course_Start_Month
order by Course_Start_Month;

-- Left Join
-- It returns all the records from the left table(for the selected columns)
-- and matching records from both the tables.

select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from stu1 s            # left table
left join course c     # right table
on s.c_id = c.cid;

select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from stu1 s                  # left table
left outer join course c     # right table
on s.c_id = c.cid;

select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from course c            # left table
left join stu1 s         # right table
on c.cid = s.c_id;

-- Right join
-- It returns all the records from the right table(for the selected columns)
-- and matching records from both the tables.

select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from stu1 s            # left table
right join course c     # right table
on s.c_id = c.cid;

select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from stu1 s                   # left table
right outer join course c     # right table
on s.c_id = c.cid;


# Assumption, Left Table (stu1) and Right Table(course)


# Fetch non-mathcing records from left table using left join
select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from stu1 s            # left table
left join course c     # right table
on s.c_id = c.cid
where c.cid is null;

# Fetch non-mathcing records from right table using right join
select s.SID,s.Name,s.score,s.c_id,c.cid,c.cname, c.start_date
from stu1 s            # left table
right join course c     # right table
on s.c_id = c.cid
where s.c_id is null;

-- Full Join
-- Returns everything from both tables(for the selected columns)

-- For SID - 30,31,32 are not enrolled in any course
-- No student has enrolled for course with CID - 223,224,225,227


# 3 table Joins (Multiple table Joins)

-- stu1(SID,Name,email,age,score,C_ID)
-- course(CID,CName, Start_date)
-- stu1_bio(Stu_ID,City,Degree,grad_year,cgpa)

select s.sid,s.name,s.age,s.score,c.cid,c.cname,c.start_date,
b.city,b.degree,b.grad_year,b.cgpa
from stu1 s 
join course c on s.c_id = c.cid  
join stu1_bio b on b.stu_id= s.sid;


select s.*,c.*,b.*
from stu1 s 
join course c on s.c_id = c.cid  
join stu1_bio b on b.stu_id= s.sid;


# group by, order by, where, having

#  3 table Joins (Use Inner join)

-- Q1) Select SID, student name, student city, student degree, 
-- course name,course_start_date where course name is 'Data Science'.
select s.SID,s.name,b.city,b.degree,c.cname,c.start_date
from stu1 s 
join course c on s.c_id = c.cid  
join stu1_bio b on b.stu_id= s.sid
where c.cname='Data Science';

-- Q2) Select SID, student name, course name, for students who are enrolled 
-- in a course. Every student selected must have graduated in the year 2019 
-- or afterwards.
select * from stu1_bio;

select s.SID,s.name,c.cname,b.grad_year
from stu1 s 
join course c on s.c_id = c.cid  
join stu1_bio b on b.stu_id= s.sid
where b.grad_year>=2019;

-- Q3) Find the course wise avg score of students who belong to 
-- either Delhi, Mumbai or Bangalore city.

select c.cname,avg(s.score) AvgScore
from stu1 s 
join course c on s.c_id = c.cid  
join stu1_bio b on b.stu_id= s.sid
where b.city in ('Delhi','Mumbai','Bangalore')
group by c.cname;

-- Q4) Find CGPA,score, name, course name,grad_year and year_gap of students
-- whose degree is not in ('BA','MA') and
-- whose grad year has not more than 3 yrs gap compared to 
-- current year.

select b.cgpa,s.score,s.name,c.cname,b.degree,b.grad_year,
year(now()) - b.grad_year as Year_Gap
from stu1 s 
join course c on s.c_id = c.cid  
join stu1_bio b on b.stu_id= s.sid
# where b.degree not in ('BA','MA')
having b.degree not in ('BA','MA') and Year_gap<=3;

-- stu1(SID,Name,email,age,score,C_ID)
-- course(CID,CName, Start_date)
-- stu1_bio(Stu_ID,City,Degree,grad_year,cgpa)

# Common CID in both tables (Stu1 and Course)
# 215,216,217,218,219,220,221,222

-- Inference
-- SID - 30,31,32 are not enrolled in any course
-- No student has enrolled for course with CID - 223,224,225,227


# Full-Join
# Returns everything from both the tables for the selected columns
select s.SID,s.Name,s.age,s.score,c.cname,c.start_date,c.CID
from stu1 s left join course c on s.C_ID = c.cid
union
select s.SID,s.Name,s.age,s.score,c.cname,c.start_date,c.CID
from stu1 s right join course c on s.C_ID = c.cid;

select s.*,c.* 
from stu1 s left join course c on s.C_ID = c.cid
union
select s.*,c.* 
from stu1 s right join course c on s.C_ID = c.cid;

# Fetch non-mathcing records from both the tables using full join
select * from (
select s.SID,s.Name,s.age,s.score,s.C_ID,c.cname,c.start_date,c.CID
from stu1 s left join course c on s.C_ID = c.cid
union
select s.SID,s.Name,s.age,s.score,s.C_ID,c.cname,c.start_date,c.CID
from stu1 s right join course c on s.C_ID = c.cid) as t
where t.C_ID is null or t.CID is null;


-- Self join
-- 1) Joining a table with itself is called self-join.
-- 2) Used specially when foreign key references to its own primary key.
-- 3) Self Join can be understood as join of two copies of same table.
-- 4) Each row of the table is combined with itself and with every other row of the table. 

# drop table employee;

create table employee(
emp_id varchar(5) primary key,
emp_name varchar(20),
dt_of_join date,
emp_supv varchar(5),
foreign key(emp_supv) references employee(emp_id));

insert into employee values
(27863,'Ankit Sinha', '2018-06-13',null),
(27865,'Mridul Paliwal', '2019-08-14',27863),
(27867,'shweta Sharma', '2020-12-25',27865),
(27869,'Vinay Verma', '2019-03-20',27867),
(27871,'Pratyush Singh', '2019-05-20',27865),
(27873,'Ranveer Pratap', '2020-01-22',27863);

select * from employee;

-- Ex1 - Find all the employees and their supervisors from employee table
-- (emp_id,emp_name,sup_id,sup_name)

select * from employee;

select a.emp_id as Emp_ID,a.emp_name as Emp_Name,
b.emp_id as SupID,b.emp_name as Sup_Name
from employee a, employee b
where a.emp_supv = b.emp_id;

-- OR

select a.emp_id as Emp_ID,a.emp_name as Emp_Name,
b.emp_id as SupID,b.emp_name as Sup_Name
from employee a inner join employee b
on a.emp_supv = b.emp_id;


# Cross Join
# 1) Generates catesian product of 2 tables.
# 2) on clause is not required.
# 3) Can also be used on 2 tables having no common column.


select * from stu1; -- 22 records
select * from course; -- 12 records

select 22*12;

select s.SID,s.name,s.score,c.cname,c.start_date
from stu1 s
cross join course c;

select s.SID,s.name,s.score,c.cname,c.start_date
from stu1 s
cross join course c
where s.SID = 21;

# Cross Join as Inner Join
select s.SID,s.name,s.score,c.cname,c.start_date,c.CID
from stu1 s
cross join course c
on s.C_ID = c.CID;


# Case Statement - Conditional Statement
-- Q1) For the stu1 table, display SID,Name,Age,Score and 
--     a column Remarks as per the following rules:-
-- a) if score is between 0 and 70, then Remarks = 'Practice_Req'
-- b) if score is between 71 and 80, then Remarks = 'Avg'
-- c) if score is between 81 and 90, then Remarks = 'Good'
-- d) if score is between 91 and 100, then Remarks = 'Outstanding'
-- e) otherwise 'Invalid'

select SID,name,age,score,case
when score>=0 and score<=70 then 'Practice_req'
when score>=71 and score<=80 then 'Avg'
when score>=81 and score<=90 then 'Good'
when score>=91 and score<=100 then 'Outstanding'
else 'Invalid'
end as Remarks
from stu1;

-- Limit
select score from stu1 order by score; 
-- 58,62,62,62,64,65,70,73,75,77,...
select score from stu1 order by score desc;
-- 93,93,91,89,89,87,82,.... 

-- Syntax1 : limit n, where n is the number of rows
select score from stu1 order by score limit 1; -- smallest value
select score from stu1 order by score limit 3; -- smallest 3 values
select score from stu1 order by score desc limit 5; -- top 4 highest score in desc order
select cgpa from stu1_bio order by cgpa desc limit 6; -- top 6 cgpa
select cgpa from stu1_bio limit 5;   -- top 5 rows from cgpa without any order


-- Find nth highest/lowest value
-- Syntax -
-- Find nth highest : limit n-1,1

-- select col_name from table_name order by col_name desc/asc limit offset(n-1), no_of_rec

select score from stu1 order by score; 
-- 58,62,62,62,64,65,70,73,75,77,...
select score from stu1 order by score desc;
-- 93,93,91,89,89,87,82,.... 

# Fetch 3rd highest score from stu1 => n=3
# 3rd highest - nth highest -> limit n-1,1, limit 2,1
# nth highest , n=3, n-1 = 2
select score from stu1 order by score desc limit 2,1;

# Find 3rd and 4th highest scores from stu1
select score from stu1 order by score desc limit 2,2;

# Find 2nd, 3rd and 4th lowest scores from stu1
select score from stu1 order by score limit 1,3;
select score from stu1 order by score limit 1;

# Find lowest score
select score from stu1 order by score limit 0,1;

# Find 1st,2nd and 3rd highest scores
select score from stu1 order by score desc limit 0,3;


