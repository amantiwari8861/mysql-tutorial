
use exercise;

select * from transact;
-- TID,TMode,Amount,Tsuccess
select * from pass_details;
-- PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards
select * from flight_details;
-- FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members
select count(*) from transact; -- 36
select count(*) from pass_details; -- 36
select count(*) from flight_details; -- 18
use exercise;

-- transact(TID,TMode,Amount,Tsuccess)
-- pass_details(PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards)
-- flight_details(FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members)

-- Q1) Select Avg Transaction amount based on Transaction Mode in descedning order 
-- of avg transction amount

select t.tmode,avg(t.amount) as AvgTransaction from transact t
group by t.tmode
order by AvgTransaction desc;

-- Q2) Select All Transaction mode and Transaction amount along with Passenger Name, 
-- Booking_date of passengers where booking date in on weekends

select t.tmode,t.amount,p.pname,p.booking_date, 
date_format(p.booking_date,'%a') as WeekdayName
from transact t 
inner join pass_details p
on t.tid = p.tr_id
where date_format(p.booking_date,'%a') in ('Sat','Sun');

-- OR

select t.tmode,t.amount,p.pname,p.booking_date, 
weekday(p.booking_date) as WeekdayName
from transact t 
inner join pass_details p
on t.tid = p.tr_id
where weekday(p.booking_date) in (5,6);

# OR

select t.tmode,t.amount,p.pname,p.booking_date, 
dayofweek(p.booking_date) as WeekdayName
from transact t 
inner join pass_details p
on t.tid = p.tr_id
where dayofweek(p.booking_date) in (1,7);

# OR
select t.tmode,t.amount,p.pname,p.booking_date, 
dayname(p.booking_date) as WeekdayName
from transact t 
inner join pass_details p
on t.tid = p.tr_id
where dayname(p.booking_date) in ('Saturday','Sunday');


-- Q3) Select passenger name who are travelling multiple times. 
-- Display the names and the count

select pname, count(pid) as PassCount
from pass_details 
group by pname
having PassCount>1
order by PassCount desc;

-- Q4) Select all the passengers who have earned more Flight rewards than the 
-- avg flight rewards earned by passengers whose payment mode is 
-- Credit or Debit Card

-- transact(TID,TMode,Amount,Tsuccess)
-- pass_details(PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards)
-- flight_details(FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members)


select avg(f_rewards) from pass_details p
join transact t on t.tid = p.tr_id
where t.tmode in ('CC','DC');  # 17.26

# Method-1, Nested Sub-Query
select * from pass_details where f_rewards >
(select avg(f_rewards) from pass_details where tr_id in 
(select tid from transact where tmode in ('CC','DC')));

# tmode='CC' or tmode='DC'

# Method-2, Joins in sub-query
select * from pass_details where f_rewards >
(select avg(p.f_rewards) from pass_details p
join transact t on p.tr_id = t.tid 
where t.tmode in ('CC','DC')); 


-- transact(TID,TMode,Amount,Tsuccess)
-- pass_details(PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards)
-- flight_details(FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members)

-- Q5) Select all the passengers name, flight_rewards, transaction mode of those passengers
-- whose payment mode is Credit or Debit Card and
-- who have earned more Flight rewards than the avg flight rewards earned 
-- by all the passengers. 

select p.pname,p.f_rewards,t.tmode 
from pass_details p
inner join transact t on p.tr_id=t.tid
where p.f_rewards > 
(select avg(f_rewards) from pass_details) -- 15.111
and t.tmode in ('CC','DC')
order by p.pid;

-- Q6) Display count of failed transactions based on transaction 
-- mode

describe transact;

select tmode, count(tsuccess) Count from transact
where tsuccess=0
group by tmode;

select tmode, count(*) from transact
where tsuccess is null
group by tmode;

select tmode,count(*) from transact
where tsuccess is null
group by tmode;

select tmode,tsuccess,count(*) from transact
where tsuccess is null or tsuccess=0
group by tmode,tsuccess;

-- Q7) Select All Transaction mode and Transaction amount along with Passenger Name, 
-- of passengers those who have made the payment using 'CC' or 'UPI'. 
-- Also display 10% cashback and name it as Cashback that can be redeemed only if
-- payment mode is 'CC' and 0 cashback otherwise

select p.pname,t.tmode,t.amount, 
case 
when t.tmode='CC' then 0.1*t.amount
else 0
end as Cashback
from transact t
inner join pass_details p
on t.tid = p.tr_id
where t.tmode in ('CC','UPI');

-- Q8) Select pilot name who have been allotted multiple flights. 
-- Display the names and the count

select * from flight_details;

select pil_name Pilot_Name ,count(FNo) FlightCounts
from flight_details 
group by pil_name
having FlightCounts>1;


-- Q9) Display the pilots, source_city,dest_city,journey_date who flew from 
-- either Mumbai or Banglore but didn't land in Delhi or Chennai.

select f.pil_name,f.source_city,dest_city,journey_date 
from flight_details f
where f.source_city in ('Mumbai','Bangalore') and
f.dest_city not in ('Delhi','Chennai');

-- Q10) Display the count of most frequent destination based on Destination city and
-- airlines company (Indigo, Air India and Spice Jet) 
-- where the flight arrived more than once

select * from flight_Details;
-- transact(TID,TMode,Amount,Tsuccess)
-- pass_details(PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards)
-- flight_details(FNo,Pil_Name,Journey_Date,Depart_time,arr_time,
-- source_city,dest_city,crew_members)

select dest_city,left(FNo,2) Airlines,count(dest_city) as Count 
from flight_details
group by dest_city, Airlines
having Count>1
order by Count desc;

