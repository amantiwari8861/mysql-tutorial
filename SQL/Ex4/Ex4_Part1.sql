
use exercise;
show tables;

drop table Transact;
drop table pass_details;
drop table flight_details;

create table Transact
(TID int primary key,
TMode varchar(10) not null,
Amount int not null,
TSuccess bool
);

select * from Transact;

insert into Transact values
(78965,'NB',5670,1),
(78966,'UPI',8440,1),
(78967,'CC',9730,1),
(78968,'UPI',3460,0),
(78969,'NB',5450,1),
(78970,'NB',3640,1),
(78971,'DC',5670,0),
(78972,'DC',6344,1),
(78973,'DC',4535,0),
(78974,'DC',7300,1),
(78975,'UPI',4535,1),
(78976,'CC',12300,1),
(78977,'UPI',7300,null),
(78978,'UPI',4535,null),
(78979,'NB',12300,1),
(78980,'DC',6700,NULL),
(78981,'DC',5200,1),
(78982,'DC',5300,1),
(78983,'UPI',9100,NULL),
(78984,'CC',7900,1),
(78985,'CC',5200,1),
(78986,'UPI',7000,1),
(78987,'UPI',5280,1),
(78988,'DC',5750,1),
(78989,'CC',10500,1),
(78990,'CC',9600,1),
(78991,'DC',6600,1),
(78992,'UPI',7200,1),
(78993,'DC',8200,1),
(78994,'CC',8000,1),
(78995,'DC',10000,1),
(78996,'CC',7500,1),
(78997,'NB',9500,1),
(78998,'UPI',4500,1),
(78999,'NB',10500,0),
(79000,'UPI',9500,1);


create table Flight_details(
FNo varchar(10) primary key,
Pil_Name varchar(30) not null,
Journey_Date date not null,
Depart_time time not null,
Arr_Time time not null,
Source_City varchar(30) not null,
Dest_City varchar(30) not null,
Crew_members int
);

insert into Flight_Details values
('AI-745','Siddharth Wadhwa','2022-04-15','09:45:00','11:30:00','Delhi','Kolkata',5),
('AI-746','Aniruddh Sinha','2022-04-16','10:15:00','11:45:00','Delhi','Mumbai',8),
('AI-747','Siddhanth Arora','2022-04-17','13:30:00','15:30:00','Delhi','Bangalore',7),
('AI-748','Vishal Kambley','2022-04-16','15:45:00','17:30:00','Delhi','Hyderabad',6),
('AI-749','Anusha Raina','2022-04-19','08:30:00','10:30:00','Mumbai','Chennai',null),
('AI-750','Anusha Raina','2022-04-22','18:00:00','20:45:00','Bangalore','Delhi',7),
('IN-545','Ritesh Singhania','2022-04-10','10:45:00','12:30:00','Kolkata','Delhi',6),
('IN-547','Aditya Gaur','2022-04-17','20:15:00','22:30:00','Mumbai','Ahemdabad',null),
('IN-548','Ankush Agarwal','2022-04-20','11:30:00','14:45:00','Mumbai','Delhi',8),
('IN-546','Aditya Gaur','2022-04-15','15:30:00','18:45:00','Bangalore','Delhi',5),
('IN-549','Pawan Gupta','2022-04-21','17:15:00','18:45:00','Chennai','Bangalore',4),
('SJ-324','Jacob Shaw','2022-04-20','10:30:00','13:45:00','Lucknow','Bangalore',null),
('SJ-325','Vincent Spencer','2022-04-20','09:45:00','11:30:00','Hyderabad','Mumbai',8),
('SJ-326','Clement Alba','2022-04-22','19:30:00','21:30:00','Kolkata','Delhi',6),
('SJ-327','Vincent Spencer','2022-04-21','09:45:00','11:30:00','Mumbai','Kolkata',7),
('SJ-328','Robert Diaz','2022-04-17','14:45:00','17:15:00','Kolkata','Bangalore',5),
('SJ-329','Harvey Becker','2022-04-16','23:15:00','03:00:00','Chennai','Kolkata',null),
('SJ-330','Vincent Spencer','2022-04-15','23:30:00','01:45:00','Bangalore','Hyderabad',6);


create table Pass_Details(
PID int primary key,
PName varchar(30) not null,
Booking_Date date not null,
Tr_ID int not null,
Age int,
F_no varchar(10) not null,
F_Rewards int not null
);

select * from Pass_Details;

