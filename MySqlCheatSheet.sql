-- single line comment
/* multiple line comment */
# documented comment

-- Checking no. of databases
show databases;

-- creating our database
create database AmanDb;

-- deleting db
drop database amandb;
 
-- using database
use amandb;

/*
	common data types
	tinyint 
	smallint
	mediumint
	int 
	bigint
	float 
	double
	decimal 
	char 
	varchar
	date
	datetime
	timestamp
	text
*/

-- creating table
create table TableName(col0 bit,col1 tinyint,col2 smallint,col3 mediumint,col4 int,
col5 integer,col6 bigint,col7 boolean,col8 bool);
create table TableName2(col1 float,col2 double,col3 decimal(5,2));
create table TableName3(col1 date,col2 time,col3 datetime,col4 timestamp,col5 year);
create table TableName4(col1 char(10),col2 varchar(255),col3 tinytext,col4 mediumtext,col5 text,col6 longtext);
-- create table TableName5(col1 binary,col2 varbinary,col3 tinyblob,col4 blob,col5 mediumblob,col6 longblob,col7 enum,col8 set);


create database Amandb3;

use amandb3;

create table stu(rollno int);
insert into stu values(101),
(102),
(103);
select * from stu;

alter table stu add column address varchar(50);
alter table stu drop column name;
alter table stu add column phone varchar(50) after rollno;
alter table stu modify column phone int;

desc stu;
describe stu;

alter table stu rename column phone to MobilePhone;

alter table stu rename to Students_Details;

select * from Students_Details;


drop table students_details;


create table Employee23(id int,name varchar(50),dob date);

insert into Employee23 values(21,"Aman",'1999-04-22');
select * from employee23;

insert into employee23(name) values("abcd");

insert into Employee23 values
(11,"xyz",'1888-04-22'),
(15,"xyz1",'1898-04-22'),
(18,"xyz2",'1828-04-22'),
(30,"xyz9",'1288-04-22');

select * from classicmodels.customers;

select customerNumber,customerName from classicmodels.customers;

insert into employee23(id,name) select customerNumber
,customerName from classicmodels.customers;


select * from employee23;

-- operators

create table Mycustomers(customerNumber int
,customerName varchar(255),city varchar(255),creditlimit double);
 
insert into mycustomers select customerNumber
,customerName,city,creditlimit from classicmodels.customers;

select * from mycustomers;

select * from mycustomers where customername='herkku gifts';
select * from mycustomers where creditlimit > 10000;
select * from mycustomers where creditlimit < 10000;
select * from mycustomers where creditlimit >= 11000;
select * from mycustomers where creditlimit <= 11000;
select * from mycustomers where creditlimit != 11000;
select * from mycustomers where creditlimit <> 11000; -- not equal to
select * from mycustomers where customerName like 'R%';
select * from mycustomers where customerName like '%Inc';

select * from mycustomers where customerName like '%Online%';


-- constraints  (Rules)
/*
create table students(roll int unique not null,customer_id varchar(255));
drop table students;
insert into students values(2,"xyz");
insert into students(customer_id) values("xyz");
select * from students;
*/
-- default

/*
create table students(roll int unique not null,
customer_id varchar(255),
city varchar(255) default 'Delhi'
);

drop table students;

insert into students values(2,"xyz","mumbai");
insert into students(customer_id) values("xyz");
insert into students(roll,customer_id) values(34,"xyz 2.0");

select * from students;

desc students;


create table students(roll int primary key,
customer_id varchar(255),
city varchar(255)
);
drop table students;
insert into students values(2,"xyz","mumbai");
insert into students(customer_id) values("xyz");


create table students(roll int,
customer_id varchar(255),
city varchar(255),
primary key(roll)
);
drop table students;
insert into students values(2,"xyz","mumbai");
insert into students(customer_id) values("xyz");
*/
/*
create table students(roll int,
customer_id varchar(255),
city varchar(255),
constraint myrule primary key(roll)
);
drop table students;
insert into students values(2,"xyz","mumbai");
insert into students(customer_id) values("xyz");

desc students;
*/
/*
-- super key
use amandb3;
create table students(
stu_name varchar(255),father_name varchar(255),
city varchar(255),
constraint myrule primary key(stu_name,father_name) -- composite key
);
insert  into students values
("ram","dasrath","ayodhya"),
("ram","ghanshyam","ayodhya"),
("shyam","dasrath","ayodhya"),
("shyam","ghanshyam","ayodhya");
select * from students;
insert into students values("ram","dasrath"," delhi");
*/

