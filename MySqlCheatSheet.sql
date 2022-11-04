--single line comment
--multiple line comment

--Checking no. of databases
show databases

--creating our database
create database AmanDb;

--using database
use amandb

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

--creating table
create table TableName(col0 bit,col1 tinyint,col2 smallint,col3 mediumint,col4 int,
col5 integer,col6 bigint,col7 boolean,col8 bool);
create table TableName2(col1 float,col2 double,col3 decimal(5,2));
create table TableName3(col1 date,col2 time,col3 datetime,col4 timestamp,col5 year);
create table TableName4(col1 char(10),col2 varchar(255),col3 tinytext,col4 mediumtext,col5 text,col6 longtext);
--create table TableName5(col1 binary,col2 varbinary,col3 tinyblob,col4 blob,col5 mediumblob,col6 longblob,col7 enum,col8 set);







































h