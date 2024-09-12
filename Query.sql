show databases;
create database ducat_mysql;
use ducat_mysql;
/*this query creates a table named students 
having columns id and name*/
create TablE students(id int,name varchar(50));

#string -> sequence or collection of characters
-- "Aman@881"
/*
	multiple 
    line 
    comment
*/

/*int -> 4 bytes
-2^n-1 to 2^n-1 -1 where n= no. of bits
1 byte = 8 bits
-2^31 to 2^31 -1
-2,14,74,83,648  to 2,14,74,83,647*/


desc students;
insert into students values(2147483647,"Dev@1234");
insert into students values(2147483648,"Raj@1234");

select * from students;

insert into students values
(16321,"Bharat"),
(17542,"Adarsh"),
(17794,"Dhruv");

select * from students;

-- frontend -> backend -> DB

-- 23-06-2024

show databases;
drop database ducat_mysql;

create database ducat_mysql;
use ducat_mysql;
show tables;

create table students(id int,
name varchar(50),mobileNo bigint,
dob date,isMarried boolean,
gender char(1),address varchar(255),fee float,
details text);
drop table students;
desc  students;

# insert into students(id) values("@"); # error 
insert into students values(100,"Aman",9891062743,
"2024-06-23",false,"M","delhi 96",123345,"Developer");

/*
	multiple
    line 
    comment
*/

select * from students;

insert into students values(
101,"Aman Tiwari",9891062743,
"2024-06-23",false,"M",
"delhi 96 @1234",123345,
"Developer");

select id,name,dob from students;

insert into students values(102);
insert into students(id,name) values(102,"Naman");

select * from students;

# C -> create
# R -> read
# U -> update
# D -> delete

update students set name="Raj" where id=101;

select * from students;

delete from students where id=102;

-- drop deletes the entire table 
-- delete only deletes a particular entry
-- truncate delete entire tables data only not table itself
use ducat_mysql;
truncate students;
drop table students;

select * from students;

delete from students ;
update students set name="Naman"; 

-- update anamoli 
update students set name="Naman" where id=101;
insert into students values
(102,"Ravi",9891062743,"2024-06-23",false,"M",
"delhi 96 @1234",123345,"Developer"),
(103,"Raj",9891062743,"2024-06-23",false,"M",
"delhi 96 @1234",123345,"Developer"),
(104,"Monu",9891062743,"2024-06-23",false,"M",
"delhi 96 @1234",123345,"Developer"),
(105,"Shikha",9891062743,"2024-06-23",false,"M",
"delhi 96 @1234",123345,"Developer");

update students set name="Raj singh" where id=103;

insert into students(name,mobileNo) values
("Ravi",9891062743);

 -- constraints -> 
 drop table students;
 
create table students(id int unique not null,
name varchar(50),mobileNo bigint unique,
dob date not null,isMarried boolean,
gender char(1),address varchar(255),fee float,
details text );

desc students;

insert into students values
(102,"Ravi",9891062743,"2024-06-23",false,"M",
"delhi 96 @1234",123345,"Developer");
insert into students values
(103,"Ravi",9891062743,"2024-06-23",false,"M",
"delhi 96 @1234",123345,"Developer");
insert into students values
(103,"Ravi",8448179216,"2024-06-23",false,"M",
"delhi 96 @1234",123345,"Developer");

insert into students(name) values("Raj 2.0");
insert into students(id,name) values(105,"Raj 2.0");
insert into students(id,name,dob) values(105,"Raj 2.0",curdate());

drop table students;

create table students(id int unique not null,
name varchar(50),mobileNo bigint unique,
dob date not null,isMarried boolean,
gender char(1),address varchar(255) not null default "india",fee float,
details text );

insert into students(id,name,dob) values(105,"Raj 2.0",curdate());
select * from students;
insert into students(id,name,dob,address) 
values(108,"Raj 2.0",curdate(),"noida sector 16");

-- Normalization 1NF,2NF,3NF 

-- categories and products 
use ducat_mysql;
create table categories(
cat_id int primary key auto_increment,
cname varchar(255),
description varchar(255));

