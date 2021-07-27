-- show databases;
-- use sakila;
-- show tables;
-- select * from city;
create database mydatabase;
show databases;
use mydatabase;
show tables;
create table Students(roll_no int,name char(30));
show tables;
describe Students;
insert into Students values(26,'prateek');
insert into Students(name) values('Durgesh');
select * from students;
select name from students;
drop database mydatabase;
show databases;
create table Demo(col1 int ,col2 char(20),col3 float,col4 double,col5 boolean);
describe Demo;
insert into Demo values(101,'hello',34.14566886,3.145668866676,true);
select * from Demo;
drop table Demo;
create table Demo2(col1 varchar(50),col2 tinyint,col3 mediumint,col4 int,col5 bigint);
describe Demo2;
create table demo3(col1 integer,col2 decimal(5,2));
create table demo4(col1 date,col2 time,col3 datetime,col4 timestamp);
insert into demo4 values('1999-04-22','1:30','1999-04-22 1:30','1999-04-22 1:30');
select * from demo4;
insert into demo4 values('1999/04/22','1:30','1999-04-22 1:30','1999-04-22 1:30');
use mydatabase;
insert into demo(col3) values('1400%');
select * from demo;
create table Studentz(roll int,name varchar(50),abc varchar(30));
insert into Studentz(roll,name) values(21,'aman'),(22,'naman'),(23,'abhishek'),(24,'sourabh');
select * from studentz;
truncate Studentz;

use mydatabase;
delete from studentz;
delete from studentz where name='aman';
create table dem(col text);
insert into dem values('hello hbbhf djhvfbhb fddf fdhfv');
select * from dem;
update studentz set name=null where name='';
drop table studentz;

use mydatabase;

show tables;

create table tab7(col1 varchar(30),col2 varchar(50),col3 varchar(60));

insert into tab7(col1,col2,col3) select roll,name,abc from studentz;


select * from tab7;


set @num1=100,@num2=200;

select @num1+@num2 addition;
select @num1+@num2 as addition;

select @num2%@num1;

prepare sub from 'select ?-?;';

execute sub using @num2,@num1;
deallocate prepare sub;
show variables;

-- alter
use mydatabase;
select * from studentz;
alter table studentz add column address2 varchar(50) after roll;
update studentz set address2='xyz' where name='naman';
alter table studentz modify column address int;
alter table studentz rename column address to address3;
alter table studentz drop column address;
describe studentz;
use mydatabase;
alter table Studentz rename to Students;
describe studentz;

select * from sakila.city;


show databases;
use school;
show tables;

select * from school.teacher;

create table Users(empid int unique auto_increment,name varchar(30) not null,
Entry timestamp default(current_timestamp()));
insert into users(name) values('aman'),('aman2'),('aman3');
select * from users;
insert into users(name) values('aman2');
drop table users;
insert into users(name,Entry) values("aman",current_timestamp());

create table Student(
rollNo int not null unique auto_increment,
name varchar(50) not null,
mobile varchar(30) unique,
address varchar(50),
email varchar(30) not null unique);
describe Student;
insert into student(name,mobile,address,email) 
values("aman","9891062743","xyz","aman@gmail.com");
insert into student(name,mobile,address,email) 
values("aman","788","xyz","namaman@gmail.com");
select * from student;
insert into student(name,mobile,address,email) 
values("aman","78778","xyz","nman@gmail.com");

truncate student;


drop table student;
create table Student(
rollNo int not null unique auto_increment,
name varchar(50) not null,
mobile varchar(30) primary key,
address varchar(50),
email varchar(30) not null unique);


describe student;
insert into student(name,address,email) 
values("aman","xyz","nman@gmail.com");



create table Student(
rollNo int not null unique auto_increment,
name varchar(50) ,
mobile varchar(30) ,
address varchar(50),
email varchar(30),
primary key(mobile)
);
create table Student(
rollNo int not null unique auto_increment,
name varchar(50) ,
mobile varchar(30) ,
address varchar(50),
email varchar(30),
constraint const1 primary key(mobile)
);



create table user(
name varchar(30),lname varchar(30),fname varchar(30),
mname varchar(30) ,
num int check(num>3)
-- constraint comp1 primary key(name,lname)
);

insert into user(name,lname) values("aman","tiwari");
insert into user(name,lname) values("aman","singh");
insert into user(name,lname) values("kamal","tiwari");
insert into user(name,lname) values("kamal","singh");

drop table user;

insert into user(num) values(2);

alter table user add column admin varchar(30) default("aman");

insert into user(num) values(5);

describe user;
select * from user;

use mydatabase;
create table student(
studentid varchar(30) primary key,
name varchar(50),
class varchar(30),
address varchar(30)
);
create table teacher(
teacherid varchar(30) primary key,
studentid varchar(30),
name varchar(40),
subject varchar(40),
foreign key(studentid) references Student(studentid)
);
describe student;
describe teacher;
-- alter table teacher modify column teacherid varchar(50) primary key;

insert into teacher values(101,201,"aman","java");

-- 15-07-2021 work
use mydatabase;

