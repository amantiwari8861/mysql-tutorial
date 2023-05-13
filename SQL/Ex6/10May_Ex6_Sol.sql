
create database exercise2;
use exercise2;

select * from stu_per;


drop table emp_tab1;
create table emp_tab1 (
	emp_id int primary key,
	Fname varchar(25),
	lname varchar(25),
	salary int,
	joining_date datetime,
	dept varchar(25), 
    manager_id int
);

INSERT INTO emp_tab1 VALUES
(001, 'James', 'Smith', 100000, '17-02-20 09:00:00', 'HR', 002),
(002, 'Jessica', 'Kohl', 80000, '17-06-11 09:00:00', 'Admin', 005),
(003, 'Alex', null, 300000, '17-02-20 09:00:00', 'HR', 011),
(004, 'Pratik', 'Pandey', 500000, '17-02-20 09:00:00', 'Admin', 020),
(005, 'Christine', 'Robinson', 500000, '17-06-11 09:00:00', 'Admin', 007),
(006, 'Deepak', null, 200000, '17-06-11 09:00:00', 'Account', 015),
(007, 'Jennifer', 'Paul', null, '17-01-20 09:00:00', 'Account', 012),
(008, 'Deepika', 'Sharma', 90000, '17-04-11 09:00:00', 'Admin', 017),
(009, 'Joseph', 'Alvares', 85000, '14-08-11 09:00:00', 'Account', 015);

drop table bonus_tab1;
create table bonus_tab1 (
	emp_ref_id INT,
	bonus_amt INT,
	bonud_date DATE,
	foreign key (emp_ref_id) references emp_tab1(emp_id)
);

INSERT INTO bonus_tab1 VALUES
(001, 5000, '18-02-20'),
(002, 3000, '18-06-11'),
(003, 4000, '18-02-20'),
(001, 4500, '18-02-20'),
(002, 3500, '18-06-11');

        
drop table title_tab1;        
CREATE TABLE title_tab1 (
	emp_ref_id int,
	emp_title varchar(25),
	affected_from date,
	foreign key (emp_ref_id) references emp_tab1(emp_id)
);

INSERT INTO Title_tab1 VALUES
 (001, 'Manager', '2018-02-20'),
 (002, 'Executive', '2018-06-11'),
 (008, 'Executive', '2018-06-11'),
 (005, 'Manager', '2018-06-11'),
 (004, 'Asst. Manager', '2018-06-11'),
 (007, 'Executive', '2018-06-11'),
 (006, 'Lead', '2018-06-11'),
 (003, 'Lead', '2018-06-11');
 
select * from emp_tab1; # 9 records
select * from bonus_tab1;
select * from title_tab1; 
 
-- emp_tab1(emp_id,fname,lname,salary,joining_date,dept,manager_id)
-- bonus_tab1(emp_ref_id,bonus_amt,bound_date)
-- title_tab1(emp_ref_id,emp_title,affected_from)

# Q1) Write a SQL query to fetch department wise count employees
# sorted by department count in desc order.

select dept, count(*) as EmpCount 
from emp_tab1
group by dept
order by EmpCount desc;

# Q2) Write a SQL query to find the count of employees working 
# in department 'Admin'
select count(fname) EmpCount 
from emp_tab1 where dept = 'Admin';

select EmpCount from
(select dept,count(fname) EmpCount 
from emp_tab1 
group by dept
having dept = 'Admin') dt;

# Q3) Fetch emp_id, Full_name and salary of the emp where 
# first and last name are separated by _(underscore) for 
# the employees earning less than 100000.
select emp_id, concat(fname,'_',lname) as FullName,salary
from emp_tab1
where salary<100000;

# Q4) Write a SQL query to fetch emp_id, fname,salary of employee 
# whose salary lies between 100000 and 500000;
select fname, lname, salary from emp_tab1
where salary between 100000 and 500000;

# Q5) Write a SQL query to find all the employees(emp_id, fname) 
# from employee table who are also managers.
select * from emp_tab1;
select * from title_tab1;

