show databases;
create database mera_database;
-- do not use special characters except _  
show databases;


use mera_database;

show tables;

create table Students(
id int,
name varchar(30),
gender char(1)
);

desc students;
insert into students values(16554,"vipin",'M');

select * from     students;

insert into students values
(17429,"chandan",'M'),
(17805,"kushagra",'M'),
(null,"krishna",'M'),-- 9871523415
(null,"atul",'M'), -- 8756078385
(null,"hiranmayee",'F'), -- 8801958380
(15805,"anil",'M'), 
(15770,"gaurav",'M'), 
(17820,"neha",'F'), 
(16377,"himanshu",'M'), 
(17360,"kundan",'M'), 
(17658,"sonia",'F'), 
(16796,"ravi",'M'), 
(18354,"ankit",'M'), 
(17747,"bhumika",'F');

select * from students;
select name,id from students;


-- next staturday recap 

-- 11-08-2024
use mera_database;

-- single line comment (here space is mandatory after -- )
# single line comment
/*
	multiple
	line
    comment
*/

/*
	what is comment and why comment 
    1. documentation
    2. plugability of query
    
    SQL queries can be categorized into
    1. DML -> data manipulation language eg. insert,update,delete
    2. DDL -> data defining language eg. create,alter,drop etc
    3. DQL -> data query language  eg. select
    4. DCL -> data control language eg. grant,revoke
    5. TCL -> transaction control language eg. commit,rollback,savepoint
*/

drop table students;

create table Employee(empid int,empname varchar(50),
salary float,mobileNo bigint,gender char(1),ismarried bool,
dob date,joining_time timestamp,description text);

-- -2^31 to 2^31 -1 (-2,14,74,83,648 to 2,14,74,83,647)
-- -2^63 to 2^63 -1
-- -2^n-1 to 2^n-1 -1 where n=no. of bits (1 byte =8 bits)

-- medium int  =>  -83,88,608 to 83,88,607

insert into employee values(
100,"Aman Tiwari",56000.1234,
8448179216,'M',false,'2024-08-11',
'2024-08-11 15:10:5',"this is some description");

select * from employee;
desc employee;
insert into employee(empid,empname,gender) select id,name,gender from students;

set sql_safe_updates=0;

update employee set empid=18271 where empname="hiranmayee";
update employee set empid=18269 where empname="krishna";

delete from employee where empid=100;

show databases;
use classicmodels;
show tables;
select * from customers;


-- data filtering through operators (on sunday) 


-- 17 Aug 2024

show databases;
create database mera_database;
use mera_database;

/*
	multiple
    line 
    comment
*/
-- single line comment (there is space after 2 hyphen)
#single line comment

create table DucatStaff(
id int,name varchar(50),gender char(1),salary decimal(7,2), 
ismarried boolean,dob date,joining_date timestamp,address varchar(255),
mobileNo bigint,skills text);
show tables;
--  -2^n-1 to 2^n-1 -1 where n=no. of bits 
-- 1 byte = 8 bits
-- int -> 4 bytes
-- -2^31 to 2^31 -1
-- insert into DucatStaff values(2147483647,"Aman","M");
-- insert into DucatStaff values(2147483648,"Aman","M");

drop table DucatStaff;

desc DucatStaff;

insert into DucatStaff(id,name) values(101,"Aman Tiwari");

select * 
from ducatstaff;

select name,id 
from ducatstaff;

insert into ducatstaff values
(101,"Aman Tiwari",'M',56000.78,true,'2024-8-17','2024-8-17 15:27:10','anand vihar delhi-96',8448179216,"MEAN,MERN,etc"),
(102,"Aman Tiwari",'M',56000.78,true,'2024-8-17','2024-8-17 15:27:10','anand vihar delhi-96',8448179216,"MEAN,MERN,etc"),
(103,"Aman Tiwari",'M',56000.78,true,'2024-8-17','2024-8-17 15:27:10','anand vihar delhi-96',8448179216,"MEAN,MERN,etc"),
(104,"Aman Tiwari",'M',56000.78,true,'2024-8-17','2024-8-17 15:27:10','anand vihar delhi-96',8448179216,"MEAN,MERN,etc");

truncate ducatstaff;
drop table ducatstaff;


use classicmodels;
show tables;

select * from customers;
select * from ducatstaff;

update ducatstaff set salary=72000 ;
delete from ducatstaff;

update ducatstaff set salary=72000 where id=101;
delete from ducatstaff where id=102;

select distinct * from ducatstaff;

-- CRUD 
-- classicmodels

use classicmodels;
select * from customers where contactfirstname like 'J%';
desc table classicmodels.customers;

-- operators for data filtering
use classicmodels;

select 10+20;
select 10+20 as sum;
select 10+20 sum;
select 100*0.15 as "15 percent";
select 27%4; -- mod (to find remainder)

-- relational operator for data filtering
-- eg. <,>,<=,>=,=,!= and <>(not equal)

select * from customers;

select customernumber,contactFirstName,phone, 
creditlimit,addressline1
from customers;

select count(*) as 'total no. of rows' from customers;

select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit<50000
-- order by creditlimit desc;
order by contactFirstName;

update customers set contactfirstname="Aman"
 where customernumber=447;
 update customers set contactlastname="xavier"
 where customernumber=293;