-- foreign key
/*
create table categories
(cat_id int primary key,
 cat_name varchar(255),
 description varchar(255)
 );
 create table products
 (category_id int,
 pro_id int primary key,
 p_model varchar(255),
 description2 varchar(255),
 -- foreign key(category_id) references categories(cat_id)
 constraint myforeignkey foreign key(category_id) references categories(cat_id)
 );
 
 insert into categories values
 (101,"shirts","denim"),
 (102,"jeans","levis"),
 (103,"laptop","laptops from india"),
 (104,"phone","realme");
 
 select * from categories;
 
 insert into products values
  (103,201,"lenevo thikpad","hbhhjm"),
 (103,202,"lenevo ideapad 100","hbhhjm"),
 (null,203,"lenevo ideapad 101","hbhhjm");
 
 select * from products;

 insert into products values
 (105,204,"lenevo thikpad","hbhhjm"); -- error

use amandb3;

 drop table categories; -- error
 drop table products;
  drop table categories;

 
 update categories set cat_id=107 where cat_id=103; -- restrict
 update categories set cat_id=107 where cat_id=104; 
 
 
create table categories
(cat_id int primary key,
 cat_name varchar(255),
 description varchar(255)
 );
 create table products
 (category_id int,
 pro_id int primary key,
 p_model varchar(255),
 description2 varchar(255),
 constraint myforeignkey foreign key(category_id) 
 references categories(cat_id)
  on delete cascade 
on update cascade );
 
 insert into categories values
 (101,"shirts","denim"),
 (102,"jeans","levis"),
 (103,"laptop","laptops from india"),
 (104,"phone","realme");
 
 select * from categories;
 
 insert into products values
  (103,201,"lenevo thikpad","hbhhjm"),
 (103,202,"lenevo ideapad 100","hbhhjm"),
 (null,203,"lenevo ideapad 101","hbhhjm");
 
 select * from products;

 insert into products values
 (105,204,"lenevo thikpad","hbhhjm"); -- error

 update categories set cat_id=107 where cat_id=103; -- restrict
 update categories set cat_id=107 where cat_id=104; 
 
 delete from categories where cat_id=107;
 select * from categories;
 select * from products;
 
 */
 
 
create table categories
(cat_id int primary key,
 cat_name varchar(255),
 description varchar(255)
 );
 create table products2
 (category_id int,
 pro_id int primary key,
 p_model varchar(255),
 description2 varchar(255),
 constraint myforeignkey foreign key(category_id) 
 references categories(cat_id)
-- on delete set null 
-- on update set null 
on update restrict  -- by default
on delete restrict  -- by default
);
 
 insert into categories values
 (101,"shirts","denim"),
 (102,"jeans","levis"),
 (103,"laptop","laptops from india"),
 (104,"phone","realme");
 
 select * from categories;
 
 insert into products values
  (103,201,"lenevo thikpad","hbhhjm"),
 (103,202,"lenevo ideapad 100","hbhhjm"),
 (null,203,"lenevo ideapad 101","hbhhjm");
 
 select * from products;

 insert into products values
 (105,204,"lenevo thikpad","hbhhjm"); -- error

 update categories set cat_id=107 where cat_id=103; -- restrict
 update categories set cat_id=107 where cat_id=104; 
 
 insert into products values
  (107,205,"lenevo thikpad","hbhhjm");
 
 delete from categories where cat_id=107;
 select * from categories;
 select * from products;
 drop table products;
  drop table categories;