select dest_city, case
when fno like 'AI%' then 'AirIndia'
when fno like 'SJ%' then 'SpiceJet'
else 'Indigo'
end as Airlines,count(dest_city) as Count 
from flight_details
group by dest_city, Airlines
having Count>1
order by Count desc;


select * from flight_details;

-- OR
select dest_city,mid(FNo,1,2),count(dest_city) as Count 
from flight_details
group by dest_city, mid(FNo,1,2)
having Count>1
order by Count desc;

-- Q11) Select PID,PName,Transaction_Mode, transaction_amount, Booking_Date,
--  Age, Flight_No, Journey date, depart time, arrival time, source city 
-- and dest city where flight departure time is on or after 6pm

-- transact(TID,TMode,Amount,Tsuccess)
-- pass_details(PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards)
-- flight_details(FNo,Pil_Name,Journey_Date,Depart_time,arr_time,
-- source_city,dest_city,crew_members)

select p.pid,p.pname,t.tmode,t.amount,p.booking_date,p.age,p.f_no,
f.journey_date,f.depart_time,f.arr_time,f.source_city,f.dest_city
from transact t
inner join pass_details p
on t.tid = p.tr_id
inner join flight_details f
on p.f_no = f.fno
where hour(f.depart_time)>=18;

-- where f.depart_time>=time('18:00:00');
-- f.depart_time >= '18:00:00'

-- Q12) Select passenger id, passenger names,depart time,arrival time, 
-- transaction mode, time diff in minutes(including hours time) between
-- arr_time and depart_time for passengers where Transcation mode 
-- is 'NB' or 'CC'

select * from flight_details;
select minute('2:45:30');


select p.pid,p.pname,f.depart_time,f.arr_time,t.tmode,
hour(timediff(f.arr_time,f.depart_time))*60 + 
minute(timediff(f.arr_time,f.depart_time)) + 
second(timediff(f.arr_time,f.depart_time))/60
as TimeDiff_InMin
from transact t
inner join pass_details p
on t.tid = p.tr_id
inner join flight_details f
on p.f_no = f.fno
where t.tmode in ('NB','CC');


-- Handling early hours
select p.pid,p.pname,f.depart_time,f.arr_time,t.tmode, 
case
when f.arr_time<f.depart_time then 
     hour(timediff('23:59:59',timediff(f.depart_time,f.arr_time)))*60   
     + minute(timediff('23:59:59',timediff(f.depart_time,f.arr_time)))
else hour(timediff(f.arr_time,f.depart_time))*60 + 
      minute(timediff(f.arr_time,f.depart_time))
end 
as TimeDiff_InMin
from transact t
inner join pass_details p
on t.tid = p.tr_id
inner join flight_details f
on p.f_no = f.fno
where t.tmode in ('NB','CC');

-- depart_time 11.15pm
-- arr_time - 3:00am
-- hr - 3hr:45min
-- min - 180+45 = 225

-- Q13) Select Count of passengers per flight no

select f_no Flight_No,count(pid) Count from pass_details
group by Flight_No;

# 18 rows

-- Q14) Display count of passengers based on airlines(Indigo, SpiceJet, Air India)
-- in descending order of count values

select left(p.f_no,2) Airlines,count(p.pid) as Pass_Count
from pass_details p
group by Airlines 
order by Pass_Count desc;

-- OR

select left(f.fno,2),count(p.pid) as Pass_Count
from pass_details p
inner join flight_details f
on p.f_no = f.fno
group by left(f.fno,2)
order by Pass_Count desc;

-- Q15) Select all pilots details (name,passengerID) who are travelling as passengers. 
-- Also display their flight_number,transaction amount and transaction mode

-- transact(TID,TMode,Amount,Tsuccess)
-- pass_details(PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards)
-- flight_details(FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members)

select * from flight_details;
select * from pass_details;

select p.pid,p.pname,f.fno,t.tmode,t.amount
from pass_details p
inner join flight_details f
on f.pil_name = p.pname
inner join transact t
on t.tid = p.tr_id;

-- OR
select p.pid,p.pname,f.fno,t.tmode,t.amount
from pass_details p, flight_details f,transact t
where p.pname= f.pil_name and t.tid = p.tr_id;

-- Q16) Display the passenger names, their IDs, FNo,age whose age is greater than
-- avg age of all passengers whose airlines is either Air India or Spice Jet
-- (Using sub query)

select * from flight_details; 

-- 36 transact(TID,TMode,Amount,Tsuccess)
-- 36 pass_details(PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards)
-- 18 flight_details(FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members)

select p.pid,p.pname,p.f_no,p.age 
from pass_details p where p.age >
(select avg(age) from pass_details where left(f_no,2) in ('AI','SJ')); -- 43.73

-- OR

select p.pid,p.pname,p.f_no,p.age 
from pass_details p where p.age >
(select avg(age) from pass_details where 
f_no like 'AI%' or f_no like 'SJ%');



-- Q17) Display count and percentage of successful and failed 
-- transactions
select * from transact;
-- 36, four 0s, four null values, 28 1's
--     failed , no data,          Success

select tsuccess,count(tsuccess) from transact
group by tsuccess;

select sum(tsuccess = 1) as Success, sum(tsuccess = 0) as Failed,
(sum(tsuccess=1)/(sum(tsuccess=0) + sum(tsuccess=1) + sum(tsuccess is null)))*100 as Per_Success,
(sum(tsuccess=0)/(sum(tsuccess=0) + sum(tsuccess=1) + sum(tsuccess is null)))*100 as Per_Fail
from transact;