create table categories(categoryid int,categoryname varchar(30),
description varchar(50)
,primary key(categoryid));

create table products(categoryid int,productid int,
productname varchar(30),description varchar(40),
foreign key(categoryid) references categories(categoryid));

insert into categories values(101,"accesories","all gadgets");

insert into products values(101,201,"realme xt","best phone");

insert into products values(104,202,"realme c2","best phone"); -- error
insert into products values(null,202,"realme c2","best phone"); 

insert into products values(101,202,"realme c1","worst phone"); 

select * from products;
delete from products where productid=202;
delete from categories where categoryid=101; -- referential integrity

select * from categories;

-- 16-07-2021

use mydatabase;
create table categories(categoryid int,categoryname varchar(30),
description varchar(50)
,primary key(categoryid) 
);
create table products(categoryid int,productid int,
productname varchar(30),description varchar(40),
foreign key(categoryid) references categories(categoryid)
on update restrict on delete restrict
);

drop table categories;
drop table products;

--  compiler restict this automatically
-- on update restrict
-- on delete restrict
-- on update cascade
-- on delete cascade
-- on update set null
-- on delete set null
 

insert into categories values(101,"accesories","all gadgets");
insert into products values(101,201,"realme xt","best phone");
-- insert into products values(104,202,"realme c2","best phone"); -- error
insert into products values(null,202,"realme c2","best phone"); 
insert into products values(101,202,"realme c1","worst phone"); 


select * from categories;
select * from products;

update categories set categoryid=105 where categoryid=101; -- error due to restrict
delete from categories where categoryid=101;-- error due to restrict

-- ------------------------------------------------------------------------
use mydatabase;
drop table products;
drop table categories;
create table categories(categoryid int,categoryname varchar(30),
description varchar(50)
,primary key(categoryid) 
);
create table products(categoryid int,productid int,
productname varchar(30),description varchar(40),
foreign key(categoryid) references categories(categoryid)
on update cascade on delete cascade);
insert into categories values(102,"accesories","all gadgets");
insert into products values(102,201,"realme xt","best phone");
select * from categories;
select * from products;
update categories set categoryid=105 where categoryid=102;
delete from categories where categoryid=105;
-- -----------------------------------------------------------------------------------

drop table products;
drop table categories;
create table categories(categoryid int,categoryname varchar(30),
description varchar(50)
,primary key(categoryid) 
);
create table products(categoryid int,productid int,
productname varchar(30),description varchar(40),
foreign key(categoryid) references categories(categoryid)
on update set null on delete set null
);

insert into categories values(102,"accesories","all gadgets");
insert into products values(102,201,"realme xt","best phone");
select * from categories;
select * from products;
update categories set categoryid=105 where categoryid=102;
delete from categories where categoryid=105;
-- ---------------------------------------------------------
drop table products;
drop table categories;
create table categories(categoryid int,categoryname varchar(30),
description varchar(50)
,primary key(categoryid) 
);
create table products(categoryid int,productid int,
productname varchar(30),description varchar(40),
foreign key(categoryid) references categories(categoryid)
on update cascade on delete set null
);

insert into categories values(102,"accesories","all gadgets");
insert into products values(102,201,"realme xt","best phone");
select * from categories;
select * from products;
update categories set categoryid=105 where categoryid=102;
delete from categories where categoryid=105;

-- 23-07-2021

create table categories(categoryid int,categoryname varchar(30),
description varchar(50)
,primary key(categoryid) 
);
create table products(categoryid int,productid int,
productname varchar(30),description varchar(40),
-- constraint myrule foreign key(categoryid) references categories(categoryid)
foreign key(categoryid) references categories(categoryid));

insert into categories values(102,"accesories","all gadgets");
insert into products values(102,201,"realme xt","best phone");

show create table products;

-- alter table products drop foreign key myrule;
alter table products drop foreign key products_ibfk_1;

update categories set categoryid=105 where categoryid=102;
delete from categories where categoryid=105;

SET FOREIGN_KEY_CHECKS=0;  -- disable foreign key constraint
SET FOREIGN_KEY_CHECKS=1;  -- enable foreign key constraint


-- 26/07/2021

use mydatabase;
show tables;
drop database mydatabase;
select * from products;
select * from products where productname='realme xt';
select productid,productname from products where categoryid=101;
select * from products where categoryid=101 and productid=201;
select * from products where categoryid=101 or productid=201;
select distinct productid from products;
select * from products where productname like 're%';
insert into products values(101,204,"Rext","best phone");
select * from products where productname like '%t';
select * from products where productname like '%e%';
select * from products where productname not like '% %';
select * from products where not productname  ='realme xt';
select * from products where productname in ('realme xt','realme c1');
select * from products where productid between 200 and 202;
select * from products limit 2 ;
select * from products limit 5,1 ;
select count(*) from products;
select * from products limit 2,3 ;
select * from products where categoryid is null;

-- 27/07/2021

use mydatabase;

select * from products;
insert into products values(101,210,"blackberry","best phone1");

select * from products order by productname asc;
select * from products order by productname desc;

drop table products;
drop table categories;