update customers set contactfirstname="Aman"
 where customernumber=293;



select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit<110000
order by contactFirstName,contactLastName;

select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit>110000
order by contactFirstName;

select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit=110000
order by contactFirstName;

select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit<=110000
order by creditlimit;

select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit>=110000
order by creditlimit;

select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit!=110000
order by creditlimit;

select customernumber,contactFirstName,contactLastName,phone, 
creditlimit,addressline1
from customers
where creditlimit<>110000
order by creditlimit;

-- logical operator

select customernumber,contactFirstName,country,phone, 
creditlimit
from customers
where creditlimit<=110000 and country="USA"
order by creditlimit; 

-- and : both conditions must be true to fetch data 

select customernumber,contactFirstName,country,phone, 
creditlimit
from customers
where creditlimit<=110000 or country="USA"
order by creditlimit; 

/*
and 
 true true -> true
true false -> false
false true -> false
false false -> false
*/

select customernumber,contactFirstName,country,phone, 
creditlimit
from customers
where not country="USA"
order by creditlimit; 


select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where country="USA"
order by creditlimit; 

-- wild card
select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where contactFirstName like "a%"
order by contactfirstname; 



select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where contactFirstName like "%a"
order by contactfirstname; 


select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where contactFirstName like "%a%"
order by contactfirstname; 


select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where contactFirstName like "_ean"
order by contactfirstname; 

select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where country in ("usa","france")
order by contactfirstname;


select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where creditlimit between 50000 and 110000
order by contactfirstname;


select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where creditlimit between 50000 and 110000
order by creditlimit
limit 10;

select customernumber,contactFirstName,country,phone, 
creditlimit, creditlimit*1.15 as "15% hike"
from customers
where creditlimit between 50000 and 110000
order by creditlimit
limit 5 offset 10;

-- gniitwala amantiwari8861
-- constraints 

use mera_database;
create table Employee(
id int primary key auto_increment,
name varchar(50),
mobileNo bigint not null unique,
email varchar(30) unique,
address varchar(255),
city varchar(50) not null,  
country varchar(50) default "india",
age int check(age>=18),
aadharNo bigint not null unique
-- primary key(id)
);

-- unique not null check default
-- primary key (unique and not null)
-- only 1 primary key per table 
-- primary key should rarely be changed 
-- primary key should be given at the time of data insertion

alter table employee rename column mobieNo to mobileNo;
SET @@auto_increment_increment=2;
truncate employee;
insert into employee(id,mobileNo,city,aadharNo) values(100,13232434,"delhi",343343443);
insert into employee(mobileNo,city,aadharNo) values(1323243365444,"delhi",32344);
insert into employee(mobileNo,city,aadharNo) values(314151512,"delhi",34343443);
insert into employee(city,aadharNo) values("delhi",34343443);

select * from employee;

create table movies(userId int,movieId int primary key auto_increment,
moviename varchar(100),price decimal(5,2),
constraint fk_empId_and_movie foreign key(userId) references employee(id) 
);
SET @@auto_increment_increment=1;


INSERT INTO Employee (name, mobileNo, email, address, city, country, age, aadharNo) VALUES
('Amit Sharma', 9876543210, 'amitsharma@example.com', '123 Main Street, Delhi', 'Delhi', 'India', 25, 123456789012),
('Deepika Pandey', 8765432109, 'deepikapandey@example.com', '456 Main Street, Mumbai', 'Mumbai', 'India', 30, 234567890123),
('Raman Raj', 7654321098, 'ramanraj@example.com', '789 Main Street, Kolkata', 'Kolkata', 'India', 35, 345678901234),
('Anjali Singh', 6543210987, 'anjalisingh@example.com', '101 Main Street, Chennai', 'Chennai', 'India', 40, 456789012345);


INSERT INTO movies VALUES
(1,200,'Dilwale Dulhania Le Jayenge', 250.00);

INSERT INTO movies (userId, movieName, price) VALUES
(1, 'Stree 2', 250.00),
(2, 'Sholay', 200.00),
(2, 'Munjya', 200.00),
(3, '3 Idiots', 300.00),
(4, 'Baahubali: The Beginning', 350.00);

select * from employee;
select * from movies;

update movies set userId=null where movieId=205;

-- test
INSERT INTO movies (userId, movieName, price) VALUES
(101, 'Stree 2', 250.00);
update employee set id=101 where id=1;
delete from employee where id=1;


-- many to many 

drop database mera_database;
create database mera_database;
use mera_database;


create table user(
id int primary key auto_increment,
name varchar(50),
mobileNo bigint not null unique,
email varchar(30) unique,
address varchar(255),
city varchar(50) not null,  
country varchar(50) default "india",
age int check(age>=18),
aadharNo bigint not null unique
-- primary key(id)
);

create table movies(
movieId int primary key auto_increment,
moviename varchar(100),price decimal(5,2));

create table user_movie(userId int,movieId int,rentedAt timestamp default current_timestamp(),
constraint fk_user_id foreign key(userId) references user(id)
on update cascade 
on delete cascade,
constraint fk_movie_id foreign key(movieId) references movies(movieId)
on update cascade 
-- on delete cascade, error bcz primary key can't be null
on delete cascade,
primary key(userId,movieId)
);


