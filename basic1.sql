use mydatabase;
create table decimals(col1 float,col2 double,col3 decimal(5,3));
insert into decimals(col1) values(9.999999);
insert into decimals(col2) values(9.9999999999999999);
insert into decimals(col3) values(99.999);

select * from decimals;
create table num(col1 tinyint,col2 smallint,col3 mediumint,
col4 int,col5 integer,col6 bigint);
desc num;

create table char2(col1 char(10),col2 character(20),col3 varchar(30),col4 varcharacter(30));
desc char2;

insert into char2(col1) values('aman');

create table booleans(col1 bool,col2 boolean);

insert into booleans(col1) values(true);
desc booleans;

select * from booleans;

create table clock(col1 date,col2 time,col3 datetime,
col4 year,col5 timestamp);

insert into clock(col1) values('2000/5/12');

insert into clock(col2) values('21:06');

insert into clock(col1) values(now());
insert into clock(col2) values(now());
insert into clock(col3) values(now());
insert into clock(col4) values(now());
insert into clock(col5) values(now());
insert into clock values(now(),now(),now(),now(),now());
select * from clock;


insert into clock(col4) values(now());

insert into clock(col5) values(now());

desc char2;

insert into char2(column7) values('-2n-1   to 2n-1 -1
Where n = no. of bits 
Int = 4 bytes
1 byte  = 8 bits 
N = 4*8 =32 bits
-231  to 231 -1
-2,14,74,83,648  to 2,14,74,83,647   ans.');
select * from char2;

-- 19/9/2021 ------------------------

use mydatabase;
show tables;
select * from student;
create table multiinsert(col1 varchar(30),col2 varchar(30),col3 varchar(40));
insert into multiinsert values('a','b',1),('c','d',2),('e','f',3);
select * from multiinsert;
insert into multiinsert select * from categories;
select * from categories;
-- ------------------ update
update multiinsert set col2='Books' where col2='laptop' ;
-- ---------------------delete 
delete from multiinsert where col2='books';
truncate multiinsert;
desc multiinsert;
drop table multiinsert;


-- ------------------------------------------------------
create table employee(empid varchar(30),empname varchar(50)
,empdetails varchar(50));
select * from sakila.customer;
insert into employee select customer_id,first_name,address_id 
from sakila.customer;
select * from employee;
-- operators
select * from employee where empdetails <> 30;
-- != or <> not equal to
select * from employee where empname like '%r%';
-- and or not
select * from employee where empname like 'j%' and empid=26;
select * from employee where empname like 'j%' or empid>27;
select * from employee where empname not like 'j%';

-- FILTERING DATA -------------------------------------------------------
select * from employee where empid between 25 and 55;
select * from employee where empname in('susan','mary','linda','abc');
update employee set empname =null where empid<4;
select * from employee where empname is null;
insert into employee values(4,'barbara',8);
select distinct *   from employee; -- only unique row
select * from employee limit 20;
select * from employee limit 20 offset 15;
-- order by
select * from employee order by empname asc;
select * from employee order by empname desc;

-- -constraints------------------------------------------
-- not null
-- unique
-- primary key
-- foreign key
-- check 
-- default 
use mydatabase;
create table students(
rollno int unique not null,
name varchar(50) not null,
age int check (age>=18),
school varchar(80) default 'MEGA'
);
describe students;
insert into students(age,name)  values(12,'abc');
select * from students;
drop table students;
-- alter table students modify  rollno int unique ;
create table students(
rollno int primary key,
name varchar(50) not null,
age int check (age>=18),
school varchar(80) default 'MEGA',
mobile varchar(30) not null unique
);
insert into students(name,mobile) values('a','988');


-- ----foreign key-------------------------------------
use mydatabase;
create table categories(categoryid int,
categoryname varchar(30),
description varchar(50)
,primary key(categoryid));
create table products(cid int,productid int,
productname varchar(30),descriptions varchar(40),
foreign key(cid) references categories(categoryid));
drop table categories; -- error
drop table products;
insert into categories values(101,"laptop","any description"),
(102,"phone","any description"),
(103,"others","any description");
insert into products values(108,201,"realme xt","anything"); -- error
insert into products values(102,202,"realme xt","anything"); 
delete from categories where categoryid=102; -- error

-- -------------------------------------------------------
-- on update cascade on delete cascade

create table categories(categoryid int,
categoryname varchar(30),
description varchar(50),
constraint abc primary key(categoryid));
create table products(cid int,productid int,
productname varchar(30),descriptions varchar(40),
constraint myrule foreign key(cid) references categories(categoryid)
on delete cascade on update cascade
);
insert into categories values
(101,"laptop","any description"),
(102,"phone","any description"),
(103,"others","any description");

insert into products values(101,201,"hp","anything"); 
insert into products values(102,202,"realme xt","anything"); 
insert into products values(102,203,"redmi","anything"); 
select * from categories;
select * from products;
update categories set categoryid=500 where categoryid=101;
delete from categories where categoryid=102;

drop table products;
drop table categories;
-- -------------------------------------------------------
create table student( sname varchar(30),father varchar(30),description varchar(40),
primary key(sname,father));

drop table student;

insert into products values(null,204,"redmi","anything"); 

alter table products drop constraint myrule ;



insert into products values(900,203,"redmi","anything"); 

alter table products add constraint myrule2 foreign key(cid)
 references categories(categoryid);
 
 desc products;

show create table products;

alter table products drop constraint myrule2;