insert into Pass_Details(PID,PName,Booking_Date,Tr_ID,Age,F_no,F_Rewards)
values (123,'Pankaj Verma','2022-03-01',78965,20,'AI-745',0),
(124,'Vipin Verma','2022-03-02',78966,29,'AI-745',2),
(125,'Shivang Malhotra','2022-03-03',78967,null,'AI-747',3),
(126,'Harshit Soni','2022-03-04',78968,23,'AI-747',5),
(127,'Pankaj Verma','2022-03-25',78969,20,'AI-748',6),
(128,'Vipin Verma','2022-03-14',78970,29,'AI-748',10),
(129,'Pankaj Verma','2022-03-20',78971,20,'IN-546',10),
(130,'Aman Kumar','2022-03-25',78972,null,'IN-546',5),
(131,'Utkarsh Arora','2022-03-29',78973,30,'IN-547',2),
(132,'Anjali Srivastava','2022-03-20',78974,27,'IN-547',10),
(133,'Betty Sharin','2022-03-08',78975,25,'IN-548',20),
(134,'Betty Anshu','2022-03-09',78976,null,'IN-548',15),
(135,'Anshul Singh','2022-03-07',78977,50,'SJ-324',0),
(136,'Vaishu Bhutani','2022-03-01',78978,40,'SJ-324',5),
(137,'Betty Sharin','2022-03-04',78979,25,'SJ-325',30),
(138,'Sakshi Ghosh','2022-03-18',78980,70,'SJ-325',40),
(139,'Harshit Soni','2022-03-11',78981,null,'SJ-326',10),
(140,'Anil Pandey','2022-03-12',78982,56,'SJ-326',10),
(141,'Amitabh Verma','2022-03-17',78983,70,'SJ-330',0),
(142,'James Spencer','2022-03-19',78984,69,'SJ-327',5),
(143,'Satish Kaushik','2022-03-06',78985,77,'SJ-327',0),
(144,'Aaakriti Shukla','2022-03-12',78986,66,'SJ-327',5),
(145,'Vicky Trivedi','2022-03-13',78987,71,'SJ-328',15),
(146,'Garima Singh','2022-03-22',78988,null,'SJ-328',20),
(147,'Anusha Raina','2022-03-23',78989,24,'IN-549',20),
(148,'Aditya Gaur','2022-03-24',78990,25,'AI-746',30),
(149,'Harvey Becker','2022-03-13',78991,51,'IN-545',10),
(150,'Jack Sterling','2022-03-12',78992,35,'IN-545',16),
(151,'Andrew Silva','2022-03-23',78993,null,'AI-749',18),
(152,'Ederson Walker','2022-03-26',78994,28,'SJ-329',50),
(153,'Anushka Agdekar','2022-04-27',78995,25,'IN-549',50),
(154,'Aditya Srivastava','2022-04-28',78996,26,'IN-549',20),
(156,'Jack Sterling','2022-04-26',78997,35,'IN-549',50),
(157,'Bryan Wales','2022-03-30',78998,25,'AI-750',23),
(158,'Manan Gupta','2022-04-24',78999,null,'AI-750',27),
(159,'Ashley Steffen','2022-03-15',79000,38,'AI-746',2);

select * from transact;
-- TID,TMode,Amount,Tsuccess
select * from pass_details;
-- PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards
select * from flight_details;
-- FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members

-- Q1) Select Avg Transaction amount based on Transaction Mode in descedning order
--  of avg transction amount.
-- Q2) Select All Transaction mode and Transaction amount along with Passenger Name, 
-- Booking_date of passengers where booking date in on weekends.
-- Q3) Select passenger name who are travelling multiple times. Display the names and the count
-- Q4) Select all the passengers who have earned more Flight rewards than the 
-- avg flight rewards earned by passenders whose payment mode is Credit or Debit Card
-- Q5) Select all the passengers name, flight_rewards, transaction mode of those passengers
-- whose payment mode is Credit or Debit Card and
-- who have earned more Flight rewards than the avg flight rewards earned 
-- by all the passenders. 
-- Q6) Display count of failed transactions based on transaction mode
-- Q7) Select All Transaction mode and Transaction amount along with Passenger Name, 
-- of passengers those who have made the payment using 'CC' or 'UPI'. 
-- Also display 10% cashback and name the column as Cashback that can be redeemed only if
-- payment mode is 'CC' and 0 cashback otherwise
-- Q8) Select pilots name who have been allotted multiple flights. 
-- Display the names and the count.

-- Q9) Display the pilots, source_cty,dest_city,journey_date who flew from 
-- either Mumbai or Banglore but didnt land in Delhi or Chennai

-- Q10) Display the count of most frequent destination based on Destination city and
-- airlines company (Indigo, Air India and Spice Jet) 
-- where the flight arrived more than once

-- Q11) Select PID,PName,Transaction_Mode, transaction_amount, Booking_Date, Age, 
-- Flight_No, Journey date, depart time, arrival time, source city and dest city
-- where flight departure time is on or after 6pm

-- Q12) Select passenger id, passenger names,depart time,arrival time, transaction mode, 
-- time diff in minutes(including hours time) between arr_time 
-- and dest_time for passengers where Transcation mode is 'NB' or 'CC'

-- Q13) Select Count of passengers per flight no

-- Q14) Display count of passengers based on airlines(Indigo, SpiceJet, Air India)
-- in descending order of count values

-- Q15) Select all pilots details (name,passengerID) who are travelling as passengers. 
-- Also display their transaction amount and transaction mode

-- Q16) Display the passenger names, their IDs, FNo,age whose age is greater than
-- avg age of all passengers whose airlines is either Air India or Spice Jet
-- using sub query

-- Q17) Display count and percentage of successful and failed transactions

-- Q18) Select all passengers names, PID, flight who have failed transcations

-- Q19) Create a view containing the below mentioned query
-- a) Select airlines based sum of transaction amount and display them in 
-- descending order. The view name has to be Airline_SumAmt
-- b) Write a select query on view to apply dense rank partion over airlines

-- Q20) Allot 15% cashback to the passengers who are senior citizens(people aged 55 and above) 
-- on their transaction amount. Display PID, passenger names,Flight number,age,
-- and transaction amount renamed as DiscountedAmt

-- Q21) Select transaction mode wise maximum age from tables 
-- oredered in ascending order of maximum age. Use sub query

-- Q22) Find PID,passenger Names, Booking_date, Tr_ID, Age in each 
-- airlines(Indigo,SpiceJet,Air India)
-- whose age is more than avg age of passengers travellling in that airlines.

-- Q23) Display all transation details for the passengers where the 
-- flight duration is not more than 2.30hrs
