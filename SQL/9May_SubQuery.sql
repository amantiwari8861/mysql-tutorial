
-- Sub Queries
-- 1) A query nested within another query is called a sub query
-- 2) They separate complex business logic from main query.
-- 3) They can be written in select, from, where, join and having clauses. 
use demo2;

-- stu1(SID, Name, email, age, score, C_ID)
-- course(CID,CName, start_date)
-- stu1_bio(Stu_ID, city, degree, grad_year,cgpa)

-- Q1) Write a query for extracting the students details for the 
-- student who has obtained the maximum score.

# Method-1
select max(score) from stu1;  # 93
select * from stu1 where score=93; 

# (Error) - Incorrect Approach
select * from stu1 where score=max(score); 

# Method-2
select * from stu1 order by score desc limit 2;

# Method-3 (using sub query)
select * from stu1 where score = 
(select max(score) from stu1);  # 93

# select * from stu1 where score = 93;

-- Q2) Find the student ID, their degree, their cgpa for the 
-- students whose cpga is higher than the avg cgpa obtained 
-- by all the students.

select Stu_id,degree,grad_year,cgpa from stu1_bio where cgpa>
(select avg(cgpa) from stu1_bio);  # 7.28125

-- Q3) Find the student ID, their degree, their cgpa for the 
-- students whose cpga is higher than the avg cgpa obtained
-- by all the students and where degree is BTECH

select Stu_id,degree,cgpa from stu1_bio where cgpa>
(select avg(cgpa) from stu1_bio)  # 7.28125
and degree='BTECH';

-- Q4) Find the student ID, their degree, their cgpa for the 
-- students whose cpga is higher than the avg cgpa obtained 
-- by all the students who have BTECH degree

select Stu_id,degree,cgpa from stu1_bio where cgpa>
(select avg(cgpa) from stu1_bio where degree='BTECH');  # 7.429

-- Q3) Find the student ID, their degree, their cgpa for the 
-- students whose cpga is higher than the avg cgpa obtained
-- by all the students and where degree is BTECH.
-- Q4) Find the student ID, their degree, their cgpa for the 
-- students whose cpga is higher than the avg cgpa obtained 
-- by all the students who have BTECH degree.


# Types of Sub-Query
# 1) Single Row Subquery
# When the inner query(sub query) returns a single row and 
# a single column as response to the outer query. 

-- Ex1
select Stu_ID,degree,cgpa from stu1_bio where cgpa > 
(select avg(cgpa) from stu1_bio);   -- 7.28125

-- Ex2
select SID,Age,C_ID,score from stu1 where score < 
(select avg(score) from stu1);  -- 76.6818

# 2) Multiple row subquery
# Subquery/Inner Query that returns multiple rows as its output

# Ex1
# Using subquery, display all details from stu1_bio where cgpa is  
# fetched for the students who dont belong to Delhi
# Mumbai or Bangalore

select * from stu1_bio where cgpa in
(select cgpa from stu1_bio where city 
not in ('Delhi','Mumbai','Bangalore'));
-- 7.6,7.7,6.7,8.3,7

# Ex2
select * from stu1_bio where cgpa in
(select cgpa from stu1_bio where cgpa>7.5);
-- 7.6,8,8.1,7.7,8.4,8.3

-- stu1(SID, Name, email, age, score, C_ID)
-- course(CID,CName, start_date)
-- stu1_bio(Stu_ID, city, degree, grad_year,cgpa)

select * from stu1_bio;

-- 3) Multiple row, multiple column sub query
# Ex1
select * from stu1_bio where (cgpa,grad_year) in
(select cgpa,grad_year from stu1_bio where 
grad_year>'2019' and cgpa>7.5);

# Ex2
select * from stu1_bio where (cgpa,grad_year) not in
(select cgpa,grad_year from stu1_bio where 
grad_year>'2019' and cgpa>7.5);


-- 4) Nested sub query
-- Sub query within another sub query is called nested sub query
-- It is used to fetch common records from multiple tables.

-- stu1(SID, Name, email, age, score, C_ID)
-- course(CID,CName, start_date)
-- stu1_bio(Stu_ID, city, degree, grad_year,cgpa)

