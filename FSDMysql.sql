
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

insert into employee(name) values("Ankit Pandey");
select * from employee;
insert into employee(name,id) values("abcd",108);

delete from employee where id=108;

update employee set name="Aditya" where name="Ankit Pandey";

-- Hello this is single line comment
/* Multiple
	Line
    comment
*/
# hello

-- 23/7/2023
use mysqlfsd;
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


insert into employee values(101,"Ankit","Imarticus 62",
60000.56,9891062743,"1999/04/22",curdate(),66687.32873487,
"he is a best teacher",current_timestamp(),true);

-- 24/07/2023

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
 
 -- 26/7/2023
 
 -- primary key 
/* What is Database Normalization?

Normalization is a database design technique that reduces data redundancy and eliminates 
undesirable characteristics like Insertion, Update and Deletion Anomalies.
 Normalization rules divides larger tables into smaller tables and links them
 using relationships. The purpose of Normalisation in SQL is to eliminate 
 redundant (repetitive) data and ensure data is stored logically.*/
 
 
 create table Students(name varchar(255),
 fathername varchar(255),address varchar(255),
 primary key(name,fathername) );
 
 insert into students values("Krishna","Xyz","noida");
 insert into students values("Krishna","Abcd","noida");
 insert into students values("Ravi","Xyz","noida");
 insert into students values("Ankit","Abcd","noida");
 
 insert into students values("Krishna","Xyz","noida 62bhvfbh");
 insert into students values("Ravi","Xyz","noida");

 
 use mysqlfsd;

create table categories(category_id int primary key,category_name varchar(255),category_desc varchar(255)); 

create table products(
cat_id  int,product_id int primary key,
product_name varchar(255),product_desc varchar(255),
brand varchar(255),
foreign key(cat_id) references categories(category_id));

select * from categories;
select * from products;

insert into categories values(201,'electronic devices','best electronic items');

insert into products values(201,501,'dell vestro','small lappy','dell');

select * from categories;
select * from products;

insert into products values(586,502,'dell inspron','good lap','dell');



delete from categories where category_id = 201;
update categories set category_id=202 where category_id=201;


drop table categories; -- error parent table can't be deleted first
drop table products;
drop table categories;

-- 3 tables 
create table sellers(vendor_id int primary key,vendor_name varchar(255),address varchar(255));
create table categories(category_id int primary key,category_name varchar(255),category_desc varchar(255)); 
create table products(
cat_id  int,product_id int primary key,
product_name varchar(255),product_desc varchar(255),
brand varchar(255),
seller_id int,
foreign key(cat_id) references categories(category_id),
foreign key(seller_id) references sellers(vendor_id)
);

insert into categories values(201,'electronic devices','best electronic items');
insert into sellers values(301,'flipkart','online');
insert into sellers values(302,'amazon','online');
insert into products values(201,501,'dell vestro','small lappy','dell',301);

select * from categories;
select * from products;
select * from sellers;

-- h.w create a table students and teaches then apply foreign key in students
-- students taught by teacher


-- 28/7/2023
use mysqlfsd;
show tables;

drop table products;
drop table categories;
drop table sellers;


create table sellers(vendor_id int ,vendor_name varchar(255),address varchar(255),primary key(vendor_id));

create table categories(category_id int,category_name varchar(255),category_desc varchar(255),primary key(category_id)); 

create table products(
cat_id  int,product_id int,
product_name varchar(255),product_desc varchar(255),
brand varchar(255),
seller_id int,
primary key(product_id),
constraint myrule foreign key(cat_id) references categories(category_id) on update cascade on delete cascade,
constraint myrule2 foreign key(seller_id) references sellers(vendor_id)
);
desc products;

insert into products(cat_id,product_id) values(104,345);


(no updation and deletion is permitted if child having rows linked with foreign key in parent)

on update restrict on delete restrict -- by default 
on update cascade on delete cascade
on update set null on delete set null


insert into categories values(201,'electronic devices','best electronic items');
insert into sellers values(301,'flipkart','online');
insert into sellers values(302,'amazon','online');
insert into products values(201,502,'dell vestro','small lappy','dell',301);


