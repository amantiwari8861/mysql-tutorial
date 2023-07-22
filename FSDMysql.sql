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