-- Ex1
# Q) Using nested sub-query fetch CID,CName and Start_date
# for students whose degree is BCOM or BTECH. 

select * from course where CID in (219,215,216,215,221,215);

select CID,CName, Start_date from course where CID in  -- (215,216,219,221)
(select C_ID from stu1 where SID in -- (11,13,15,16,18,21,24)
(select Stu_ID from stu1_bio where degree in ('BCOM','BTECH'))
); 

# IQ2 : returns Stud_ID -(11,13,15,16,18,21,24)
# IQ1 : returns C_ID - (219,215,216,215,221,215)
# OQ : returns CID,CName, Start_date from Course where CID in (219,215,216,215,221,215)

# Ex2
# Q) Using nested sub-query extract student detail whose score is
# greater than avg score obtained by students whose Course start
# date is on or before 1st May 2019.
 
select * from stu1 where score >
(select avg(score) from stu1 where C_ID in
(select CID from course where start_date<='2019-05-01'));

# IQ2 : returns CID - (215,220,224)
# IQ1 : returns Acg(score) - 77.50
# OQ : returns * from stu1 where score>77.50

-- 5) Correlated Sub-Query
-- 1) A sub query that has its reference in its outer query is 
--  correlated sub query.
-- 2) Correlated Sub query executes for each row of parent query
-- 3) So they cant be evaluated independently.
-- 4) Results of sub query are dependent upon active row being evaluated.
-- 5) where clause used in correlated sub-query is used to link 
-- outer and inner query based on the condition on which the data 
-- is retrieved.
-- 6) In nested sub-query the where clause is used link the common
-- column based on the condition on which the data 
-- is retrieved.


-- Q) Find Student details in each course(i.e. CID) who has scored 
-- more than avg(score) in that course.

select C_ID,score from stu1 order by C_ID;
select c_id, avg(score) from stu1 group by c_id;
-- CID(scores)        - avg_score
-- 215(93,89,77,77)   - 84
-- 216(70,82)         - 76
-- 217(91)             -91
-- 218(62)             -62
-- 219(87,64,77,77)    -76.25
-- 220(75,65,62,82)    -71.00
-- 221(58,62)          -60
-- 222(82)             -82

select * from stu1 order by C_ID;

select * from stu1 s1 where score >
(select avg(score) from stu1 s2 where s2.C_ID = s1.C_ID)
order by s1.C_ID;

# Outer Query(s1), Row1 , CID = 215
# Inner Query(s2), where CID=215, Scores =(93,89,77,77)
# Inner Query computes avg of  Scores =(93,89,77,77) : avg = 84

-- Ex2
-- Q) Find Student details from stu1_bio in each City
-- who has obtained more cgpa than avg(cgpa) in that City.

select * from stu1_bio b1 where cgpa>
(select avg(cgpa) from stu1_bio b2 where b1.city = b2.city)
order by b1.city; 


-- Where can we use sub query
-- 1) where
-- 2) from   - aliasing is required(derived table or temp table)
-- 3) having
-- 4) join  - aliasing is required
-- 5) select - aliasing is preferred

-- stu1(SID, Name, email, age, score, C_ID)
-- course(CID,CName, start_date)
-- stu1_bio(Stu_ID, city, degree, grad_year,cgpa)

-- Sub Queries in where
select * from course where CID in
(select CID from course where start_date>'2019-07-01');
-- 217,218,221,223,225,227

# select * from course where CID in (217,218,221,223,225,227)

-- Sub Query in From clause 
-- We need to use derived table or temp table name as alias

-- Ex1
select SID, name from 
(select SID,name from stu1 where score>80) as dt;

select SID, name,score from 
(select SID,name,score from stu1 where score>80) dt;

select SID from (select SID,name from stu1 where score>85) dt;   -- correct
select SID,name from (select SID from stu1 where score>80) dt;   -- incorrect 

-- stu1(SID, Name, email, age, score, C_ID)
-- course(CID,CName, start_date)
-- stu1_bio(Stu_ID, city, degree, grad_year,cgpa)