select * from categories;
update categories set category_id=903;
delete from categories where category_id=903;
select * from products;


drop table products;

create table products(
cat_id  int,product_id int,
product_name varchar(255),product_desc varchar(255),
brand varchar(255),
seller_id int,
primary key(product_id),
constraint myrule foreign key(cat_id) references categories(category_id) on update set null on delete set null,
constraint myrule2 foreign key(seller_id) references sellers(vendor_id)
);

insert into products values(201,501,'dell vestro','small lappy','dell',301);

insert into categories values(201,'electronic devices','best electronic items');


update categories set category_id=701 where category_id=201;

select * from products;
delete from categories where category_id=201;


drop table products;


create table products(
cat_id  int,product_id int,
product_name varchar(255),product_desc varchar(255),
brand varchar(255),
seller_id int,
primary key(product_id),
constraint myrule foreign key(cat_id) references categories(category_id) 
on update cascade on delete set null,
constraint myrule2 foreign key(seller_id) references sellers(vendor_id)
);

select * from categories;
select * from products;

insert into categories values(201,'electronic devices','best electronic items');
update categories set category_id=701 where category_id=201;
delete from categories where category_id=701;
insert into products values(201,501,'dell vestro','small lappy','dell',301);

create database mysqlfsd;
use mysqlfsd;
create table students(roll_no int,name varchar(255),mobile varchar(255),fees double);

insert into students values
(101,"Aman",9891062743,500.56),
(102,"RAman",9891062743,1500.56),
(103,"BAman",545456,500.56),
(104,"Aman Tiwari",9891062743,58900.56),
(105,"Ankit",6565654,50000.56),
(106,"Ravi",9891062743,50.56),
(107,"Naman",68878,50099.56);


select * from students;

select * from students where name="Ravi";
select * from students where fees<5000;
select * from students where fees>5000;
select * from students where name like '%n';
select * from students where name like '%i';
select * from students where name like 'R%';
select * from students where name like '_Am_n';
select * from students where name like '%r%';
select * from students where name like '%a%' and fees<5000;
select * from students where name like 'Aman' or fees>5000;
select * from students where  not fees>5000;
select * from students where  name <> 'aman';
select * from students where  name <> 'aman' order by name;
insert into students(name,fees) values('ravi',4000);
insert into students(name,fees) values('ravi',400);
insert into students(name,fees) values('ravi',40000);
select * from students order by name,fees;
select * from students order by name,fees desc;


 -- 1/8/2023
 drop database mysqlfsd;
 
 create database mysqlfsd;
 
 use classicmodels;
 show tables;
 
 select customerName,city,country,creditlimit from customers where country="usa";
 
 select customerName,city,country,creditlimit from customers 
 where creditlimit>90000 and country="singapore" ;


 select customerName,city,country,creditlimit from customers 
 where customername like "%co." and country="germany" and creditlimit>30000;
 
 
 select customerName,city,country,creditlimit from customers 
 where customername like "%ltd%";
 
 select customerName,city,country,creditlimit from customers 
 where customername like "Dr%Ltd.";
 
  select customerName,city,country,creditlimit from customers 
where country="australia";
 
 
  select customerName,city,country,creditlimit from customers 
where country="australia" limit 3;

  select customerName,city,country,creditlimit from customers 
where country="australia" limit 3 offset 2;
 
 
  select customerName,city,country,creditlimit from customers 
where country="australia" order by creditlimit asc limit 3 offset 2;
 
 
  select customerName,city,country,creditlimit from customers 
where country="australia" order by creditlimit desc limit 3;
 
 
  select customerName,city,country,creditlimit from customers 
where country="australia" or creditlimit>100000 order by country,creditLimit;
 
 
  select customerName,city,country,creditlimit from customers 
where country="australia" and creditlimit>90000 order by creditlimit,country;
 
 
  select customerName,city,country,creditlimit from customers 
where not country="australia" and creditlimit>90000 order by creditlimit,country;
 
  select customerName,city,country,creditlimit from customers 
where country in ("australia","USA")  order by creditlimit,country;
 
