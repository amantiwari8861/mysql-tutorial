use  mydatabase;

LOAD DATA INFILE 'c:/users/aman_tiwari/desktop/book2.csv' 
INTO TABLE abc 
FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

create table abc(col1 varchar(30),col2 varchar(30));

C:\Users\Aman_Tiwari\Desktop


LOAD DATA INFILE 'C:/Book1.csv' 
INTO TABLE abc 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';

SHOW VARIABLES LIKE "secure_file_priv";


insert into abc values ('aman','tiwari');

select * from abc;





LOAD DATA INFILE 'c:/temp/student.csv' 
INTO TABLE abc 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


use mydatabase;

create table student (sname char(30));
create table teacher (tname char(30),sname char(30));

DELIMITER @@
create trigger tinsert 
before insert on student for each row
begin 
insert into teacher(sname) values(new.sname);
end @@
DELIMITER ;


insert into student values('aman');

select * from teacher;

drop trigger tinsert;
show triggers;


DELIMITER @@
create trigger tinsert 
before insert on student for each row
begin 
insert into teacher(sname) values(sname);
end @@
DELIMITER ;
