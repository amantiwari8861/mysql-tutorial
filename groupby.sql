create database groupdb;
use groupdb;
create table students(roll int primary key auto_increment,
name varchar(30),course varchar(30),marks varchar(40),dept varchar(30));

select * from students;
truncate students;

select * from students group by dept ;

select  count(*) from students;
select distinct count(*) from students;
select min(marks) from students;
select max(marks) from students;
select avg(marks) from students;
select sum(marks)/avg(marks) as 'count' ,count(*) from students;
set @num1=50,@num2=30;
select @num1+@num2 as 'sum';
prepare stmt1 from 
'select ? + ? as sum ;';
execute stmt1 using @num1,@num2;
deallocate prepare stmt1;
