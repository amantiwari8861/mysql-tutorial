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

insert into clock(col2) values(now());
insert into clock(col3) values(now());
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





