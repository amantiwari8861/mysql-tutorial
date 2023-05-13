

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
 
select * from emp_tab1; 
select * from bonus_tab1;
select * from title_tab1; 
 
-- emp_tab1(emp_id,fname,lname,slary,joining_date,dept,manager_id)
-- bonus_tab1(emp_ref_id,bonus_amt,bound_date)
-- title_tab1(emp_ref_id,emp_title,affected_from)

# Q1) Write a SQL query to fetch department wise count employees
# sorted by department count in desc order.
# Q2) Write a SQL query to find the count of employees working 
# in department 'Admin'
# Q3) Fetch emp_id and Full_name and salary of the emp where 
# first and last name are separated by _(underscore) for 
# the employees earning less than 100000.
# Q4) Write a SQL query to fetch emp_id, fname,salary of employee 
# whose salary lies between 100000 and 500000;
# Q5) Write a SQL query to find all the employees(emp_id, fname) from employee 
# table who are also managers.
# Q6) Write a SQL query to get the list of employees(fname, lname) 
# with the same salary.
# Q7) Write a SQL query to fetch departments along with the 
# total salaries paid for each of them.
# Q8) Find emp_id,fname, salary, joing_date, and job_title of employees
# Q9) Write a SQL query to get records(emp_id,fname,lname,joining_date) 
# of employe who have joined in Jan 2017
# Q10) Find the emp_first_name, emp_id and thier manager first_name 
# and manager id. Use appropriate alias names.
# Q11) Find emp first name and sum of bonus amount for the employee
# who received max bonus.