INSERT INTO user (name, mobileNo, email, address, city, country, age, aadharNo) VALUES
('Amit Sharma', 9876543210, 'amitsharma@example.com', '123 Main Street, Delhi', 'Delhi', 'India', 25, 123456789012),
('Deepika Pandey', 8765432109, 'deepikapandey@example.com', '456 Main Street, Mumbai', 'Mumbai', 'India', 30, 234567890123),
('Raman Raj', 7654321098, 'ramanraj@example.com', '789 Main Street, Kolkata', 'Kolkata', 'India', 35, 345678901234),
('Anjali Singh', 6543210987, 'anjalisingh@example.com', '101 Main Street, Chennai', 'Chennai', 'India', 40, 456789012345);

INSERT INTO movies VALUES
(200,'Dilwale Dulhania Le Jayenge', 250.00);
INSERT INTO movies (movieName, price) VALUES
('Stree 2', 250.00),
('Sholay', 200.00),
('Munjya', 200.00),
('3 Idiots', 300.00),
( 'Baahubali: The Beginning', 350.00);

select * from user;
select * from user_movie;
select * from movies;

desc user_movie;

insert into user_movie(userid,movieId) values 
(1,200),
(1,201),
(2,200),
(2,203),
(3,204);


truncate user_movie;
truncate user;
drop table user_movie;
truncate user;
drop table user;
drop table movies;

delete from user where id=1; 
delete from movies where movieid=204; 
-- on update cascade,set null,restrict
-- on delete cascade,set null,restrict

-- joins 
 -- cross join 
create table Table1(A int,B int);
create table Table2(C int,D int);

insert into Table1 values(1,11),(2,22);
insert into Table2 values(33,333),(44,444),(55,555),(66,666);

select * from Table1;
select * from Table2;

select * from Table1,Table2;

create table categories(
categoryid varchar(20) primary key,
category_name varchar(30),
abcd varchar(20));

create table products(
product_id varchar(20),
catid varchar(30),
product_name varchar(30),
xyz varchar(20),
primary key(product_id),
foreign key (catid) references categories (categoryid)
);

insert into categories values(
101, 'phones', 'any description'),
 (102, 'laptop', 'any description'),
 (103, 'fashion', 'any description'),
 (104, 'food', 'any description'),
 (105,'guns', 'any description');
insert into products values
(201,101,'realmext', 'hello'),
 (202,101, 'redmi note 9', 'hello'),
 (203,102,'hp', 'hello'),
 (204, 102, 'dell vestro', 'hello'),
 (205,103,'shirt', 'hello'),
 (206, null, 'others', 'hello'),
 (207, null, 'watch', 'hello');

select * from categories;
select * from products;

-- Alias (Nickname)
select 10+20 as 'sum';
select 10+20 'sum';
select 10+20 sum;

-- inner join 

select * 
from categories
inner join products
on categories.categoryid = products.catid;


select *
from categories c
inner join products p
on c.categoryid = p.catid;

select * from user;
select * from user_movie;
select * from movies;


select * 
from user u
inner join user_movie um
on u.id=um.userid
inner join movies m
on um.movieId=m.movieId;

select u.id,u.name,m.moviename,m.price,um.rentedAt
from user u
inner join user_movie um
on u.id=um.userid
inner join movies m
on um.movieId=m.movieId;

select u.id,u.name,m.moviename,m.price,um.rentedAt
from user u
inner join user_movie um
on u.id=um.userid
inner join movies m
on um.movieId=m.movieId
where m.movieid=200;

insert into user_movie values(4,200,current_timestamp());


-- Alter Query
-- 1) Used to make changes in the structure of the table.
-- 2) There are 4 commands with the alter query
-- a) change - Used to rename a column + add/change its data types +
--             add/change/remove its constraints.
-- b) modify - Used to change the data types of a colum +
--             add/change/remove its constraints
-- c) add -  used to add a new column with its data type + add constraint
-- d) drop - used to drop an exitsing column
-- e) rename - used to rename a column.

create database mera_database;
use mera_database;
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2)
);

desc departments;
desc employees;
drop table employees;

-- Dropping a Primary Key with auto_increment
alter table employees modify column employee_Id int; -- to remove auto_increment
insert into employees (first_name) values("Aman");
ALTER TABLE employees DROP PRIMARY KEY; -- after removing primary key the column is not null
insert into employees (employee_id) values(100);
insert into employees (employee_id) values(100);
select * from employees;

truncate employees;
-- Adding a Primary Key
ALTER TABLE employees ADD PRIMARY KEY (employee_id);

-- Adding a Unique Constraint
ALTER TABLE employees ADD CONSTRAINT unique_email UNIQUE (email);

-- Adding a Foreign Key Constraint
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Adding a Check Constraint (MySQL 8.0.16 and later)
select version();
ALTER TABLE employees ADD CONSTRAINT check_salary CHECK (salary > 0);

-- to add the not null constraint
alter table employees modify department_id int not null ;

-- to drop the not null constraints
alter table employees modify department_id int default null;
-- or
alter table employees modify department_id int ;


insert into employees(employee_id,salary) values(101,-566);


-- Dropping a Unique Constraint
alter table employees modify column email varchar(50);
ALTER TABLE employees DROP INDEX unique_email;

-- Dropping a Foreign Key Constraint
ALTER TABLE employees DROP FOREIGN KEY fk_department;

