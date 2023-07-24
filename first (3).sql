show databases;
create database institute;
use institute;
drop database institute;

create table Students(rollno int,name char(50),address varchar(255),fee float);

show tables;
describe students;

insert into students values(22,"Aman","mega 62 noida",120.566);
insert into students values(23,"Sumit","mega 62 noida",120.566);
insert into students values(24,"Aman","mega 62 noida",120.566);

insert into students values (1,"abhishek","gzb",500.667),
(2,"aashish","gzb",50870.667),
(3,"rahul","gzb",5400.667),
(4,"arun","gzb",50980.667),
(5,"nikhil","gzb",55400.667);

select * from students;
drop table students;

-- 01/03/2023

create database megainstitute;
use megainstitute;

create table Employee(empid int,name varchar(255),
address varchar(255),salary double,mobileno bigint,gender char(1),
ismarried boolean);


desc employee;

insert into Employee values (100,"Aman Tiwari",'niit 62 noida',90000.5555,
9891062743,'M',false);

select * from employee;

insert into Employee values 
(101,"Aman1",'621 noida',9010.55,9891062741,'M',false),
(102,"RAman2",'622 noida',9020.55,9891062742,'F',true),
(103,"Aman3",'623 noida',9030.55,9891062743,'M',false),
(104,"RAman4",'624 noida',9040.55,9891062744,'f',1),
(105,"Aman5",'625 noida',9050.55,9891062745,'M',0);

select empid,name,isMarried from employee;

insert into Employee(empid,name,salary,gender,ismarried) values 
(200,"RajDeep",90000.5555,'M',false);


truncate employee;

drop table employee;
drop database megainstitute;



delete from employee where name='aman1';
delete from employee where name='raman1';
delete from employee where name='raman2';

select * from employee;

update employee set name='kajal' where name='raman4';


-- 03/03/2023

-- int -> integer

use megainstitute;
create table Batch(batchid int,stuname varchar(50),DOB date,
Fee decimal(8,2),description text,address varchar(255),
gender char(1));

desc batch;

insert into batch values (100,"kamal","1999/04/22",56.788,
"good in java","noida","M");
insert into batch values (100,"kamal","1999/04/22",56.789788,
"good in java","noida","M");
insert into batch values (100,"kamal","1999/04/22",12345666.78,
"good in java","noida","M");

select * from batch;

update batch set stuname ='rajveer' where stuname='kamal';

update batch set stuname ='rajdeep' where fee=56.79;

drop table batch;

create table Batch(batchid int,stuname varchar(50),
joining_date timestamp,logintime time,logouttime time);

insert into batch values(1001,"rahul","1999/04/22 10:12","11:30","7:30");
insert into batch values(1002,"Aman","2018/12/02 11:30","11:30","6:30");
insert into batch values(1002,"Aman","2018/12/02 11:30:20","15:30:12","20:30:14");

select * from batch;

-- 04-03-2023

use classicmodels;
show tables;

select * from customers;

select * from customers where city='singapore';
select customerName from customers where city='singapore';

select customername,creditLimit from customers where creditlimit>80000;

-- 8448179216



use megainstitute;

use classicmodels;
show tables;

select * from customers;

-- operators   

select 56+35 as 'sum of 56 and 35 is ';
select 27%4 as 'remainder';

select customerName,creditlimit from customers where creditlimit<80000;
select customerName,creditlimit from customers where creditlimit>80000;
select customerName,creditlimit from customers where creditlimit=53100;
select customerName,creditlimit from customers where creditlimit<=80000;
select customerName,creditlimit from customers where creditlimit>=80000;
select customerName,creditlimit from customers where creditlimit<>53100;

select customerName,creditlimit from customers where not creditlimit=53100;


select customerName,creditlimit,country from customers where creditlimit>80000 
and country='USA';

select customerName,creditlimit,country from customers where creditlimit>80000 
or country='USA';

