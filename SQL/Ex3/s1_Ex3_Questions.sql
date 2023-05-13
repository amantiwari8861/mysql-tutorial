use exercise;

create table patient(
PID int primary key,
PName varchar(30) not null,
Age int,
Weight int,
gender varchar(5),
D_ID varchar(5)
);

insert into patient values
(31,'Ankit',23,67,'M','DA_05'),
(32,'Vipul',54,54,'M','DB_08'),
(33,'Shreya',49,82,'F','DC_13'),
(34,'Vibhor',38,63,'M','DB_08'),
(35,'Stuti',16,48,'F','DW_10'),
(36,'Priyanka',21,72,'M','DC_13'),
(37,'Vaishnavi',79,85,'F','DB_08'),
(38,'Uday',34,81,'F','DB_08'),
(39,'Kartik',28,64,'F','DW_10'),
(40,'Ujjwal',33,59,'M','DQ_19'),
(41,'Akhila',51,88,'M','DM_24'),
(42,'Naveen',67,79,'F','DM_24'),
(43,'Vinod',30,93,'M','DB_08'),
(44,'Rajat',40,54,'F','DC_13'),
(45,'Palak',42,59,'M','DW_10');

select distinct D_ID from patient;

create table hosp_dept(
D_ID varchar(5) primary key,
med_treatment varchar(20) not null,
dept_no_emp int
);

insert into hosp_dept values 
('DA_05','Homeopathy',12),
('DB_08','Allopathy',34),
('DC_13','Ayurveda',19),
('DW_10','Allopathy',10),
('DQ_19','Homeopathy',15),
('DM_24','Allopathy',21);

create table bill_details(
B_ID int primary key,
P_ID int not null,
bill_amt int,
bill_date date,
next_app_date date
);


insert into bill_details values
(1303,31,7540,'2022-02-10','2022-03-24'),
(1304,32,12500,'2022-01-05','2022-02-05'),
(1305,33,5240,'2022-03-15','2022-04-05'),
(1306,34,3300,'2021-12-24','2022-01-07'),
(1307,35,25000,'2021-10-16','2021-10-28'),
(1308,36,3300,'2022-02-06','2022-02-18'),
(1309,37,4700,'2021-12-10','2021-12-24'),
(1310,38,8500,'2022-04-19','2022-05-07'),
(1311,39,17500,'2021-11-14','2021-12-29'),
(1312,40,9500,'2022-05-01','2022-05-20'),
(1313,41,18500,'2022-02-15','2022-02-25'),
(1314,42,52000,'2021-11-08','2021-11-21'),
(1315,43,11500,'2022-01-07','2022-01-15'),
(1316,44,1800,'2021-11-20','2021-11-30'),
(1317,45,6100,'2021-10-25','2021-11-15');


-- Q1) Find gender wise avg weight of patients.
-- Q2) Find Patients Name,Weight who might need immediate medical attention.
-- Based on a survey patients aged more than 60 bearing body weight more than 70 need
-- medical attention
-- Q3) Which line of medical treatment has maximum number of employees
-- Q4) Find gender wise avg bill amount
-- Q5) Find medical treatment wise count of patients
-- Q6) Dispay Patient Name, month and the year in which they were billed
-- Q7) Find month wise avg bill amount indecreasing order of avg bill amount
-- Q8) Find Count of Patients Billed in the month of Jan and Mar
-- Q9) If we consider avg height of females to be 1.6m and for Males to be 1.702m
-- Then find BMI of each patient. BMI = Weight(kg)/height^2(m)
-- Q10) Find patients Name,age and their discounted billing amount who can claim a 
-- discount of 15% on bill amount. Eligibility criteria for discount - Patients 
-- age should be more than 50 and bill amount should be greater than or equal to 10000
-- Q11) Find Patient Name, Gender,Age and Treatment period in days whose 
-- Treatment/medication period is over 3 weeks
-- Q12) Find monthname wise max bill_amount for the pateints whose line of treatment is Allopathy