-- Dropping a Check Constraint (MySQL 8.0.16 and later)
ALTER TABLE employees DROP CONSTRAINT check_salary;

-- Adding Constraints
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE employees ADD CONSTRAINT check_salary CHECK (salary > 0);

-- Disabling Foreign Key Checks
SET foreign_key_checks = 0; -- 0 means false

-- Performing Bulk Insert
INSERT INTO departments (department_name) VALUES ('HR'), ('IT'), ('Finance');

INSERT INTO employees (first_name, last_name, email, department_id, salary)
VALUES ('John', 'Doe', 'john.doe@example.com', 1, 5000),
       ('Jane', 'Smith', 'jane.smith@example.com', 2, 6000);

-- Enabling Foreign Key Checks
SET foreign_key_checks = 1;-- 1 means true

-- Dropping Constraints
ALTER TABLE employees DROP INDEX unique_email;

ALTER TABLE employees
DROP FOREIGN KEY fk_department;

ALTER TABLE employees
DROP CONSTRAINT check_salary;

alter table employees add column xyz int;
alter table employees add column abc int not null unique ;
alter table employees add column abc2 int after employee_id ;
alter table employees add column abc0 int first  ;

alter table employees drop column abc0;
alter table employees drop abc2;
alter table employees modify column abc double  ;
ALTER TABLE employees DROP INDEX abc;

desc employees;
alter table employees rename column email to email_id;
alter table employees rename to ducat_employees;
show create table employees;
desc ducat_employees;

-- views 

use classicmodels;
select * from customers;


create view CustomerKYCview
as 
select customerNumber,customerName,
addressline1,phone,city,state,country
from customers
where country='usa';

select * from CustomerKYCview;
drop view CustomerKYCview ;
update CustomerKYCview set addressline1="sector 14 gurugram"
where customernumber=112;


select * from customers;
delete from CustomerKYCview 
where addressline1="sector 14 gurugram";


-- functions -> string,date,time & window
-- function & stored procedures
-- reading & writing csv

use classicmodels;
select * from customers;

select * from customers limit 10; -- 131
select * from customers limit 5 offset 10; -- 141


-- functions : group of statements which together performs a task
--             advantages of function 
-- 			   1. reusability
-- 			   2. modularity 
--  there are 2 types of function 
--  1.pre-defined/built-in function
--  2.user-defined function

select curdate();
select length("8448179216");

-- parameters ,return type ,function defination ,function name

-- user defined functions 
/*
 If you use the mysql client program to define a 
 stored program containing semicolon characters, a problem arises. 
 By default, mysql itself recognizes the semicolon as a statement delimiter,
 so you must redefine the delimiter temporarily to cause mysql to pass the
 entire stored program definition to the server.
To redefine the mysql delimiter, use the delimiter command.

delimiter is changed to $$ to enable the entire definition to be passed to the 
server as a single statement, and then restored to ; before invoking the procedure.
 This enables the ; delimiter used in the procedure body to be passed through 
 to the server rather than being interpreted by mysql itself.
*/
use classicmodels;
delimiter //
create function addFxn(a int,b int) returns int 
deterministic
begin
	declare c int;
    set c=5;
	return a+b+c;
end //
delimiter ;

select addFxn(10,20); -- calling of addFxn
-- select addFxn((select 10),20); -- calling of addFxn

drop function addFxn;
select addFxn(1,3),addFxn(5,3) as sum,addFxn(10,3),addFxn(1,30);

DELIMITER $$
CREATE FUNCTION CustomerLevel(
	credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit >= 10000 and credit <= 50000 ) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END$$
DELIMITER ;


select customerNumber,contactFirstname,phone,
creditlimit,customerlevel(creditlimit)
from customers;

drop function CustomerLevel;

-- pre-defined string,date and time functions 
-- String functions - LCase, UCase, Length, Mid, concat 

select lcase('NASA');
select lower('HELLO');
select ucase('india') as Country;
select upper('india') as Country;
select Length('HEllo') as Length;   -- length of the string

-- add1,add2,city
select lcase('hello');
select concat('Hello',' ','World');
select concat(ucase('hello'),' ',ucase('world'));

-- trim - removes leading or trailing whitespace from string
select length(' Welcome to SQL '); -- 16
select trim(' Welcome to SQL '), length(trim(' Welcome to SQL '));
select ltrim(' Welcome to SQL '), length(ltrim(' Welcome to SQL '));
select rtrim(' Welcome to SQL '), length(rtrim(' Welcome to SQL '));
select reverse('Welcome to SQL');

-- 1) insert (str1,pos,no,str2)
-- str1 - str to be modified or inserted into
-- pos - index where str2 will be inserted into str1
-- index starts from 1
-- no - No of chars to replace
-- str2 - str to be inserted into str1
select insert('welcome to SQL', 1, 7, 'Python');  -- Python to SQL
select insert('welcome to SQL', 1, 5, 'Python');  -- Pythonme to SQL
select insert('Dell laptop vs HP Laptop', 16, 2, 'ASUS');  -- 
select insert('Good morning',6,7,'evening India');  -- 
select insert('Good morning',3,5,'evening');  -- Goeveningrning


-- 2) replace(str1,str2,str3)
-- str1 - string in which replacement will happen
-- str2 - a substring of str1 which will be replaced
-- str3 - The string with which str2 will be replaced with in str1