create table products(cat_id int,p_id int,
pname varchar(255),price double,
primary key(p_id),
foreign key(cat_id) references categories(cat_id)); 

insert into categories values
(100,"laptops","programming laptops i7"),
(101,"mobiles","best phones i7"),
(102,"cloths","best fabric of india");

select * from categories;
drop table products;
drop table categories;

insert into products values
(100,201,"lenovo legion",120000),
(100,202,"hp pavellion",12000),
(101,203,"Iphone 15",74000),
(101,204,"realme xt",16500),
(101,205,"one plus 12",74000);

insert into products(p_id,pname,price)
 values(206,"one plus 10 pro",65000);


select * from products;

insert into products values
(103,209,"lenovo legion",120000);

delete from categories where cat_id=100;
update categories set cat_id=105 where cat_id=100;

update categories set cat_id=105 where cat_id=102;
select * from categories;

update categories set cname="business series laptop" where cat_id=100;


create table categories(
cat_id int primary key auto_increment,
cname varchar(255),
description varchar(255));

create table products(cat_id int,p_id int,
pname varchar(255),price double,
primary key(p_id),
foreign key(cat_id) references categories(cat_id)
on update cascade 
on delete cascade
-- on delete set null
-- on update set null
-- on delete restrict
-- on update restrict
); 


select * from categories;
select * from products;

update categories set cat_id=105 where cat_id=100;
delete from categories where cat_id=105;


-- 
drop database ducat_mysql;
create database ducat_mysql;
use ducat_mysql;



create table categories(
cat_id int primary key auto_increment,
cname varchar(255),
description varchar(255));

create table products(cat_id int,p_id int,
pname varchar(255),
price double check(price>0),
primary key(p_id),
foreign key(cat_id) references categories(cat_id)
on update cascade 
on delete set null
); 

insert into categories values
(100,"laptops","programming laptops i7"),
(101,"mobiles","best phones i7"),
(102,"cloths","best fabric of india");

insert into products values
(100,201,"lenovo legion",120000),
(100,202,"hp pavellion",12000),
(101,203,"Iphone 15",74000),
(101,204,"realme xt",16500),
(101,205,"one plus 12",74000);



select * from categories;
select * from products;

update categories set cat_id=105 where cat_id=100;
delete from categories where cat_id=105;




use classicmodels;
show tables;

select * from customers;

-- data filtering using operators

select * from customers order by customerName asc;
select * from customers order by customerName desc;

select * from customers order by customerNumber;

select * from customers order by customerNumber limit 20;
-- relational operator
select * from customers where creditlimit >20000;
select * from customers where creditlimit <20000;
select * from customers where creditlimit >=20000;
select * from customers where creditlimit <=21000;
select * from customers where creditlimit =21000;

select customerNumber,contactFirstName,phone,city,creditlimit
 from customers 
 where creditlimit =21000;

select * from customers where contactFirstName = "jean";

select * from customers where contactFirstName like 'Ca%';
select * from customers where contactFirstName like '%e';
select * from customers where contactFirstName like '%e%';

select * from customers where contactFirstName like 'Jul_e';
select * from customers where contactFirstName like '_____';

select * from customers where city='NYC';
select * from customers where city='NYC' and creditlimit>80000;
select * from customers where city='NYC' or creditlimit>80000;

select * from customers where city='NYC' and creditlimit>80000;

-- online banking database (5 tables atleast) and 5 entries in each 

use classicmodels;

select * from customers where creditlimit between 20000 and 60000 order by creditlimit;
select * from customers where country in ("France","USA");
select * from customers where country <> "France"; -- not equal to 

select customerName,city,creditlimit,creditlimit*1.15 from customers where designation="sales";
select 10+50;


select customerName,city,creditlimit,
creditlimit*0.15 ,creditlimit*1.15 
from customers ;
-- creditlimit*15/100 ->0.15

drop database ducat_mysql;

-- 
use ducat_mysql;

create table ProductNames(pname varchar(255) primary key);

create table categories(
cat_id int primary key auto_increment,
cname varchar(255),
description varchar(255));

