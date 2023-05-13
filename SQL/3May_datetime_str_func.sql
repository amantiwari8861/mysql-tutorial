
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



