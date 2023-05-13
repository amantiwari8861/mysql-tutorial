
create database win_fun;
use win_fun;

-- window functions
-- rank(), dense_rank(), row_number(), lead(), lag(), ntile()

-- rank and dense_rank()
-- 1) dense_rank()
-- a) The DENSE_RANK() is a window function that assigns a rank to each row 
-- within a partition or result set with no gaps in ranking values.
-- b) Basically, the ranks are assigned in a consecutive manner i.e if there is a 
-- tie between values then they will be assigned the same rank, and next rank 
-- value will be one greater then the previous rank assigned.

-- 2) rank()
-- a) This function will assign rank to each row within a partition with gaps. 
-- b) Here, ranks are assigned in a non-consecutive manner i.e if there is a tie 
-- between values then they will be assigned same rank, and next rank value will 
-- be previous rank + no of duplicates.

create table h(
v int);

# drop table h;
insert into h values (11),(12),(12),(13),(14),(14),(14),(15),(10);
select * from h;

-- ascending order
select v, dense_rank() over (order by v) as DRank from h;
-- descending order
select v,dense_rank() over (order by v desc) as DRank from h;

-- ascending order
select v, rank() over (ORDER BY v) Rank_asc from h;
-- descending order
select v, rank() over (order by v desc) Rank_desc from h;

# row_number()
# It is assigning a row number to each row starting from 1.
# It can also be used for ranking.
# There wont be any duplicates(as long as partition is not used),
# there wont be any gaps.

select v, row_number() over (ORDER BY v) RNum_Asc from h;
select v, row_number() over (ORDER BY v desc) RNum_Desc from h;

select v, rank() over (order by v desc) Rank_desc,
dense_rank() over (order by v desc) DRank,
row_number() over (order by v desc) RNum
from h;

use demo2;
show tables;

select * from stu1_bio;
-- stu_Id, city,degree,grad_year,cgpa

select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa) as DRank from stu1_bio;

select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa desc) as DRank from stu1_bio;

# Q) Rank top 2 cgpa based on degree from stu1_bio table.
select * from
(select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa desc) as DRank 
from stu1_bio) as abc
where DRank<=3;

# Q) Find all even rows - rank, dense_rank,row_number
select * from 
(select *, row_number() over (order by cgpa) RNum from stu1_bio) dt
where RNum%2=0;

# % = Remainder (Modulo operator)
# Example: 5%2 = 1

# Find all odd rows
select * from 
(select *, row_number() over (order by cgpa) RNum from stu1_bio) dt
where RNum%2!=0;

use demo2;

# Q) Rank top 2 cgpa based on each degree. 

select * from
(select degree, cgpa, row_number() 
over (partition by degree order by cgpa) as RN from stu1_bio) as dt
where RN<3;

select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa desc) as DRank from stu1_bio;


select * from stu1;
select * from course;

-- stu1(SID, Name, email, age, score, C_ID)
-- course(CID, CName, start_date)
-- stu1_bio(Stu_ID, city, degree, grad_year,cgpa)

# Q1) Rank top 3 score based on each course name using row_number.
# Q2) Rank top 2 scores based on each city name using row_number.
# Q3) Rank top 2 cgpa based on monthname of course start_date 
# using row_number.

select * from 
(select c.cname,s.score, row_number() over 
(partition by c.cname order by s.score desc) RN
from course c
inner join stu1 s on s.c_id = c.cid) as dt
# where RN<=3
# OR
having RN<=3;




create table tab1(
prod varchar(5),
SDate date,
Sales int,
primary key(prod,SDate,Sales) 
);

-- Month Sales
-- Mar    100 
-- Apr    150
-- May    140
-- June   175
#              order = 1      order = 1
--     CSales Pre_Sales(Lag) Next_Sales(lead)
-- Mar   100   null           150
-- Apr   150    100           140
-- May   140    150           175
-- Jun   175    140           null

#              order = 2      order = 2
--     CSales Pre_Sales(Lag) Next_Sales(lead)
-- Mar   100    null           140
-- Apr   150    null           175
-- May   140    100            null
-- Jun   175    150            null


# drop table tab1;

insert into tab1 values
('A','2022-03-01',250),
('B','2021-10-17',550),
('A','2022-04-01',400),
('C','2021-02-15',850),
('A','2022-05-01',650),
('B','2021-09-17',500),
('A','2022-06-01',550),
('C','2021-03-15',1050),
('C','2021-04-15',900),
('A','2022-07-01',900),
('B','2021-11-17',750),
('C','2021-05-15',1000),
('B','2021-12-17',650);

select * from tab1;

select prod, sdate, sales, 
lag(sales,1) over (partition by prod order by sdate) Prev_Sales,
lead(sales,1) over (partition by prod order by sdate) Next_Sales
from tab1;

select prod, sdate, sales, 
lag(sales,1) over (partition by prod order by sdate ) Prev_Sales,
sales - lag(sales,1) over (partition by prod order by sdate) as Diff
from tab1;

select prod, sdate, sales, 
lag(sales,1,0) over (partition by prod order by sdate ) Prev_Sales,
sales - lag(sales,1,0) over (partition by prod order by sdate) as Diff
from tab1;

# Percent Difference
select prod, sdate, sales, 
lag(sales,1,0) over (partition by prod order by sdate) Prev_Sales,
(sales - lag(sales,1,0) over (partition by prod order by sdate))/lag(sales,1,0) 
over (partition by prod order by sdate) as PerDiff
from tab1;


create or replace view WFV as
select prod, sdate, sales, 
lag(sales,1,0) over (partition by prod order by sdate) Prev_Sales,
lead(sales,1,0) over (partition by prod order by sdate) Next_Sales
from tab1;

select * from WFV;

select *, sales-prev_Sales as Diff,
(sales-prev_Sales)/prev_Sales as Per_Diff from WFV;