-- keys finished 

-- joins started
use amandb3;


create table categories
(cat_id int primary key,
 cat_name varchar(255),
 description varchar(255)
 );
 create table products
 (category_id int,
 pro_id int primary key,
 p_model varchar(255),
 description2 varchar(255),
 constraint myforeignkey foreign key(category_id) 
 references categories(cat_id)
on update restrict  -- by default
on delete restrict  -- by default
);
 
 insert into categories values
 (101,"shirts","denim"),
 (102,"jeans","levis"),
 (103,"laptop","laptops from india"),
 (104,"phone","realme");
  
 insert into products values
  (103,201,"lenevo thikpad","hbhhjm"),
 (103,202,"lenevo ideapad 100","hbhhjm"),
 (null,203,"lenevo ideapad 101","hbhhjm"),
 (101,205,'superdry','hhhhb');

	select 10+50 as sumcol; -- as for alias

select * from categories,products; -- cross join

select * from categories;
select * from products;

-- inner joins
select * from categories
inner join products
on categories.cat_id = products.category_id;

select * from categories as c
inner join products as p
on c.cat_id = p.category_id;

-- left join
select * from categories as c
left join products as p
on c.cat_id = p.category_id;

-- right join 
select * from categories as c
right join products as p
on c.cat_id = p.category_id;


-- only left
select * from categories as c
left join products as p
on c.cat_id = p.category_id
where p.category_id is null;

-- only right
select * from categories as c
right join products as p
on c.cat_id = p.category_id
where c.cat_id is null;

-- emulating full outer join 
-- union all
select * from categories as c
left join products as p
on c.cat_id = p.category_id
union all
select * from categories as c
right join products as p
on c.cat_id = p.category_id;

-- union
select * from categories as c
left join products as p
on c.cat_id = p.category_id
union
select * from categories as c
right join products as p
on c.cat_id = p.category_id
where c.cat_id is null or
p.category_id is null;

-- remove common
select * from categories as c
left join products as p
on c.cat_id = p.category_id
where p.category_id is null
union
select * from categories as c
right join products as p
on c.cat_id = p.category_id
where c.cat_id is null;

-- remove common part from full join simulation

use amandb3;

select * from categories as c
left join products as p
on c.cat_id=p.category_id
where p.category_id is null  -- only left (uncommon data)
union
select * from categories as c
right join products as p
on c.cat_id=p.category_id
where c.cat_id is null; -- only right (uncommon data)

-- 

select * from classicmodels.orders;

use classicmodels;

select * from orders;
select count(*) as 'all orders' from orders; 
select count(*) 'all orders' from orders; 

-- aggregate functions
-- count
-- max 
-- min
-- avg
-- sum

-- group by

select status,count(*) 'order count' from orders
group by status;


select * from customers;

select country ,count(*) from customers
group by country;

select country ,sum(creditlimit) from customers
group by country
order by country;

select country ,avg(creditlimit) from customers
group by country
order by country;


select country ,min(creditlimit),max(creditlimit) 
from customers
group by country
order by country;


select * from customers
order by country,state;

-- group by according to multiple column
select country,state,count(*) from customers
group by country,state
order by country,state;

-- inconsistency in data using group by
select city,country,state,count(*) from customers
group by country,state
order by country,state;

select city,country,state,count(*) from customers
group by country,state,city
order by country,state;

-- filtering
select country,state,count(*) from customers
group by country,state
order by country,state;

-- employee 
   -- country
   -- state
   -- counting employees that are living in same country and state 
   -- counting employees that 
   -- are living in same country and state where the no. of
   -- employees greater than 2


select country,state,count(*) from customers
group by country,state
-- error -- where count(*) > 2
having count(*) > 2
order by country,state;