select * from customers where country <> 'usa'; -- not equal to 

 -- insert into select 
 -- alter 
 -- 02/08/2023
 
 use classicmodels;
 
 use mysqlfsd;
 show tables;
 create table Customers(custId int,name varchar(255),companyname varchar(100));
 
 select * from classicmodels.customers;
 select customernumber,contactfirstname,customername from classicmodels.customers;
 
 insert into customers(custId,name) select customernumber,contactfirstname
 from classicmodels.customers;
 
 truncate customers; 
 insert into customers select customernumber,contactfirstname,customername
 from classicmodels.customers;
 
 select * from customers;
 
 -- alter 
 
 alter table customers add column address varchar(200);
 alter table customers add column address varchar(200) after custId;
 alter table customers drop column address;
 alter table customers drop column name;

alter table customers modify column custId varchar(20);
 desc customers;
 
 alter table customers modify column address int;
 alter table customers modify column custId int not null unique;
 alter table customers modify column custId int primary key auto_increment;
 
alter table customers drop primary key;
alter table customers modify column custid int;

 desc customers;

-- constraint myrule primary key(abcd)
 commit;
 
 SHOW INDEX FROM customers;
 alter table customers drop index `PRIMARY`;
 
 SHOW CREATE TABLE products;
 alter table products drop foreign key `products_ibfk_2`;
 desc products;
 
 insert into products(product_id,seller_id) values(55566,56);
 insert into products(product_id,seller_id) values(45,454544256);
 select * from products;
 
 alter table customers rename to employees;
 desc employees;
 alter table employees rename column custid to customerId;
 
 -- 07/08/2023

use classicmodels;

select * from customers;


-- select * from customers where country='singapore';
select country,count(*)
 as 'total customers',sum(creditLimit) 'Total',avg(creditLimit),
min(creditLimit),max(creditLimit) from customers group by country order by country;

select country,city,count(*)
 as 'total customers',
sum(creditLimit) 'Total',avg(creditLimit),
min(creditLimit),max(creditLimit)
from customers group by country,city 
order by country,city;


select country,city,count(*)
 as 'total customers',
sum(creditLimit) 'Total',avg(creditLimit),
min(creditLimit),max(creditLimit)
from customers group by country,city 
where sum(creditlimit)>50000
order by country,city;


select country,city,count(*)
 as 'total customers',
sum(creditLimit) 'Total',avg(creditLimit),
min(creditLimit),max(creditLimit)
from customers group by country,city 
having sum(creditLimit)>65000
order by country,city;
 
 
 -- 9/8/2023
-- sub query : query within query
use classicmodels;
select * from employees;

select firstname 
from employees
where jobtitle='vp sales';

select * from employees where firstname="Mary";

-- or

select * 
from employees 
where firstname=(
	select firstname 
	from employees
	where jobtitle='vp sales');
 
 -- subquery use with different table
 
 select * 
from employees; 

 select * 
from offices; 

select * from offices 
where officeCode=(
	select officeCode 
	from employees 
	where firstName="George"
);
-- operators

-- select * from offices 
-- where officeCode=(
-- 	select officeCode
-- 	from employees 
-- 	where jobTitle="Sales Rep"
-- );

select * from offices 
where officeCode =any(
	select officeCode
	from employees 
	where jobTitle="Sales Rep"
);
 
 
select * from offices 
where officeCode =any(
	select officeCode
	from employees 
	where jobTitle="Sales Rep" and reportsTo=1143
);

/*
> ALL means greater than every value. In other words, it means greater than 
the maximum value. For example, > ALL (1, 2, 3) means greater than 3.
> ANY means greater than at least one value, that is, greater than the minimum.
So > ANY (1, 2, 3) means greater than 1.
*/


select * from offices 
where officeCode >All(
	select officeCode
	from employees 
	where jobTitle="Sales Rep" and reportsTo=1143
);

select * from offices 
where officeCode <All(
	select officeCode
	from employees 
	where jobTitle="Sales Rep" and reportsTo=1621
);

select * from offices 
where officeCode =All(
	select officeCode
	from employees 
	where jobTitle="Sales Rep" and reportsTo=1143
);

