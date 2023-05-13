
# data types

use apr18;


create table tab2(
c1 tinyint,   # -128 to 127   (1 byte)
c2 smallint,  # -32768 to 32767 (2 byte)
c3 mediumint, # -8388608 to 8388607 (3 bytes)
c4 int,       # -2147483648 to 2147483647  (4 bytes)
c5 bigint     # -9223372036854775808 to 9223372036854775807 (8 bytes)
);

select * from tab2;

#                        c1  c2  c3  c4  c5 
insert into tab2 values (10, 20, 30, 40,50);
insert into tab2 values (127, -32710, 8388907, 125,126);
insert into tab2 values (101, -102, 103, 1152653281,126);
insert into tab2 values (100, -202, 203, 204,9156253814);

create table tab3(
c1 tinyint unsigned,   # 0 to 255   (1 byte)
c2 smallint unsigned,  # 
c3 mediumint unsigned, # 
c4 int unsigned,       # 
c5 bigint unsigned     # 
);

# unsigned implies that particular column cant accept 
# negative values. 

insert into tab3 values (-56,57,58,59,60);  # error
insert into tab3 values (230,41,42,43,44);  # error
select * from tab3;

create table tab1
(sid int primary key,
gender enum('male','female'),   # 1 - male,  2 - female
hobby set('cricket','football','reading','swimming')
);

# insert query
insert into tab1 values
(41,'male','cricket,reading'),
(42,'female','reading,football,swimming');

select * from tab1;

insert into tab1 values
(43,2,'reading'),
(44,1,'football,cricket');

create table tab4
(c1 float,
c2 double,
c3 decimal(8,4)   # 8 total num of digits, 4 is max digits after decimal
);


insert into tab4 values(3345.453,17.234,2423.109);
insert into tab4 values(6.145,1.24,56.20);
select * from tab4;
 
use apr18; 
drop table tab5;
create table tab5
(c1 date,    # YYYY-MM-DD 
c2 datetime, # YYYY-MM-DD HH:MM:SS
c3 timestamp,# YYYY-MM-DD HH:MM:SS
c4 time,     # HH:MM:SS
c5 year      # YYYY
);

describe tab5;

insert into tab5 values 
('2023-04-29',now(),now(),
'05:14:28',2019);

select * from tab5;

select now();

select * from tab5;

insert into tab5 values 
('2023-07-15','2022-07-20 21:35:42','2022-07-20 21:35:42',
'05:14:28',2022);

select * from tab5;


# drop table tab6;

#  text family

create table tab7(
c1 tinytext,   # 255 bytes
c2 text,       # 65535 bytes (2^16-1)
c3 mediumtext, # 16777215 bytes (2^24-1) bytes
c4 longtext);  # (2^32-1) bytes