-- subquery (nested query)
use classicmodels;
select * from customers order by contactfirstname ;

select * from customers
where creditlimit > ( select creditlimit
from customers
where contactfirstname='peter' and contactlastname='Ferguson');


select * from customers
where creditlimit > --   >117300
( 
	select creditlimit -- 117300
	from customers
	where contactlastname='Ferguson' 
	and contactfirstname=( -- peter
		select contactfirstname
		from customers where customernumber = 114
        )
);
-- inner query executes first

select * from customers
where city in ('Allentown','Amsterdam');

select * from customers
where city in (select city from customers 
where city like 'A%');

select * from customers
where city =any(select city from customers 
where city like 'A%');

-- =any is just like in 

use amandb;
select * from categories;
select * from products;

select * from products as p
where exists
(select * from categories as c
where p.category_id=c.cat_id);


select * from products as p
where not exists
(select * from categories as c
where p.category_id=c.cat_id);

use classicmodels;
select buyprice from products order by buyprice; -- start=15.91  end=103.42
select priceeach from orderdetails order by priceeach;-- start=26.55 end=70.08

select productname,buyprice -- start=15.91  end=103.42
from products 
where buyPrice >Any(
select priceeach from orderdetails -- start=26.55 end=70.08
)
order by buyprice;
 -- final result start = 26.72 end=103.42
 
/*
-- error in result
select productname,buyprice from products 
where buyPrice <Any (select priceeach from orderdetails)
order by buyprice; -- start= 15.91 end=103.42
*/ 

/*
> ALL means greater than every value. In other words, it means greater than 
the maximum value. For example, > ALL (1, 2, 3) means greater than 3.
> ANY means greater than at least one value, that is, greater than the minimum.
So > ANY (1, 2, 3) means greater than 1.
*/

select productname,msrp -- start=15.91  end=103.42
from products 
where msrp >All(
select priceeach from orderdetails -- start=26.55 end=70.08
);


select * from employees;
select * from products;

-- dcl means data control language 
use classicmodels;
create user 'junior' identified by '8861';
grant select on employees to junior;
grant select,insert,update,delete on employees to junior;
grant All on employees to junior;

revoke delete on employees from junior;
revoke All on employees from junior;

drop user junior;

select * from mysql.user;

-- prepared statement

prepare showCustomerData from
'select * from customers where customernumber=?';

set @custId=112;
execute showCustomerdata using @custid;

set @custId=103;
execute showCustomerdata using @custid;

deallocate prepare showCustomerdata;

-- stored procedure in mysql

CREATE PROCEDURE dorepeat(p1 INT)
BEGIN
  SET @x = 0;
  REPEAT SET @x = @x + 1; UNTIL @x > p1 END REPEAT;
END;

call dorepeat(5);

/*
 If you use the mysql client program to define a 
 stored program containing semicolon characters, a problem arises. 
 By default, mysql itself recognizes the semicolon as a statement delimiter,
 so you must redefine the delimiter temporarily to cause mysql to pass the
 entire stored program definition to the server.
To redefine the mysql delimiter, use the delimiter command.
*/

delimiter $$
CREATE PROCEDURE dorepeat(p1 INT)
BEGIN
  SET @x = 0;
  REPEAT SET @x = @x + 1; 
  UNTIL @x > p1 END REPEAT;
  select @x as 'value of x';
END $$;
delimiter ;

call dorepeat(10);
call dorepeat(80);
call dorepeat(100);

drop procedure dorepeat;

/*
delimiter is changed to $$ to enable the entire definition to be passed to the 
server as a single statement, and then restored to ; before invoking the procedure.
 This enables the ; delimiter used in the procedure body to be passed through 
 to the server rather than being interpreted by mysql itself.
*/

delimiter $$
create procedure getCustomers()
begin
select * from customers;
end $$
delimiter ;
call getcustomers();