create table products(cat_id int,p_id int,
pname varchar(255),price double,
primary key(p_id),
constraint category_id_fk foreign key(cat_id) 
references categories(cat_id),
constraint pname_fk foreign key(pname) references ProductNames(pname)
); 



insert into categories values
(100,"laptops","programming laptops i7"),
(101,"mobiles","best phones i7"),
(102,"cloths","best fabric of india");

insert into products values
(108,201,"lenovo legion",120000),
(100,202,"hp pavellion",12000),
(101,203,"Iphone 15",74000),
(101,204,"realme xt",16500),
(101,205,"one plus 12",74000);


insert into products(cat_id,p_id) values (108,201);
insert into products(p_id,pname) values (108,"xyz");

-- compound or composite
-- many to many
-- vendor - products
drop table products;

create table vendor(vendor_id int primary key,vname varchar(255));
create table products(product_id int primary key,pname varchar(255));

create table vendor_product(vendor_id int,product_id int,
constraint vendorid_fk foreign key(vendor_id) 
references vendor(vendor_id),
constraint product_id_fk foreign key(product_id) 
references products(product_id)
,primary key(vendor_id,product_id)
);

insert into vendor values
(100,"Aman"),(101,"Dhruv"),(102,"Raj");

insert into products values
(201,"mobile"),(202,"Laptop"),(203,"Cloths");

insert into vendor_product values 
(100,201),(100,202),(101,201);

select * from vendor;
select * from products;
select * from vendor_product;

-- alter command

use ducat_mysql;
show tables;

desc categories;
select * from categories;

insert into categories values(100,"cloth","xyz");
insert into categories(cname,description) values("elctronic","xyz");


alter table categories add year varchar(20);
alter table categories add brand varchar(20) not null ;
alter table categories modify year date;
alter table categories modify brand varchar(20) unique ;
alter table categories rename column brand to company ;

alter table categories add xyz varchar(50) after cat_id;
alter table categories add abcd varchar(50) FIRST ;

alter table categories drop xyz;

-- column -> add,add first,last,after ,modify,drop,rename
alter table categories modify cat_id int; -- removed auto increment
alter table categories drop primary key;
alter table categories add primary key(cat_id);
desc categories;

rename table categories to category;
desc category;

show tables;

set foreign_key_checks=0;

insert into vendor_product values(299,4000);
select * from vendor_product;

desc vendor_product;
set foreign_key_checks=1;
insert into vendor_product values(399,5000);

alter table vendor_product drop constraint product_id_fk;
alter table vendor_product drop constraint vendorid_fk;

alter table vendor_product add 
constraint product_id3_fk foreign key(product_id) 
references products(product_id);

use ducat_mysql;
insert into vendor_product values(399,5000);
insert into vendor_product values(292,5000);
insert into vendor_product values(9889,5000);

select * from products;
desc products;

-- h.w try adding foreign key in any table
alter table vendor_product add 
constraint product_id3_fk foreign key(product_id) 
references products(product_id);

-- joins
drop database ducat_mysql;

create database ducat_mysql;
use ducat_mysql;
 -- cross join 
create table Table1(A int,B int);
create table Table2(C int,D int);

insert into Table1 values(1,11),(2,22);
insert into Table2 values(33,333),(44,444);

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

-- inner join 
select categoryid,category_name,product_name,xyz
from categories as c 
inner join products as p
on c.categoryid = p.catid;

select * from customers;

select c.customerNumber,customerName
from customers as c;

select concat(contactFirstName," ki id ",customerNumber," hai ") details
from customers;

-- inner join 
use ducat_mysql;
show tables;

select * from
categories
inner join products
on categories.categoryid=products.catid;

select c.categoryid,p.product_name 
from categories c
inner join products p
on c.categoryid=p.catid;

-- left join 
select * 
from categories c
left join products p
on c.categoryid=p.catid;

-- right join 
select * 
from categories c
right join products p
on c.categoryid=p.catid;

use classicmodels;
select * 
from productlines pl
inner join products p
on pl.productline=p.productline
inner join orderdetails o
on o.productcode=p.productcode
inner join orders ord
on ord.ordernumber=o.ordernumber;

