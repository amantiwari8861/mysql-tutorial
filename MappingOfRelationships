create database MapEntities; 
use MapEntities;
create table students(roll_no int primary key auto_increment,
name varchar(255),
Address varchar(255));

create table Books(Book_code int primary key auto_increment,
title varchar(255),price double);

create table Books_Issued(student_rollno int,Book_Code int,
constraint books_givento primary key(student_rollno,Book_code),
constraint stu_rollno foreign key(student_rollno) references students(roll_no),
constraint book_code foreign key(book_code) references books(book_code));

show tables;

describe books;
describe students;
describe books_issued;

insert into students values(21,"Aman","imarticus noida 62");
insert into books values(10001,"Fundamentals of SQL",1000);
insert into books_issued values(21,10001);
insert into books_issued values(25,10001); 
-- error bcz a student having rollno 25 doesn't exist

-- H.w institute management system er diagram and map the er into tables