select replace("Welcome to SQL", "SQL", "Python");
select replace("Welcome to SQL", "sql", "Python");
select replace("MySQL to SQLServer", "SQL", "Python");
select replace("Covid cases are rising", "rising", "falling");
select replace("Covid XE", "XE", "Delta") as Covid_data;
select replace("Covid XE", "vid", "vaxin") as Covid_data;
SELECT replace("Hello world","when","India");
SELECT replace("Hello world sql","SQL","India");  -- no replacement
select replace("S Hello Q world L","SQL","India");  -- no replacement
select replace("Hello world","o","India");  
select replace(" Hello world "," ","___");  

-- 3) mid(str,start,len)
-- It is used to extract a substring from a string (starting at any position).
-- str - The str to extract from
-- start - Starting index, can be +ve or -ve. 
-- Index starts from 1(towards +ve) from left to right
-- Index starts from -1(towards -ve) from right to left
-- len - No of chars to extract (in left to right direction)
--  1  2  3  4  5
--  T  o  d  a  y
-- -5 -4 -3 -2 -1
select length('Startups in India');   -- 17
select mid("Startups in India",4,7);  -- rtups i
select mid("Startups in India",1,5);  -- Start
select mid('Today',-3,2);            --
select mid("Startups in India",-5,5); -- India
select mid("Startups in India",-8,4); -- in I
select mid("Startups in India",-3,7); -- dia
select mid('ING-2143-D7',1,3) as Flight_Name,
mid('ING-2143-D7',5,4) as Flight_Code,
mid('ING-2143-D7',-2,2) as Seat_num;
select mid('PGA-23224',1,3) as Course, mid('PGA-23224',5,5) as Batch;

-- 4) repeat(str,n)
-- It repeats a string n number of times 
select repeat("Hello ",3) as Ex_str,length(repeat("Hello ",3)) as Len;

-- 5) Lpad(str,len,lpad_str)
-- str - str which will be padded
-- len - len of resultant str after padding
-- lpad_str - the str to left_pad str
select lpad('5264', 7,'AI-');   --   AI-5264
select lpad('5264', 10,'AI-');  --   AI-AI-5264
select lpad('5264', 9,'AI-');   --   AI-AI5264
select lpad('5264',10,'I-');
select lpad('5264',10,'I-');  

-- 6) Rpad(str,len,rpad_str)
-- str - str which will be padded
-- len - len of resultant str agter padding
-- lpad_str - the str to right_pad str
select rpad('5264', 7,'-AI');    --  5264-AI
select rpad('5264', 10,'-AI');   --  5264-AI-AI
select rpad('5264', 8,'-AI');    --  5264-AI-

# 1 2 3 4 5  
# T O D A Y
-- 7) position(substr IN str)
-- It returns the position(index) of the first occurrence of the substring
-- in the left to right direction in the string
-- substr - The substr to be searched on str
-- str - The str that will be searched
-- if substr is not in str, result is 0

select position("7" IN "Hello 2378234") AS MatchPosition; 
select position("7" IN "Hello 273982734") AS MatchPosition;
select position("llo" IN "Hello 23782734") AS MatchPosition; 
select position("eo" IN "Hello 23782734") AS MatchPosition;  -- 0
select position("and" IN "Hello 23782734") AS MatchPosition; 

-- 8) Left(str,n)
-- Extract n chars from left of the str
select left("Welcome to SQL",7);

-- 9) Right(str,n)
-- Extract n chars from right of the str
select right("Welcome to SQL",6);

-- left,right,mid,position,insert or replace, lpad,rpad


## Date functions
## YYYY-MM-DD or YYYY/MM/DD
## DateTime 
## YYYY-MM-DD HH:MM:SS

select now();  -- returns current date and time  -- YYYY-MM-DD HH:MM:SS, HH in 24 hr clock
select date(now());
select year(now()), month(now()), day(now()), quarter(now());
select monthname(now()), dayname(now());
select curdate();  -- returns current date
select year(curdate()), month(curdate()), day(curdate()), quarter(curdate());

select date('2023-02-07 14:23:56') as Date;
select year('2019-10-08'), month('2019-10-08'), day('2019-10-08'),quarter('2019-10-08'); 
select year('10-13-2010');  -- null value
select dayname('2018-09-24');
select dayofweek('2022/08/16');
select dayofweek('2023/04/21');
# 1=Sunday, 2=Monday, 3=Tuesday, 4=Wednesday, 
# 5=Thursday, 6=Friday, 7=Saturday.

select weekday('2022/11/12');
select weekday('2023-04-21') as Wday; 
-- Mon-0,Tue-1, Wed-2, Thu-3,Fri-4,Sat-5,Sun-6

select week('2022-04-21') as Week;
select week('2022-11-12 14:23:56') as Week; -- 45
select weekofyear('2022-04-21 14:23:56') as Week_of_Year; -- 45

select week('2021-12-31') as Dec_LastWeek; -- 52
select week('2022-01-01') as Jan_Week1; -- 0  (Sat)
select week('2022-01-02') as Jan_Week1; -- 1
select week('2022-01-03') as Jan_Week1; -- 1
select week('2022-01-10') as Jan_Week1; -- 2
-- New week starts from Sun as per week()