use ducat_mysql;

-- only left
select * 
from categories c
left join products p
on c.categoryid=p.catid
where p.product_id is null;

-- only right
select * 
from categories c
right join products p
on c.categoryid=p.catid
where c.categoryid is null;

-- full outer
select * 
from categories c
left join products p
on c.categoryid=p.catid
union all
select * 
from categories c
right join products p
on c.categoryid=p.catid;

-- 
select * 
from categories c
left join products p
on c.categoryid=p.catid
union 
select * 
from categories c
right join products p
on c.categoryid=p.catid;



select * 
from categories c
left join products p
on c.categoryid=p.catid
where p.product_id is null
union
select * 
from categories c
right join products p
on c.categoryid=p.catid
where c.categoryid is null;


-- use of using clause
use classicmodels;

select * 
from productlines pl
inner join products p
-- on pl.productline=p.productline;
using(productline);

select * from employees;

select concat(e2.employeeNumber,"(",e2.firstName,
") reports to ",e1.employeeNumber,"(",e1.firstName,")") 
as "emp report details"
from employees e1
join employees e2
on e1.employeeNumber=e2.reportsTo;

-- AGGREGATION
use classicmodels;
select * from customers;

select country,count(*) from customers
group by country order by country;

select country,count(*) from customers
where country="USA"
group by country order by country;


select country,count(*),contactFirstName -- error
 from customers
group by country 
order by country;


select country,count(*) as customers,
sum(creditLimit) totalCredit
from customers
group by country 
order by country;

select country,count(*) as customers,avg(creditlimit),
min(creditlimit),max(creditlimit),
sum(creditLimit) totalCredit
from customers
group by country 
order by country;


select country,state,count(*) as customers,avg(creditlimit),
min(creditlimit),max(creditlimit),
sum(creditLimit) totalCredit
from customers
group by country,state
order by country;

select country,state,city,count(*) as customers,avg(creditlimit),
min(creditlimit),max(creditlimit),
sum(creditLimit) totalCredit
from customers
group by country,state,city
order by country,state,city;


select country,state,city,count(*) as customers,avg(creditlimit),
min(creditlimit),max(creditlimit),
sum(creditLimit) totalCredit
from customers
group by state,city,country
order by country;


select country,city
from customers
order by country,city;


select country,state,city,count(*) as customers,avg(creditlimit) as avgcredit,
min(creditlimit),max(creditlimit),
sum(creditLimit) totalCredit
from customers
group by country,state,city
order by country,state,city
limit 15;

-- having

select country,count(*)
from customers
group by country
having count(*) >= 5
order by country;

select country,count(*) as noOfcustomer
from customers
group by country
having noOfcustomer >= 5
order by country;

select country,count(*) as noOfcustomer,sum(creditlimit) as total
from customers
group by country
having total>50000
order by country;

-- country city creditlimit > 30000;

select country,state,count(*) as noOfcustomer,sum(creditlimit) as total
from customers
group by country,state
having total>=50000
order by country,state;

-- views
CREATE VIEW customerPayments
AS 
SELECT 
    customerName, 
    checkNumber, 
    paymentDate, 
    amount
FROM
    customers
INNER JOIN
    payments USING (customerNumber);

SHOW FULL TABLES IN classicmodels WHERE TABLE_TYPE LIKE 'VIEW';

use classicmodels;
select * from customerPayments;
select * from customers;
select * from payments;

update customerPayments set amount=9000 where checkNumber='HQ336336';

drop view customerPayments;

-- string and date functions

-- String functions - LCase, UCase, Length, Mid, concat 
select lcase('NASA');
select lower('HELLO');
select ucase('india') as Country;
select upper('india') as Country;
select Length('HEllo') as Length;   -- length of the string

-- add1,add2,city
select concat('Hello',' ','World');
select concat(ucase('hello'),' ',ucase('world'));

