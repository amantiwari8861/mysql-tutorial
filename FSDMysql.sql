
-- Day 1 22/7/2023

show databases;
create database MysqlFSD;
use mysqlfsd;
show tables;

create table Employee(id int,name char(20),
address varchar(255),salary float,
phone bigint);

describe employee;

select * from employee;

insert into employee values(100,"Aman Tiwari","noida 62",50000.45,9891062743);

insert into employee values
(100,"Aman Tiwari","noida 62",50000.45,9891062743),
(101,"Naman","noida 63",500.45,98916565743),
(34,"RAman Tiwari","noida 63",5000.45,98916767743),
(60,"Shri RAman Tiwari","noida 62",80000.45,8766868687),
(180,"BAman ","noida 65",500.5645,687877);

truncate employee;

drop table employee;

select name from employee;
select name,address,salary from employee;
select * from employee where name="aman tiwari";

insert into employee values
(100,"Aman Tiwari","noida 62",50000.45,9891062743);

select distinct name from employee;

insert into employee(name) values("xyz");
select * from employee;
insert into employee(name,id) values("abcd",108);

delete from employee where id=108;

update employee set name="Aditya" where name="abcd";

-- Hello this is single line comment
/* Multiple
	Line
    comment
*/
# hello

drop table employee;

create table Employee(id int,name char(20),
address varchar(255),salary float,
phone bigint,dob date,joiningdate datetime,
Bankbalance double,comment text,
intime timestamp,ismarried boolean);

insert into employee values(101,"Aman","Imarticus 62",
60000.56,9891062743,"1999/04/22","1999-06-24",66687.32873487,
"he is a best teacher","1999-06-24 13:04:5",false);

select * from employee;


insert into employee values(101,"Aman","Imarticus 62",
60000.56,9891062743,"1999/04/22",curdate(),66687.32873487,
"he is a best teacher",current_timestamp(),true);

-- 24/07/2023

create database MysqlFSD; 
use mysqlfsd;

create table Students(id int,name varchar(255),
phone bigint,address varchar(255),fees float);


describe students;

insert into students values(100,"Aman Tiwari",9891062743,"noida 62",5000.56);

insert into students(name,phone) values("Ankit Tiwari",758778);

select * from students;


update students set name="Krishna" where id=100; /* update anamolis*/

-- keys (constraints)

drop table students;

-- unique
-- not null
-- default
-- check 
-- primary key
-- foreign key

create table Students(id int not null unique,name varchar(255),
phone bigint not null,address varchar(255),fees float);

insert into students values(100,"Aman Tiwari",9891062743,"noida 62",5000.56);
insert into students values(100,"Raman Tiwari",656776,"noida 62",5000.56);
insert into students values(101,"Raman Tiwari",656776,"noida 62",5000.56);

select * from students;


insert into students values
(102,"Aman 1",6776434,"hello",7676),
(103,"Aman 2",6776434,"hello",7676),
(104,"Aman 3",6776434,"hello",7676),
(105,"Aman 4",6776434,"hello",7676),
(106,"Aman 5",6776434,"hello",7676),
(107,"Aman 6",6776434,"hello",7676);

insert into students(id,name,address,fees) values
(108,"Aman 1","hello",7676);

-- check default
drop table students;


create table Students(id int not null unique,name varchar(255),
phone bigint not null,address varchar(255),
fees float,city varchar(255) not null default("delhi"));

insert into students values(100,"Aman Tiwari",9891062743,"noida 62",5000.56,"uttar Pradesh");

insert into students(id,name,phone,address,fees)
values(101,"Krishna Tiwari",5667,"noida 62",5000.56);


-- check
drop table students;


create table Students(id int not null unique,name varchar(255),
age int check(age>=18) ,phone bigint not null,address varchar(255),
fees float,city varchar(255) not null default("delhi"));

insert into students values(100,"Aman Tiwari",24,
9891062743,"noida 62",5000.56,"uttar Pradesh");


insert into students(id,name,phone,address,fees,city) values(101,"Ravi Tiwari",
9891062743,"noida 62",5000.56,"uttar Pradesh");

insert into students values(102,"Ankit Tiwari",12,
9891062743,"noida 62",5000.56,"uttar Pradesh");

-- a table must have a single primary key

drop table students;

create table Students(stuid int primary key,name varchar(255),
age int not null check(age>=18),phone bigint not null, email varchar(255) unique ,
address varchar(255),fees float,city varchar(255) default("delhi"));

describe students;


insert into students values(100,"Aman Tiwari",24,
9891062743,"amantiwari8861@gmail.com","noida 62",5000.56,
"Noida");

insert into students(name,age,phone,email,address,fees,city) values("Aman Tiwari",24,
9891062743,"amantiwari8861@gmail.com","noida 62",5000.56,
"Noida");

select * from students;

-- auto_increment
drop table students;

create table Students(stuid int primary key auto_increment,name varchar(255),
age int not null check(age>=18),phone bigint not null, email varchar(255) unique ,
address varchar(255),fees float,city varchar(255) default("delhi"));


insert into students(name,age,phone,email,address,fees,city) values("Aman Tiwari",24,
9891062743,"amantiwari8861@gmail.com3","noida 62",5000.56,
"Noida");

 -- h.w BatchMates