-- Ex2
# Q) Using subquery extract degree wise avg cgpa for those students
# who belong to either Delhi or Mumbai. Use subquery in from clause.

# Without sub-query
select degree, avg(cgpa) from stu1_bio 
where city in ('Delhi','Mumbai')
group by degree;

# BCOM(7.5), BTech(7.65), MA(8.10), BCA(7.199),BA(6.80)

# Method-1
select degree, avg(cgpa) from 
(select degree, cgpa from stu1_bio 
where city in ('Delhi','Mumbai')) dt
group by degree;

# Method-2 
select degree, AvgCGPA from 
(select degree, avg(cgpa) AvgCGPA from stu1_bio
where city in ('Delhi','Mumbai')
group by degree) dt;

-- Sub query in having
-- Ex1

# Q) Using subquery display avg score of students based on C_ID 
# bearing avg score greater than avg score obtained by 
# student aged 22.

select C_ID, avg(score) from stu1
group by C_ID
having avg(score) > 
(select avg(score) from stu1 where age=22);  -- 75.667


select C_ID, avg(score) from stu1
group by C_ID
having avg(score) > 
(select score from stu1 where age=22);  -- 75.667

# having avg(score) > (93,70,64)

select C_ID, avg(score) from stu1
group by C_ID
having avg(score) > 
(select avg(score) from stu1 where age=22)
and C_ID in (215,219,222);

-- Ex2
# Q) Using subquery display avg cgpa of students based on degree 
# having avg cgpa greater than avg cgpa obtained by 
# students whose graduation year is 2020

select degree,avg(cgpa) AvgCGPA from stu1_bio
group by degree
having avg(cgpa) >
(select avg(cgpa) from stu1_bio where grad_year='2020');  # 7.324

select degree,avg(cgpa) from stu1_bio
group by degree
having avg(cgpa) >
(select avg(cgpa) from stu1_bio where grad_year='2020'
and degree not in ('BCOM','BA'));  # 7.599

-- Sub query in join
-- The subquery actually returns a temporary table which is handled by database
-- server in memory. The temporary table from the subquery is given an alias so 
-- that we can refer to it in the outer select statement. 

# Ex1
# Q) Write a query for extracting the students data for the 
# students who scored the maximum score. 

select * from stu1 where score =
(select max(score) from stu1);

select * from stu1 s  # left table
join (select max(score) ms from stu1) MaxScore  # right table
on s.score = MaxScore.ms;

# 1) ms is the alias name for the column containing max(score) 
# in inner query
# 2) MaxScore is the alias name for the inner query
# 3) s is the alias name for the stu1 table in outer query.

-- Ex2
# Q2) Using subquery display all details from stu1_bio table 
# where students cgpa is minimum. Use sub query in join.

select * from stu1_bio b
join (select min(cgpa) MinCG from stu1_bio) dt
on b.cgpa = dt.MinCG;

select * from stu1_bio where cgpa =
(select min(cgpa) from stu1_bio);


-- Ex3
-- Q3) Find the student ID, their degree, their cgpa for the 
-- students whose cpga is higher than the avg cgpa obtained 
-- by all the students. Use sub Query in Join

select Stu_id,degree,cgpa from stu1_bio where cgpa >
(select avg(cgpa) from stu1_bio);  # 7.28125

select stu_id,degree,cgpa from stu1_bio b
join (select avg(cgpa) AvgCGPA from stu1_bio) dt
on b.cgpa > dt.AvgCGPA;

select stu_id,degree,cgpa from stu1_bio 
join (select avg(cgpa) AvgCGPA from stu1_bio) dt
on stu1_bio.cgpa > dt.AvgCGPA;

select stu_id,degree,cgpa from stu1_bio b
join (select avg(cgpa) AvgCGPA from stu1_bio) dt
# stu1_bio.cgpa > dt.AvgCGPA;  # working code
# having b.cgpa > 7.28125;   # working code
# where b.cgpa > dt.AvgCGPA;   # working code
having b.cgpa > dt.AvgCGPA;

-- stu1(SID, Name, email, age, score, C_ID)
-- course(CID,CName, start_date)
-- stu1_bio(Stu_ID, city, degree, grad_year,cgpa)