-- trim - removes leading or trailing whitespace from string
select length(' Welcome to SQL '); -- 16
select trim(' Welcome to SQL '), length(trim(' Welcome to SQL '));
select ltrim(' Welcome to SQL '), length(ltrim(' Welcome to SQL '));
select rtrim(' Welcome to SQL '), length(rtrim(' Welcome to SQL '));
select reverse('Welcome to SQL');


select length(trim("      Aman     "));


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
select replace("Welcome to SQL and SQL", "SQL", "Python");
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

select lpad('1100001',32,'0');


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
select position("7" IN "Hello 273982734") AS MatchPosition;
select locate('7','Hello 273982734',9);
SELECT LOCATE('7', "Hello 273982734",locate('7','Hello 273982734')+1);
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
select timediff('20:25:23','6:56:12');  -- difference is returned in HH:MM:SS - 01:29:11
select timediff('06:56:12','08:25:23'); 
select timediff('2020-03-11 08:25:23','2022-03-11 6:56:12'); -- difference is returned in time
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

-- variables
set @a=10.567;
set @b=20.33;
select @a+@b;


-- stored procedures

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

/*In MySQL, a delimiter is a special character used to signal the end of a SQL statement.
 The most commonly used delimiter in MySQL is the semicolon (;),
 which is used to separate statements from one another.*/
-- stored procedure in mysql

delimiter //
create procedure selectAllcustomers()
begin
select * from classicmodels.customers; -- let there is 100 lines
end //
delimiter ;
call selectAllCustomers();
drop procedure selectAllCustomers;

-- IN example
delimiter //
create procedure selectCustomerByCustNo(IN cNo int)
begin
select * from customers where customerNumber=cNo;
end //
delimiter ;
call selectCustomerByCustNo(112);

delimiter //
create procedure selectCustomerByCustNo2(IN cNo int)
begin
select country,city from customers where customerNumber=cNo;
end //
delimiter ;
call selectCustomerByCustNo2(112);



-- out example 

delimiter //
create procedure getUserPhoneById(in uid int,out phoneNo varchar(50))
begin
select phone into phoneNo from customers where customerNumber=uid;
end //
delimiter ;

call getUserPhoneById(103,@Phone);
SELECT concat('THE Phone No. IS :' , @Phone) as 'result';

-- inout

delimiter //
create procedure updateCustomerCreditLimit(in pid int,inout cLimit double)
begin
	update customers set creditlimit=cLimit+cLimit*15/100 where customerNumber=pid;
	select creditLimit into cLimit from customers where customerNumber=pid; -- new price
end //
delimiter ;

set @temp=0.0;
set @custId=112;
select creditlimit into @temp from customers where customerNumber=@custId; -- old price
call updateCustomerCreditupdateCustomerCreditLimitLimit(@custId,@temp);
select @temp as 'updated price';


select * from customers;


use classicmodels;
delimiter $$
CREATE PROCEDURE dorepeat(p1 INT)
BEGIN
  SET @x = 0; -- initialization
  REPEAT SET @x = @x + 1;  -- increment
  UNTIL @x > p1 END REPEAT; -- condition
  select @x as 'value of x'; -- task
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

-- function
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
    ELSEIF (credit <= 50000 AND credit >= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END$$

DELIMITER ;

select customerNumber,contactFirstName,
creditLimit,customerlevel(creditlimit) from customers;

drop function CustomerLevel;

SELECT ROUTINE_NAME, ROUTINE_TYPE, ROUTINE_SCHEMA
FROM information_schema.ROUTINES
-- WHERE ROUTINE_TYPE = 'PROCEDURE'
WHERE ROUTINE_TYPE = 'FUNCTION'
AND ROUTINE_SCHEMA = 'classicmodels';


-- write in csv
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

create database bank;
use bank;

show tables;
select * from account;

delimiter $$
create procedure getCustomerData(in accNo bigint)
begin
	select acc.account_no,acc.balance,customer_name,mobile_phone
    from customer_credit_card ccc
    inner join customer c 
    using(customer_id)
    inner join account acc
    using (account_no)
    inner join credit_card cc
    using(card_no)
    where acc.account_no=accNo;
end $$
delimiter ;

call getCustomerData(111199);

drop procedure getCustomerData;