-- 10/8/2023 joins
use classicmodels;
create table categories(category_id int,
category_name varchar(255)
,category_desc varchar(255),
primary key(category_id)); 

create table product_details(
cat_id  int,product_id int,
product_name varchar(255),
brand varchar(255),
product_desc varchar(255),
primary key(product_id),
constraint myrule foreign key(cat_id) references categories(category_id)
);

insert into categories values
(101,"phones","best phones"),
(102,"laptop","best laptop"),
(103,"fashion","best fashion"),
(104,"food","best food"),
(105,"guns","best guns");

insert into product_details values
(101,201,"Realme XT","Realme","best phone of realme"),
(101,202,"Redmi note 9","Redmi","best phone of redmi"),
(102,203,"HP Pavallion","HP","best laptop of HP"),
(102,204,"Dell inspiron","Dell","best laptop of dell"),
(103,205,"Denim jeans","denim","best jeans of denim"),
(null,206,"others","xyz","pata nahi"),
(null,207,"coffee","nescafe","best coffee");

select * from categories;
select * from product_details;

-- cross join (comma join)

select * 
from categories,product_details
order by categories.category_id,
product_details.product_id;


select * 
from product_details,categories
order by categories.category_id,
product_details.product_id;

-- inner join

select * from 
categories
inner join product_details
on categories.category_id=product_details.cat_id;


select * from 
categories as c
inner join product_details as p
on c.category_id=p.cat_id;

-- left join

select * from 
categories as c
left join product_details as p
on c.category_id=p.cat_id;

-- only left

select * from 
categories as c
left join product_details as p
on c.category_id=p.cat_id
where p.cat_id is null;


-- right join

select * from 
categories as c
right join product_details as p
on c.category_id=p.cat_id;

-- only right

select * from 
categories as c
right join product_details as p
on c.category_id=p.cat_id
where c.category_id is null;


-- full outer join

select * from 
categories as c
left join product_details as p
on c.category_id=p.cat_id
union all
select * from 
categories as c
right join product_details as p
on c.category_id=p.cat_id;

-- full outer join without common twice
select * from 
categories as c
left join product_details as p
on c.category_id=p.cat_id
union 
select * from 
categories as c
right join product_details as p
on c.category_id=p.cat_id;

-- full outer join without common part

select * from 
categories as c
right join product_details as p
on c.category_id=p.cat_id
where c.category_id is null
union
select * from 
categories as c
left join product_details as p
on c.category_id=p.cat_id
where p.cat_id is null;

-- 17/8/2023
-- using clause 
use classicmodels;
select * from categories; -- in this category_id is primary key
select * from product_details; -- in this cat_id is foreign key
-- if u want to use using clause the u have to set the column defination same(datatype and name).
alter table product_details rename column cat_id to category_id;


select * from 
categories
inner join product_details
on categories.category_id=product_details.category_id;

-- here the category_id column is duplicate in result set

select * from 
categories
inner join product_details
using (category_id);

-- DQL(Data Query Language) eg.select
-- DML(data manipulation language) eg. insert,update,delete
-- DDL(data defination language) eg. create,alter,drop etc
   -- Test
-- DCL(data control language) eg. grant,revoke
-- TCL(Transaction control language) eg.commit,savepoint,rollback

-- trigger,stored procedures,prepared statements,views

use classicmodels;
create user 'krishna'@'localhost' identified by '123456';

grant select,insert,update,delete 
on classicmodels.products 
to 'krishna'@'localhost';

select * from mysql.user;

-- 22/8/2023

drop user 'krishna'@'localhost';

create user 'backenddev'@'localhost' identified by '2818';

grant select on *.* to 'backenddev'@'localhost';

grant all on *.* to 'backenddev'@'localhost';
revoke all PRIVILEGES,GRANT OPTION from 'backenddev'@'localhost';

grant grant option on *.* to 'backenddev'@'localhost';


-- backenddev.sql --- 
create database abcd;
show databases;
use amazon;
show tables;
select * from product;

use amandb;
drop database amandb;