select weekofyear('2021-12-31') as Dec_LastWeek; -- 52
select weekofyear('2022-01-01') as Jan_Week1;  -- 52
select weekofyear('2022-01-02') as Jan_Week1;  -- 52
select weekofyear('2022-01-03') as Jan_Week1;  -- 1
-- New week starts from Mon as per weekofyear()


-- Time Functions
-- HH:MM:SS
select time(now());
select hour(now()), minute(now()), second(now());
select hour('17:45:26'),minute('17:45:26'), second('17:45:26');
select minute('1999/10/23 14:23:56') as Min;
select hour('1999/10/23 14:23:56') as Hr;
select second('1999/10/23 14:23:56') as Sec;
select hour('1999/10/23') as Sec;  # Null


-- Date Time Addition and Subtraction
-- select adddate(date,days_to_be_added)

select adddate('2012-10-05',12); -- addition of day
select adddate('2012-10-05',-15); -- subtraction of day
select adddate('2012-12-28',12);
select adddate(date(now()),5); -- addition of day
select adddate('2012-10-05',interval 1 year); -- addition of year
select adddate('2012-10-05',interval -3 year); -- subtraction of year
select adddate('2012-10-05',interval 1 quarter); -- addition of quarter
select adddate('2012-10-05',interval -2 quarter); -- subtraction of quarter
select adddate('2012-10-05',interval 2 month); -- addition of month
select adddate('2012-10-05',interval -4 month); -- subtraction of month
select adddate('2012-10-05',interval -2 week); -- subtraction of week
select adddate('2012-10-05',interval 2 week); -- addition of week
select adddate('2012-10-05',interval 5 hour); -- addition of hr
select adddate('2012-10-05',interval -3 hour); -- subtraction of hr
select adddate('2012-10-05',interval 23 minute); -- addition of min
select adddate('2012-10-05',interval -45 minute); -- subtraction of min
select adddate('2012-10-05',interval 34 second); -- addition of sec
select adddate('2012-10-05',interval -17 second); -- subtraction of sec

select adddate(now(), interval 2 month);
select adddate(curdate(), interval 2 month);

--  timediff(time1, time2)
-- result is time1 - time2 in HH:MM:SS

select timediff('08:25:23','06:56:12');  -- difference is returned in HH:MM:SS - 01:29:11
select timediff('06:56:12','08:25:23'); 
select timediff('2022-03-12 08:25:23','2022-03-11 6:56:12'); -- difference is returned in time
select timediff('2022-03-17 08:25:23','2022-03-15 6:56:12');

select timediff('22:15:00','20:45:00');

#             10:15pm(prev), 2.45am(next day)    
select timediff('22:15:00','02:45:00');  # 1.45min + 2.45min = 4.30min

select timediff('00:00:00','02:45:00');  # -02.45:00

select timediff('23:59:59','02:45:00');  # 21.14:59

select timediff('22:15:00','02:45:00');
select adddate('2012-10-05',interval 5 hour);
select timediff('23:59:59',timediff('22:15:00','02:45:00'));
#      timediff('23:59:59','19:30:00') = '04:29:29'

select adddate(timediff('23:59:59',timediff('22:15:00','02:45:00')),interval 1 second);



select hour(timediff('2022-03-17 08:25:23','2022-03-15 6:56:12')) as hour_diff;
select hour(timediff('2022-03-17 08:25:23','2022-03-15 6:56:12'))/24 as day_diff;


#   date1-date2, date1>date2 => Positive
select datediff('2022-05-28','2022-03-18'); -- difference in days
select datediff('2022-05-28','2022-07-18');
select datediff('2022-03-18','2020-05-28')/365 as year_diff; -- difference in days

-- apr-30, may -26, mar-13
select datediff('2022-09-12','2022-05-14'); -- difference in days

select adddate('2022-03-20',13);
select date_add('2022-03-20',interval 15 day);

-- Date Format
-- YYYY-MM-DD
-- Parsing Formats
-- %m - Month number (1-12)
-- %Y - Year in 4 digits (2022)
-- %y - Year in 2 digits (22)
-- %d - Date
-- %M - Month Full Name (Ex - April)
-- %b - Month ShortName in 3 chars (Ex - Apr)
-- %W - Weekday Full Name (Ex - Monday)
-- %a - Weekday Name in 3 chars (Ex - Mon)
-- %w - weekday number (Thu-4, Fri-5,...)
-- %p - AM or PM
-- %H - Hour (24 clock => 00-23)
-- %i - minutes (00-59)
-- %s - seconds (00-59)

select date_format('2018-04-22','%m/%Y/%d');
select date_format('2018-04-22','%m-%y-%d');
select date_format('2018-04-22','%m-%y-%d - %M'); -- %M - Full Month Name
select date_format('2018-04-22','%m-%y-%d - %b'); -- %b - Month Name in short
select date_format('2018-04-22','%m-%y-%d - %a'); -- %a - Weekday name in short
select date_format('2022-04-01','%a');
select date_format('2018-04-22','%m-%y-%d - %W'); -- %W - Weekday full name
select date_format('2022-05-27','%m-%y-%d - %w'); -- %w - Weekday number
select date_format('2018-04-23 16:45:34','%m-%y-%d - %p'); -- %p - am or pm
select date_format('2018-04-23 6:45:34','%m-%y-%d - %p'); -- %p - am or pm
select date_format('2018-04-22','%m-%y-%d %H:%i:%s');
select date_format('2018-04-22','%M %Y %W %d');
select date_format('2018-04-22','%a %b %d-%Y');

