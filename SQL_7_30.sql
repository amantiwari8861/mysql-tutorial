-- single line comment (there is a space after --)
# also single line comment
/*
	multiple line comment
    * purpose of comment 
     1. plugability of queries
     2. documentation
*/

-- to see the list of database 
show databases;

-- to create a database 
create database wd_7_30;

-- it is mandatory to use the DB
use wd_7_30;
show tables;

/*
	sql is fully case insensetive
    can be written in multiple lines
    ; is not mandataory but it is good programming to separate each statement with a ;
    sql queries is just like simple english
    use database everytime u visit or want to work on any database
*/

use mysql;
show tables;


select 
* -- all
from
user;

-- creating a table

create table Students(id int,name varchar(30),
gender char(1),isMembershipExpired bool,dob date,
joining datetime,mobileNo bigint,fees float,address text);

/*
-2^n-1 to 2^n-1 -1 where n=no. of bits
int -> 4 bytes
-2^31 to 2^31 -1
-2,14,74,83,648  to 2,14,74,83,647
*/

-- describbe table's structure
desc students;

#  list all tables in a DB
show tables;

select * from students;

-- strings must be in single or double quotes (Note: date is also must be written like string)
-- date must be written in yyyy-mm-dd format
-- and date time must be  yyyy-mm-dd hh:mm:ss
insert into students values (18342,"bhavya purohit",'M',false,
'2003/11/26','2024-09-04 20:21:10',1234567848,12000,"sector 14@HR-gurugram");

select * from students;

select id,name from students;

-- 05-09-2024
use wd_7_30;
show tables;

/*
	DML -> data manipulation language eg. insert,update,delete
    DDL -> data defination langauge eg. create,alter,drop,truncate etc.
    DQL -> data query language eg. select
    DCL -> data control language eg. grant and revoke
    TCL -> transaction control language eg. commit,rollback and savepoint
*/


create table Students(id int,name varchar(30),
gender char(1),isMembershipExpired bool,dob date,
joining datetime,mobileNo bigint,fees float,address text);

select * from students;
insert into students(id,name) values(18263,"shivam");

insert into students values
(18340,"Aman Singh",'M',true,'2002-05-15',current_timestamp(),
124324245,12999,'sector 14@Gurugram-HR');
truncate students;

INSERT INTO Students
VALUES 
(1, 'Rahul Sharma', 'M', FALSE, '1998-05-15', '2023-07-01 09:00:00', 9876543210, 50000, '123 MG Road, Delhi'),
(2, 'Priya Verma', 'F', TRUE, '2000-08-22', '2023-06-15 10:30:00', 9876543211, 48000, '45 Sector-12, Mumbai'),
(3, 'Vikas Patel', 'M', FALSE, '1999-03-10', '2023-07-10 11:00:00', 9876543212, 51000, '789 Patel Street, Ahmedabad'),
(4, 'Sakshi Gupta', 'F', TRUE, '1997-12-05', '2023-08-01 08:45:00', 9876543213, 47000, '120 Civil Lines, Lucknow'),
(5, 'Ankit Reddy', 'M', FALSE, '1996-01-19', '2023-07-20 14:20:00', 9876543214, 52000, 'Plot 55 Jubilee Hills, Hyderabad'),
(6, 'Neha Singh', 'F', FALSE, '1998-02-14', '2023-06-25 12:00:00', 9876543215, 49000, '45 Green Park, New Delhi'),
(7, 'Amit Kumar', 'M', TRUE, '1995-11-23', '2023-07-18 09:45:00', 9876543216, 53000, '678 Park Avenue, Kolkata'),
(8, 'Kavya Nair', 'F', FALSE, '2001-07-29', '2023-07-30 16:00:00', 9876543217, 46000, '12 MG Road, Bangalore'),
(9, 'Rohan Joshi', 'M', TRUE, '1998-10-17', '2023-08-05 10:15:00', 9876543218, 48000, '34 Church Road, Pune'),
(10, 'Megha Chauhan', 'F', FALSE, '1999-09-11', '2023-07-25 13:30:00', 9876543219, 45000, '90 Shivaji Nagar, Jaipur');


drop table students;
drop database wd_7_30;

select id,name from students;
-- where clause,limit,top

select * from amazon.category;

-- 06-09-2024


show databases;
use sampledatabase;
show tables;
select * from customers;

select count(*) from customers;

-- data filtering with where clause
select * 
from customers
where contactFirstname="Carine ";

-- relational operators eg. <,>,<=,>=,=,!=,<>
select * 
from customers
where contactFirstname="Carine ";

select * 
from customers
where creditlimit<30000;

select * 
from customers
where creditlimit>30000;


select contactfirstname,phone,creditlimit 
from customers
where creditlimit>=60300
order by creditlimit desc;


select contactfirstname,phone,creditlimit 
from customers
where creditlimit<=60300
order by creditlimit desc;

select contactfirstname,phone,creditlimit 
from customers
where creditlimit=60300
order by creditlimit desc;

select contactfirstname,phone,creditlimit 
from customers
where creditlimit!=60300
order by creditlimit desc;

select contactfirstname,phone,creditlimit 
from customers
where creditlimit<>60300
order by creditlimit desc;

# logical operator and,or,not

# and -> both the conditions must be true
# or -> atleast one of the conditions must be true
# not -> true -> false
#      -> false -> true

select * from customers where country='usa';

select contactfirstname,phone,country,
creditlimit 
from customers
where creditlimit>60300 and country='usa'
order by creditlimit;

select contactfirstname,phone,country,
creditlimit 
from customers
where creditlimit>60300 or country='usa'
order by creditlimit;




 