select contactfirstname,customerName,creditlimit 
from customers
 where contactfirstname like 'J%';

select contactfirstname,customerName,creditlimit 
from customers
 where contactfirstname like '%e';


select contactfirstname,customerName,creditlimit 
from customers
 where contactfirstname like '%e%';


select contactfirstname,customerName,creditlimit 
from customers
 where contactfirstname like 'J%' and creditlimit>80000  ;

select contactfirstname from customers order by contactfirstname desc;


select contactfirstname,country from customers order by contactfirstname,country;

-- 13/03/2023

-- use classicmodels;

/*

use classicmodels;
select * from customers;
select * from customers;
select * from customers;
select * from customers;

*/

-- keys

use megainstitute;
show tables;

create table Teachers(tid int,tname varchar(25),address varchar(50));

insert into Teachers values(100,"Aman","niit 62 noida"),
(100,"Aman1","niit 62 noida"),
(100,"kamal","niit 62 noida"),
(100,"ritu","niit 62 noida");

select * from teachers;


update teachers set tname="Rahul" where tid=100;


drop table teachers;

create table Teachers(tid int unique,tname varchar(25),address varchar(50));

insert into Teachers values(100,"Aman","niit 62 noida");
insert into Teachers values(100,"Aman","niit 62 noida");

select * from teachers;
insert into Teachers(tname,address) values("kamal","niit 62 noida");
insert into Teachers values(null,"Ritu","niit 62 noida");



drop table teachers;

create table Teachers(tid int not null unique,tname varchar(25),address varchar(50));

insert into Teachers values(100,"Aman","niit 62 noida");
insert into Teachers values(100,"Aman","niit 62 noida");

insert into Teachers(tname,address) values("Aman","niit 62 noida");

insert into Teachers(tid,address) values(102,"niit 62 noida");

select * from teachers;

describe teachers;


create table Teachers(tid int not null unique,tname varchar(25),
address varchar(50),country  varchar(50) default 'india');


insert into teachers values(201,"aman","niit 62 noida","Australia");
insert into teachers(tid,tname,address) values(202,"aman","niit 62 noida");

select * from teachers;


create table Teachers(tid int not null unique auto_increment,tname varchar(25),
address varchar(50),country  varchar(50) default 'india');

insert into teachers(tid,tname,address) values(201,"aman","niit 62 noida");

insert into teachers(tname,address) values("rahul","niit 62 noida");
insert into teachers(tname,address) values("sumit","niit 62 noida");
insert into teachers(tname,address) values("kajal","niit 62 noida");


drop table teachers;


create table Teachers(tid int not null unique  check (tid>0),
tname varchar(25),address varchar(50),country  varchar(50) default 'india');


insert into teachers(tid,tname,address) values(-18,"aman","niit 62 noida");
insert into teachers(tid,tname,address) values(18,"aman","niit 62 noida");

create table Teachers(tid int primary key auto_increment,
tname varchar(25),address varchar(50),country  varchar(50) default 'india');



insert into teachers(tid,tname,address) values(null,"aman","niit 62 noida");

select * from teachers;

-- 14/03/2023

 use megainstitute;

 create table userdata(uname varchar(255),password varchar(255),
 country varchar(100) default 'india');

 insert into userdata(uname,password) values('sachinSingh',"password");
 insert into userdata values('sachinSingh',"password","USA");

 select * from userdata;

-- keys
-- primary key 

-- drop table userdata;

 create table Users(uname varchar(255) primary key,
 password varchar(255),email varchar(255) unique not null,
 mobileno varchar(15) unique not null,
 country varchar(100) default 'india');

-- primary key = unique not null
-- there must be one primary key in a table 

insert into users values
("sachin123","password","sachi@gmail.com","988988899","Australia"),
("Aman123","2235","amantiwari8861@gmail.com","9891062743","USA"),
("sumit","ilysmkatrina","yuuu@gmail.com","6756768","Canada"),
("neha","albatross","neha@gmail.com","3454565","France");