-- loops within stored procedures

create table MathsTable(col1 int);

delimiter $$
create procedure tableprint(num int)
begin
	set @i=1;
	repeat 
		insert into MathsTable values(num*@i);
		set @i=@i+1;
	until @i>10 
	end repeat;
end $$;
delimiter ;

call tableprint(7);
drop procedure tableprint;

select * from mathstable;
drop table mathstable;

-- triggers 
create table newtable( column1 int);

create trigger newentries
before insert on mathstable
for each row
insert into newtable values(new.col1);

insert into mathstable values(79);
select * from newtable;
select * from mathstable;

show triggers;
delimiter $$
create trigger remoldentries
after insert on mathstable
for each row
begin
insert into newtable values(new.col1);
end $$
delimiter ;
-- similarly we can implement 
-- before update after update
-- befor delete after delete

/*You can't delete the rows from the same table on which you implement the trigger. 
Because on insert mysql locks the table and can't delete the rows because delete
needs locking so its a deadlock sitution, that's why mysql would not allow this.*/

drop trigger remoldentries;

delimiter $$
create trigger updateEntry
after update on mathstable
for each row
begin
if new.col1 >50 then
insert into newtable values(new.col1);
end if;
end $$
delimiter ;

update mathstable set col1=80 where col1=79;

select * from newtable;
update mathstable set col1=23 where col1=79;


-- tcl transaction control language

-- commit,rollback,savepoint 

use classicmodels;
select * from categories;
desc categories;

create table products2
 (category_id varchar(20),
 pro_id int primary key,
 p_model varchar(255),
 description2 varchar(255),
 constraint myforeignkey2 foreign key(category_id)
 references categories(categoryid));

 insert into products2 values
  ('103',201,"lenevo thikpad","hbhhjm"),
 ('103',202,"lenevo ideapad 100","hbhhjm"),
 (null,203,"lenevo ideapad 101","hbhhjm"),
 ('101',205,'superdry','hhhhb');
 
 set autocommit=0;
 set autocommit=off;
-- transactions
set autocommit=1;
set autocommit=on;

 
 start transaction;
insert into products2 values  ('103',213,"lenevo thikpad","hbhhjm");
commit;
 
 select * from products2;

create table User1(id1 int,name1 varchar(255),amount1 float);
create table User2(id2 int,name2 varchar(255),amount2 float);
insert into User1 values(100,'aman',7000);
insert into User2 values(100,'Rohan',8000);

start transaction;
update user1 set amount1=amount1-500;
update user2 set amount2=amount2+500;
commit;

select * from user1;-- 7500
select * from user2;-- 8500

start transaction;
update user1 set amount1=amount1-500;
update user2 set amount2=amount2+500;
commit;

select * from user1;-- 7000
select * from user2;-- 9000


start transaction;
update user1 set amount1=amount1-500;
update user2 set amount2=amount2+500;
rollback;


delete from user1 where id1=100;

rollback;

insert into user1 values(101,'ankit',9000);

rollback;

start transaction;
insert into user1 values(101,'ankit',9000);
savepoint s1;
insert into user1 values(102,'ankit 2',19000);
rollback to s1;

select * from user1;-- 7000


desc employees;


create table AllData(cat_id int,category_name  varchar(255)
,product_id varchar(255)
,product_name varchar(255));

insert into Alldata select category_id,category_name,
pro_id,p_model from categories c 
inner join products2 p
on p.category_id=c.categoryid;

select * from AllData;

drop view udata;

create view udata as
select cat_id,category_name
from AllData;

select * from udata;

insert into udata values(108,'Goods');
insert into udata values(109,'Goodies');

select * from udata;
select * from AllData;

delete from udata where cat_id=101;


select * from udata;
select * from AllData;

update udata set category_name='Hp ke laptop' where cat_id=108;

select * from udata;
select * from AllData;

drop table alldata;

use stugre;
show tables;

describe student;