create user 'krishna'@'localhost' identified by '12345';
grant Select on *.* to 'krishna'@'localhost'; 


-- krishna.sql ----------

show databases;
use example;
show tables;

drop database example;

-- 22/08/2023
/*
TCL - Transaction Control Language:
Think of a transaction like making a pizza. You need to prepare the dough, add toppings, bake it, and serve it. Now, imagine you're doing this with a friend. If something goes wrong (like you run out of cheese), you want to make sure everything gets fixed, or you both agree to scrap the pizza-making attempt. In databases, transactions work similarly.

    COMMIT: Imagine you're making the pizza with your friend, and everything goes smoothly. You both high-five each other and decide to serve the pizza. This is like saving all the changes you made in the database.

    ROLLBACK: Now, imagine the cheese falls on the floor while you're making the pizza. You and your friend quickly decide to start over. In databases, if something goes wrong during a transaction, you can undo all the changes you made, just like starting over with the pizza.

ACID - Atomicity, Consistency, Isolation, Durability:
Think of ACID like the guarantees you get when you buy something online:

    Atomicity: Imagine buying a set of building blocks online. Either you get the whole set delivered, or you get nothing. You don't want to receive just a few blocks. Similarly, in databases, a transaction is like getting the complete set of changes or none at all.

    Consistency: Let's say you order a blue toy car online, but you receive a red one. That's a mistake, and you'd expect the company to fix it. In databases, consistency means that the changes you make are accurate and follow the rules, just like getting the right product.

    Isolation: Imagine you're sharing a toy with your friend, and you each have your own copy to play with. What your friend does with their toy shouldn't affect what you're doing with yours. Similarly, in databases, even if multiple people are making changes at the same time, their changes won't mess up each other's work.

    Durability: When you put your toys in a toy box, you expect them to stay there, even if you leave the room. In databases, once you've made changes and they're saved, they're like toys in the box – even if the power goes out, your changes won't disappear.

So, TCL helps you manage the steps of making changes (transactions) in a database, and ACID ensures that these changes are reliable, correct, and safe, just like ordering products online and expecting them to be right, separate from others, and not disappear after you've ordered them.

*/

-- 25/8/2023
use mysqlfsd;
create table Employees(id int primary key auto_increment,
name varchar(255),amount double);

insert into Employees(name,amount) values("Aman",10000),
("Ravi",5000),
("Krishna",1000),
("Aditya",500);
select * from employees;
desc employees;

set autocommit=0;
begin;
insert into employees values(8,"lalit",9000);
rollback;

begin;
delete from employees where id=8;
commit;

begin;
insert into employees values(8,"lalit",9000);
savepoint save1;
insert into employees values(9,"lalit 2",9000);
rollback to save1;

-- triggers

use classicmodels;
show tables;

select * from product_details;
select * from categories;

insert into categories values
(101,"phones","best phones"),
(102,"laptop","best laptop"),
(103,"fashion","best fashion"),
(104,"food","best food"),
(105,"guns","best guns");

insert into product_details values
(101,201,"Realme XT","Realme","best phone of realme"),
(101,202,"Redmi note 9","Redmi","best phone of redmi"),
(102,203,"HP Pavallion","HP","best laptop of HP"),
(102,204,"Dell inspiron","Dell","best laptop of dell"),
(103,205,"Denim jeans","denim","best jeans of denim"),
(null,206,"others","xyz","pata nahi"),
(null,207,"coffee","nescafe","best coffee");


create table soft_delete (cat_id int,product_id int,pname varchar(255)
,brand varchar(255),description varchar(255),delete_timestamp timestamp);

/*In MySQL, a delimiter is a special character used to signal the end of a SQL statement.
 The most commonly used delimiter in MySQL is the semicolon (;),
 which is used to separate statements from one another.*/
 
delimiter $$
create trigger delete_product
after delete on product_details
for each row
begin
	INSERT INTO SOFT_delete values(old.category_id,old.product_id,
    old.product_name,old.brand,old.product_desc,current_timestamp());
end $$

delimiter ;

delete from product_details where product_id=202;

drop trigger delete_product;
select * from product_details;

select * from soft_delete;