update users set country="Turkey" where uname="neha";

select * from users;

-- 15/03/2023

use megainstitute;
create table categories(category_id int primary key,cat_name varchar(250)
,description varchar(250));

desc categories;

create table products(category_id int,product_id int primary key,
product_name varchar(255),product_description varchar(245),
foreign key(category_id) references  categories(category_id)
);

desc products;

insert into categories values(100,"Mobiles","new model mobile phones");

select * from categories;


insert into products values(100,200,"Realme xt","best phone under 20k");

select * from products;

insert into products values
(103,201,"Shirts","best shirt under 2k");

drop table categories; -- error

drop table products;
drop table categories;

select * from products;

-- 17-03-2023
use megainstitute;

create table categories(category_id int primary key,cat_name varchar(250)
,description varchar(250));

create table products(category_id int,product_id int primary key,
product_name varchar(255),product_description varchar(245),
foreign key(category_id) references  categories(category_id)
);

insert into categories values (101,"phones","any description"),
(102,"laptop","any description"),
(103,"fashion","any description"),
(104,"food","any description"),
(105,"guns","any description");


insert into products values (101,201,"realme xt	    ","hello"),
(101,202,"redmi note 9	","hello"),
(102,203,"hp	        ","hello"),
(102,204,"dell vestro	","hello"),
(105,205,"M416	    ",    "hello"),
(null,206,"shirt1	    ","hello"),
(null,207,"jeans	    ","hello");

-- 20/3/2023
-- composite primary key

use megainstitute;
create table StudentsData(fname varchar(255),lname varchar(255),
fathersName varchar(255),address varchar(255),dob date,
primary key(fname,lname)
);

insert into studentsdata(fname,lname,address) values
("Aashish","Beniwal","noida 62"),
("Aashish","Sharma","delhi 62"),
("Sumit","Sharma","delhi 62"),
("Sumit","Beniwal","delhi 62");

-- insert into studentsdata(fname,lname,address) values
-- ("Aashish","Beniwal","noida 62"); -- error

-- Alter commands

create table Emp(empid int);

desc Emp;

alter table emp add column EmpName varchar(255);

desc Emp;

select * from emp;
alter table emp add column address varchar(255);
alter table emp add column dob date,xyz int; -- error

alter table emp drop column address;
alter table emp drop column empid,empname; -- error

alter table emp modify column empid int  primary key ;

desc emp;

alter table emp modify column empid int  primary key auto_increment;

alter table emp rename to Empl;

desc empl;


-- 21-03-2023

use megainstitute;

select * from empl;

alter table empl rename column empName to Employee_Name;

set foreign_key_checks = 0;

drop table categories;
drop table products;

set foreign_key_checks = 1;

desc products;

alter table products drop primary key;

-- between,insert into select,distinct,limit,constraints,f.k cascade,delete

use classicmodels;
select * from customers;

select customername,creditlimit 
from customers 
where creditlimit between 50000 and 80000
order by creditlimit
limit 10;


select customername,creditlimit 
from customers 
where creditlimit between 50000 and 80000
order by creditlimit
limit 10 offset 20;


select * from orders;
select distinct comments  from orders;
select * from orders where shippeddate is null;


use megainstitute;
select * from empl;

select * from classicmodels.customers;

select contactfirstname,customernumber from  classicmodels.customers;


insert into empl select contactfirstname,customernumber 
from  classicmodels.customers;

-- test 24-03-2023

create table employees(empid int primary key,empname varchar(255),
mobileno varchar(20),salary double);
create table manager(empid int,managerid int,
foreign key(empid) references employees(empid) );
create table departments(deptid int primary key,deptname varchar(255));
create table salesitems(deptid int,name varchar(255),supplierid int,weight float,
color varchar(255), QOh int,foreign key(deptid) references
 departments(deptid));
