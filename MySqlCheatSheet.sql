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
-- ddl - create, alter , drop , truncate
-- dml - insert, update delete
-- dql - select
-- dcl - grant, revoke
-- tcl - commit rollback , savepoint


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
set sql_safe_updates = 0;

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

/*In MySQL, a delimiter is a special character used to signal the end of a SQL statement.
 The most commonly used delimiter in MySQL is the semicolon (;),
 which is used to separate statements from one another.*/
-- stored procedure in mysql

delimiter //
create procedure selectAllProduct()
begin
select * from Users;
end //
delimiter ;

call selectAllProduct();

drop procedure selectAllProduct;

delimiter //
create procedure selectAllProduct()
begin
select * from Users;
end //
delimiter ;

call selectAllProduct();
drop procedure selectAllProduct;

call selectAllUsers();


-- IN example

delimiter //
create procedure selectUserById(IN uid int)
begin
select * from Users where id=uid;
end //
delimiter ;

call selectUserById(1);

-- out example 

delimiter //
create procedure getUserEmailById(in uid int,out uemail varchar(50))
begin
select email into uemail from Users where id=uid;
end //
delimiter ;

call getUserEmailById(1,@EMAIL);

SELECT concat('THE EMAIL IS :' , @EMAIL) as 'result';

-- inout

delimiter //
create procedure updateProductPrice(in pid int,inout price2 double)
begin
	update products set price=price2+price2*15/100 where id=pid;
	select price into price2 from products where id=pid; -- new price
end //
delimiter ;

set @temp=0.0;
select price into @temp from products where id=1; -- old price
call updateProductPrice(1,@temp);

select @temp as 'updated price';

select * from products;


-- -------------------------------------

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



-- subqueries,CTE and window function
# Alter Query
-- 1) Used to make changes in the structure of the table.
-- 2) There are 4 commands with the alter query
-- a) change - Used to rename a column + add/change its data types +
--             add/change/remove its constraints.
-- b) modify - Used to change the data types of a colum +
--             add/change/remove its constraints
-- c) add -  used to add a new column with its data type + add constraint
-- d) drop - used to drop an exitsing column
-- e) rename - used to rename a column.
alter table students change City Location varchar(40) not null;
alter table students change Location Location varchar(40);
# rename Course to subject with datatype varchar(30);
alter table students change Course Subject varchar(30);


-- string and date functions 

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

-- cte (common table expression)
use classicmodels;
show tables;
select * from offices;
select * from employees;

SELECT VERSION();

WITH countEmpFromTitle AS (
    SELECT jobTitle, officeCode, COUNT(*) AS empCount
    FROM employees
    GROUP BY jobTitle, officeCode
)
SELECT * FROM countEmpFromTitle;

WITH AvgSalaries AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, a.avg_salary
FROM departments d
JOIN AvgSalaries a ON d.department_id = a.department_id
WHERE a.avg_salary > 50000;

-- window functions
-- mysqldump -u your_username -p school > school_dump.sql


-- Example Table Creation
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
-- Adding a Primary Key
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

-- Adding a Unique Constraint
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

-- Adding a Foreign Key Constraint
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Adding a Check Constraint (MySQL 8.0.16 and later)
ALTER TABLE employees
ADD CONSTRAINT check_salary CHECK (salary > 0);

-- Dropping a Primary Key
ALTER TABLE employees
DROP PRIMARY KEY;

-- Dropping a Unique Constraint
ALTER TABLE employees
DROP INDEX unique_email;

-- Dropping a Foreign Key Constraint
ALTER TABLE employees
DROP FOREIGN KEY fk_department;

-- Dropping a Check Constraint (MySQL 8.0.16 and later)
ALTER TABLE employees
DROP CONSTRAINT check_salary;

-- Adding Constraints
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE employees
ADD CONSTRAINT check_salary CHECK (salary > 0);

-- Disabling Foreign Key Checks
SET foreign_key_checks = 0;

-- Performing Bulk Insert
INSERT INTO departments (department_name) VALUES ('HR'), ('IT'), ('Finance');

INSERT INTO employees (first_name, last_name, email, department_id, salary)
VALUES ('John', 'Doe', 'john.doe@example.com', 1, 5000),
       ('Jane', 'Smith', 'jane.smith@example.com', 2, 6000);

-- Enabling Foreign Key Checks
SET foreign_key_checks = 1;

-- Dropping Constraints
ALTER TABLE employees
DROP INDEX unique_email;

ALTER TABLE employees
DROP FOREIGN KEY fk_department;

ALTER TABLE employees
DROP CONSTRAINT check_salary;


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

-- 
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
    ELSEIF (credit >= 50000 AND 
			credit <= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END$$
DELIMITER ;

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