select e1.emp_id as Emp_ID, e1.fname 
from emp_tab1 e1 
join emp_tab1 e2
on e1.emp_id = e2.manager_id;

# Using sub-query
select emp_id, fname from emp_tab1 where emp_id in
(select manager_id from emp_tab1);

# Alternative Solution
select e1.emp_id, e1.fname, t1.emp_title 
from emp_tab1 e1
join title_tab1 t1 
on e1.emp_id = t1.emp_ref_id
where t1.emp_title ='Manager';


# Q6) Write a SQL query to get the list of employees(fname, lname) 
# with the same salary
select * from emp_tab1;

select e1.fname, e1.lname,e1.salary 
from emp_tab1 e1, emp_tab1 e2 
where e1.salary = e2.salary;

select e1.fname, e1.lname,e1.salary 
from emp_tab1 e1, emp_tab1 e2 
where e1.salary = e2.salary and e1.emp_id != e2.emp_id; 

# using sub-query
select e1.fname, e1.lname, e1.salary from emp_tab1 e1 
where e1.salary in 
(Select e2.salary from emp_tab1 e2 where e1.emp_id<>e2.emp_id);

# Using Join
select e1.fname, e1.lname,e1.salary 
from emp_tab1 e1 join emp_tab1 e2
on e1.salary = e2.salary 
where e1.emp_id != e2.emp_id; 

# Using Sub Query in Join clause
select e1.fname, e1.lname,e1.salary
from emp_tab1 e1
join (select salary e2_Sal,emp_id E2_Emp_id from emp_tab1) dt
on e1.salary = dt.e2_Sal
where e1.emp_id != dt.E2_Emp_id; 

-- emp_tab1(emp_id,fname,lname,slary,joining_date,dept,manager_id)
-- bonus_tab1(emp_ref_id,bonus_amt,bound_date)
-- title_tab1(emp_ref_id,emp_title,affected_from)


# Q7) Write a SQL query to fetch departments along with the 
# total salaries paid for each of them.
select dept, sum(salary) Total_Salary from emp_tab1 
group by dept order by Total_Salary desc;


# Q8) Find emp_id,fname, salary, joining_date, and job_title of employees
select * from emp_tab1;
select * from title_tab1;


select e1.emp_id,e1.fname, e1.salary,e1.joining_date,t1.emp_title 
from emp_tab1 e1
join title_tab1 t1
on t1.emp_ref_id  = e1.emp_id;

# Q9) Write a SQL query to get records(emp_id,fname,lname,joining_date) 
# of employe who have joined in Jan 2017

select emp_id,fname,lname,joining_date from emp_tab1 where 
year(joining_date)=2017 and month(joining_date) = 1;
# joining_date between '2017-01-01' and '2017-01-31'


# Q10) Find the emp_first_name, emp_id and thier manager first_name 
# and manager id. Use appropriate alias names 

select * from emp_tab1;

# using self join without join keyword
select e1.emp_id as Emp_ID,e1.fname as Emp_Name,
m1.emp_id as ManagerID,m1.fname as Manager_Name
from emp_tab1 e1, emp_tab1 m1
where e1.manager_id = m1.emp_id;

# using self join with join keyword
select e1.emp_id as Emp_ID,e1.fname as Emp_Name,
m1.emp_id as ManagerID,m1.fname as Manager_Name
from emp_tab1 e1 join emp_tab1 m1
on e1.manager_id = m1.emp_id;


# Q11) Find emp first name and sum of bonus amount for the employee
# who received max bonus

# Using limit
select e1.fname, sum(b1.bonus_amt) SumBonus from bonus_tab1 b1
inner join emp_tab1 e1
on e1.emp_id =  b1.emp_ref_id
group by e1.fname order by SumBonus desc
limit 1;

# Using Sub-Query (Applying Aggregate on aggregated column)
select EmpName, max(SumBonus) As MaxBonus from 
(select e1.fname EmpName, sum(b1.bonus_amt) SumBonus from bonus_tab1 b1
inner join emp_tab1 e1
on e1.emp_id =  b1.emp_ref_id
group by e1.fname) dt
group by EmpName limit 1;



