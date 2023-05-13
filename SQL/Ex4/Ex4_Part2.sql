
select * from transact;
-- TID,TMode,Amount,Tsuccess
select * from pass_details;
-- PID,pName, Booking_date, Tr_ID,Age,F_No,F_rewards
select * from flight_details;
-- FNo,Pil_Name,Journey_Date,Depart_time,arr_time,source_city,dest_city,crew_members



-- Q24) Find airlines wise(AI,SJ,IN) count of pilots.Arrange the result in 
-- decreasing order of count
-- Q25) Display pilot name with the airlines names (AI,SJ or IN) attached as suffix in a bracket, 
-- journey date, depart_time, dest_city, for the pilots where source city is not Kolkata,
-- Bangalore, Lucknow or Hyderabad
-- Example - Aditya Gaur(IN)
-- Q26) Jiten computed the average transaction amount based on transaction mode
-- but later he realized that he accidently typed 6 in place of 8. He wants our
-- help in finding out the difference between miscalculated average and actual average.
-- Q27) Find count of total number of humans per flight no if crew members exclude pilot.
-- Total humans include - total number of passengers, crew members and pilot
-- 28) Display f_no,pilot_name, journey_date,arrival_time,departure_time
--  where the arr_time and depart time are on different dates
-- OR the flights where the journey is completed on the next day of the journey date
-- Q29) Accidently for few passengers, the booking_date has been noted to 
-- fall before the journey date. Change the booking date of all such passengers to 
-- '2022-03-25'
-- Q30) Passengers who booked flight atleast 3 weeks before their due journey date
-- will get 3 additional fight_reward points. Display all the PID,pName,Booking_Date,
-- actual and updated flight_rewards
-- Q31) Divide the depart_time of flights into 4 quarters 
-- (00:00:00 to 05:59:59) as Q1, (06:00:00 to 11:59:59) as Q2,
-- (12:00:00 to 17:59:59) as Q3, (18:00:00 to 23:59:59) as Q4.
-- Display the F_No,Journey_Date,Source_city, dest city,crew_members,arr_time, 
-- depart_time,Day_Quarter information for all the flights
-- Q32) Create a view named VDQ to store the query returned from Q31
-- Q33) Find Day quarter and airlines wise (AI,IN,SJ) wise avg amount collected
-- Q34) Find journey_date wise sum of amount. 
-- a) Store this result as a view named VW1. 
-- b) From VW1, filter all the records where sum of amount is higher than 
-- its previous date sum of amount.
-- Q35) Find Source city and flight number wise count of passengers where 
-- the flight time from the source city is less than of equal to 2 hrs