insert into departments(deptid) values(49);
create table supplier(supplierid int primary key,supplies varchar(255),cityname varchar(255),
foreign key(cityname) references cities(cityname));
create table cities(cityname varchar(255) primary key);

-- Ans.1 select * from employees;
-- Ans.2 select deptname from departments;
-- Ans.3  select * from salesitem where Qoh=0;
-- Ans.4  select empname,salary from employees where salary between 10000 and 20000;
-- Ans.5  select name,price,price*0.1 from salesitems where deptid=49;
-- Ans.6  select empname,mobileno,salary from employees where empname like "s%";

-- joins 
use megainstitute;
create table categories(category_id int primary key,cat_name varchar(250)
,description varchar(250));

create table products(category_id int,product_id int primary key,
product_name varchar(255),product_description varchar(245),
foreign key(category_id) references  categories(category_id)
);

insert into categories values (101,"phones","any description"),
(102,"laptop","any description"),
(103,"fashion","any description"),
(104,"food","any description"),
(105,"guns","any description");


insert into products values (101,201,"realme xt	    ","hello"),
(101,202,"redmi note 9	","hello"),
(102,203,"hp	        ","hello"),
(102,204,"dell vestro	","hello"),
(105,205,"M416	    ",    "hello"),
(null,206,"shirt1	    ","hello"),
(null,207,"jeans	    ","hello");

select * from categories;
select * from products;

desc categories;
desc products;

use megainstitute;
select * from categories,products;

select * from categories
inner join products
on categories.category_id = products.category_id;


select categories.category_id,cat_name,product_id,product_name 
from categories
inner join products
on categories.category_id = products.category_id;


select * from categories as C
inner join products as P
on C.category_id = P.category_id;

select * from categories C
inner join products P
on C.category_id = P.category_id;

select * from categories 
inner join products 
using (category_id); -- the column name and data type of that column must be same

-- left join

select * from Categories c
left join products P 
on c.category_id=P.category_id;

-- Right join

select * from Categories c
right join products P 
on c.category_id=P.category_id;

-- only left

select * from Categories c
left join products P 
on c.category_id=P.category_id
where P.category_id is null;

-- only right

select * from Categories c
right join products P 
on c.category_id=P.category_id
where c.category_id is null;

-- full outer join

select * from Categories c
left join products p 
on c.category_id=p.category_id
union 
select * from categories c
right join products p
on c.category_id=p.category_id;

select * from Categories c
left join products p 
on c.category_id=p.category_id
union all
select * from categories c
right join products p
on c.category_id=p.category_id;

-- subquery
use classicmodels;
show tables;

select * from customers;

select customername,creditlimit 
from customers 
where customername='Alpha Cognac';

select customername,creditlimit
 from customers where creditlimit>=61100;
 
 -- or 
 
 select customername,creditlimit 
 from customers
 where creditlimit>=(select creditlimit 
 from customers 
 where customername='alpha cognac')
 order by customername;

 
 select count(*)
 from customers
 where creditlimit>=(select creditlimit 
 from customers 
 where customername='alpha cognac')
 order by customername;

-- group by 

select count(*) from customers;
select sum(creditlimit) from customers;
select avg(creditlimit) from customers;
select min(creditlimit) from customers;
select max(creditlimit) from customers;

select city,count(*) 
from customers 
group by city order by city;

select * from customers order by city;

select city,count(*) as 'total persons in city',sum(creditlimit)
from customers 
group by city order by city;

-- group by 

use classicmodels;

select * from customers;

select state,country,count(*),sum(creditlimit)
from customers
group by state,country
order by state,country;

-- having
-- select country,count(*),customername,creditlimit
-- from customers
-- group by country,creditlimit
-- order by country;

select country,count(*),sum(creditlimit)
from customers 
group by country
 having sum(creditlimit)>50000
order by country,creditlimit;