-- stored procedures
/*
Stored procedures are pre-compiled query which can be executed again and again like functions but 
stored procedures are used mainly for do whole task at once by calling it.


Stored procedures offer several advantages, especially in the context of database management systems (DBMS) like MySQL, SQL Server, Oracle, and PostgreSQL. Here are the main benefits:

1. Performance Optimization:
Precompiled Execution: Stored procedures are precompiled and optimized by the database engine when first created. This reduces the overhead of parsing, optimizing, and compiling queries every time they are executed.
Reduced Network Traffic: When executing a stored procedure, only the call to the procedure is sent over the network, not the entire SQL query. This is especially useful when complex SQL operations are executed frequently.
2. Reusability and Modularity:
Code Reusability: Once a stored procedure is created, it can be called multiple times from different parts of the application, eliminating the need to rewrite SQL queries.
Modular Design: Stored procedures encapsulate logic in one place, making the system easier to maintain and allowing developers to focus on specific operations.
3. Security:
Access Control: By granting or revoking execute permissions on stored procedures, you can limit access to certain database operations, which is more secure than giving users direct access to underlying tables.
Code Encapsulation: By using stored procedures, the underlying SQL queries are hidden from the end users, making the database less vulnerable to SQL injection attacks.
4. Maintainability:
Centralized Logic: If the business logic changes, you can modify the stored procedure in one place, and it will automatically affect all applications that rely on it.
Version Control: Stored procedures make it easier to manage versions of the database logic, and they can be updated without affecting application code.
5. Improved Data Integrity:
Enforcing Business Rules: Complex business rules and validations can be embedded within stored procedures to ensure data consistency and integrity across all operations.
Transaction Management: Stored procedures can handle transactions, allowing you to manage complex operations with BEGIN, COMMIT, and ROLLBACK statements, ensuring consistency across multiple queries.
6. Reduced Application Complexity:
Less Application Code: Instead of writing complex SQL logic in the application layer, you can move the logic to stored procedures. This results in cleaner, more modular application code.
Abstraction: Applications can interact with stored procedures without needing to understand the underlying table structure or relationships, simplifying application development.
7. Encapsulation of Complex Queries:
Complex Logic: Stored procedures can contain complex logic with loops, conditionals (IF, CASE), and error handling, which is more powerful and maintainable than embedding the same logic in application code.
Multiple Operations: A stored procedure can perform several SQL operations (e.g., SELECT, UPDATE, DELETE, etc.) in one call, reducing the need for multiple round trips between the application and database.
8. Reduced Redundancy:
Code Duplication: Instead of embedding the same SQL queries in multiple parts of an application, you can centralize them in stored procedures and call them when needed. This avoids code duplication and improves maintainability.
9. Scalability:
Efficient Resource Use: Stored procedures help with resource management, as they reduce the load on the application server. Complex operations are offloaded to the database server, which is optimized for handling such tasks.
Parallel Execution: Many databases can optimize stored procedures for parallel execution, improving performance on multi-core servers.


*/
use classicmodels;
delimiter //
create procedure selectAllCustomers()
begin  -- just like { in c,c++,java etc. and like indent in python
select * from classicmodels.customers;
end //
delimiter ;

call selectAllcustomers();
drop procedure selectAllCustomers;

-- IN example

delimiter //
create procedure selectCustomerById(IN custId int)
begin
select * from classicmodels.customers
where customerNumber=custId;
end //
delimiter ;
call selectCustomerById(114);

-- out example 

delimiter //
create procedure getCrLimitByPhone(in custNo bigint,out cLimit double)
begin
select  creditlimit into cLimit 
from classicmodels.customers 
where customerNumber=custNo;
end //
delimiter ;

call getCrLimitByPhone(112,@Credit);
SELECT concat('THE credit limit IS :' , @Credit) as 'result';
drop procedure getCrLimitByPhone;
-- inout

delimiter //
create procedure updateCrLimit(in custNo int,inout crLimit double)
begin
	update customers set creditlimit=creditlimit*1.15 
    where customerNumber=custNo;
	select creditlimit into crLimit from customers 
    where customerNumber=custNo; -- new creditLimit
end //
delimiter ;

set @CurrentCrLimit=0.0;
set @id=103;
select creditlimit into @CurrentCrLimit from customers
where customerNumber=@id; -- old price
call updateCrLimit(@id,@CurrentCrLimit);
select @CurrentCrLimit as 'updated price';

select * from customers;
drop procedure updateCrLimit;
-- -------------------------------------
DELIMITER $$
CREATE PROCEDURE dorepeat(p1 INT)
BEGIN
  SET @x = 1;
  SET @sum = 0;
  REPEAT
    SET @sum = @sum + @x;
    SET @x = @x + 1;
  UNTIL @x > p1 END REPEAT;
SELECT CONCAT('Sum of ', p1, ' numbers is: ', @sum) AS result;
END $$
DELIMITER ;

CALL dorepeat(10);
drop procedure dorepeat;




-- write csv
SHOW VARIABLES LIKE 'secure_file_priv';
use classicmodels;
SELECT * 
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\students.csv'
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM customers;

-- read csv 
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\students.csv'
INTO TABLE students
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, name, dob, mobileNo);