select s.SID,s.Name,s.age,s.score,s.C_ID,c.cname,c.start_date,c.CID
from stu1 s
join course c
on s.C_ID = c.cid;   # working code
# where s.C_ID = c.cid;  # working code
# having s.C_ID = c.cid; # working code

# In Having clause, the columns on filtering condition is applied
# must be present in select clause columns.

select stu_id,degree,cgpa,
(select avg(cgpa) AvgCGPA from stu1_bio) AvgCGPA
from stu1_bio
having cgpa > AvgCGPA;

-- Sub queries in select
-- Ex1
select s.sid,s.name,s.score,
(select c.cid from course c
where c.cid = s.c_id) as CID
from stu1 s;

# Stu1 (C_ID) - might be duplicated
# Course (CID) - all unique CID

# Incorrect - SubQuery returns more than 1 row
select cname,c.start_date,
(select s.c_id from stu1 s
where c.cid = s.c_id) as C_ID
from course c;

select c.cname,c.CID,c.start_date,s.Name,s.age,s.score,s.C_ID
from stu1 s
join course c
on s.C_ID = c.cid
order by c.cname;

# Ex3
select sid,name,
(select b.cgpa from stu1_bio b
where b.stu_id = s.sid) as CGPA
from stu1 s;

select sid, name, (select avg(age) from stu1) AvgAge 
from stu1 s;

# Incorrect - Sub-Query returns more than 1 row.
select sid, name, (select SID from stu1) SID 
from stu1 s;

-- any()
-- 1) The ANY operator returns TRUE if some/any of the sub query value
-- meets the condition 

-- all()
-- The all operator returns TRUE if all of the sub query value
-- meets the condition.

# Examples of any and all
select SID,Name,Age,Score,C_ID from stu1 where Score = any
(select score from stu1 where age=22); -- 93,70,64

# select SID,Name,Age,Score,C_ID from stu1 where Score = any
# (93,70,64)

select SID,Name,Age,Score,C_ID from stu1 where Score in
(select score from stu1 where age=22); -- 93,70,64

select SID,Name,Age,Score,C_ID from stu1 where Score not in
(select score from stu1 where age=22); -- 93,70,64

# Not recommended
select SID,Name,Age,Score,C_ID from stu1 where Score <> any
(select score from stu1 where age=22); -- 93,70,64

select SID,Name,Age,Score,C_ID from stu1 where score > all
(select score from stu1 where age=21);  -- 62,62,62,89

select SID,Name,Age,Score,C_ID from stu1 where score > any
(select score from stu1 where age=21); -- 62,62,62,89

# Not recommended
select SID,Name,Age,Score,C_ID from stu1 where score = all
(select score from stu1 where age=21);  -- 62,62,62,89

select SID,Name,Age,Score,C_ID from stu1 where score = all
(select score from stu1 where SID=14);  # 65

select SID,Name,Age,Score,C_ID from stu1 where Score <> all
(select score from stu1 where age=22);  -- 93,70,64

select SID,Name,Age,Score,C_ID from stu1 where Score not in
(select score from stu1 where age=22);  -- 93,70,64


-- exists/not exists - Return True or False

-- exists - If the subquery returns at least one row, the EXISTS operator 
-- returns True, otherwise, it returns false.

-- not exists - NOT EXISTS returns true if the subquery returns no row, 
-- otherwise it returns false.

select * from stu1;
select * from course;

-- SID - 30,31,32 (excluded)
-- CID - 223,224,225,227(excluded)

# The below query is behaving as inner join
select * from stu1 s where exists 
(select CID from Course c where s.C_ID = c.CID);

##### Check how the below query is working with incorrect
# Column name of C_ID from course table.
select * from stu1 s where exists 
(select C_ID from Course c where s.C_ID = c.CID);

# select C_ID from course;

# Assuming Left(stu1) and right(course)
# Non-matching records from left table
select * from stu1 s where not exists 
(select CID from Course c where s.C_ID = c.CID);

select * from course c where exists
(select C_ID from stu1 s where c.CID = s.C_ID);

select * from course c where not exists
(select C_ID from stu1 s where c.CID = s.C_ID);