-- mysqldump -u your_username -p school > school_dump.sql

-- doubts (window functions)
use mera_database;
create table DataTable  as 
select customerNumber,contactFirstName,city,state,country,creditlimit
 from classicmodels.customers;
 
select * from DataTable order by creditLimit;
drop table DataTable;

-- max credit limit in all
select max(creditlimit) from DataTable;

select dt.*,max(creditlimit) from DataTable dt;

-- get max creditLimit from each country ( 122 rows -> 28 rows)
select country,max(creditlimit) 
from DataTable dt
group by country;

select dt.*,country,max(creditlimit) 
from DataTable dt
group by country;

-- window functions 
/*Window functions in MySQL are a powerful feature that allows you to perform 
calculations across a set of table rows that are related to the current row.
 They are similar to aggregate functions, but unlike aggregate functions,
 window functions do not cause rows to become grouped into a single output row.
 Instead, rows retain their separate identities.*/
 
select dt.*,country,max(creditlimit) over()
from DataTable dt;

 
select dt.*,country,max(creditlimit) over(partition by country order by country)
from DataTable dt ;

select dt.*,country,row_number() over(partition by country order by country)
from DataTable dt ;



select dt.*,country,rank() over(order by creditlimit)
from DataTable dt ;

-- ranking from bottom
select dt.*,dense_rank() over(order by creditlimit)
from DataTable dt ;

-- ranking from top
select dt.*,rank() over(order by creditlimit desc) as top_customers
from DataTable dt ;

select dt.*,dense_rank() over(order by creditlimit desc) as top_customers
from DataTable dt ;

-- rank according to country 
select dt.*,dense_rank() over(partition by country
 order by creditlimit desc) as top_customers
from DataTable dt ;

-- rank according to leading creditlimit in country 

select dt.*,lag(creditlimit,1) over(partition by country
 order by creditlimit desc) as top_customers
from DataTable dt ;

-- shows who is leading from whom 
select dt.*,lead(creditlimit,1) over(partition by country
 order by creditlimit desc) as top_customers
from DataTable dt ;


select dt.*,ntile(4) over(partition by country
 order by creditlimit desc) as top_customers
from DataTable dt ;

select dt.*,first_value(creditlimit) over(partition by country
 order by creditlimit desc) as top_customers
from DataTable dt ;
select dt.*,last_value(creditlimit) over(partition by country
 order by creditlimit desc) as top_customers
from DataTable dt ;
select dt.*,nth_value(creditlimit,2) over(partition by country
 order by creditlimit desc) as top_customers
from DataTable dt ;





/*
The choice between RANK() and DENSE_RANK() in SQL depends on how you want to handle ties in your ranking and the specific requirements of your use case. Here are some scenarios where each function might be more appropriate:

### Use Cases for RANK()

1. *Handling Gaps in Ranking:*
   - *Scenario*: You have a dataset where you want to highlight gaps in ranking when there are ties. For example, in a competition, if two participants tie for 1st place, the next participant should be ranked 3rd (not 2nd) to indicate that two people share the first place.
   - *Example*: In a sports tournament ranking, where it's important to show that there are shared positions.
   
2. *Highlighting Relative Positions:*
   - *Scenario*: In a situation where understanding the distribution or spread of values is important, using RANK() helps illustrate that there is a break in continuity when ties occur.
   - *Example*: Analyzing sales performance where knowing how many people have the same sales figure and the gaps between them matters for understanding competitiveness.

3. *Use in Leaderboards with Skipped Positions:*
   - *Scenario*: When creating a leaderboard that mimics traditional ranking systems which skip ranks for ties.
   - *Example*: Ranking academic scores where two students might have the same score and are tied for 2nd place, so the next student is 4th (skipping 3rd).

### Use Cases for DENSE_RANK()

1. *Continuous Ranking Without Gaps:*
   - *Scenario*: You want to generate rankings that do not skip any rank numbers, even if there are ties. This is useful when every position in the rank is valuable, and you don't want to indicate any gaps.
   - *Example*: Awarding prizes where multiple participants with the same score get the same rank, but the next distinct score gets the immediate next rank without skipping.
   
2. *Creating Compact Lists:*
   - *Scenario*: When generating compact lists or summaries where the rank is more about order than position, and a consecutive numbering system is preferred.
   - *Example*: Listing products by customer ratings in an e-commerce site where products with the same rating are given the same rank, but the list itself is not meant to show gaps.

3. *Use in Continuous Data Analysis:*
   - *Scenario*: Analyzing data in a way that emphasizes the actual number of distinct groups or levels, not the gaps between them.
   - *Example*: Classifying customers into tiers based on purchase amounts, where each tier represents a contiguous range of customers regardless of ties.

### Summary

- **Use RANK()** when you need to show the rank with gaps for tied values, such as in competitions, leaderboards with traditional scoring, or any scenario where it is important to highlight the ranking gaps.
- **Use DENSE_RANK()** when you need a continuous ranking sequence without gaps, which is often required in compact reports, prize distributions, or when ranking in scenarios where the order of values without skipped ranks is more meaningful.

The decision between RANK() and DENSE_RANK() should be based on how you want to interpret and present the rankings and what insights you want to extract from your data.
*/
