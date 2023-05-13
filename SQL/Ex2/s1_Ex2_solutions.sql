
use exercise;
show tables;

drop table departments;
drop table employees;
 
CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget int NOT NULL 
);

describe departments;

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  department INTEGER NOT NULL, 
  foreign key (department) references Departments(Code) 
);

describe employees;
select * from employees;
select * from departments;

drop table departments;
drop table employees;

INSERT INTO Departments(Code,Name,Budget) VALUES
(14,'IT',65000),
(37,'Accounting',15000),
(59,'Human Resources',240000),
(77,'Research',55000);


INSERT INTO employees(SSN,Name,lastName,Department) VALUES
('123234877','Michael','Rogers',14),
('152934485','Anand','Manikutty',14),
('222364883','Carol','Smith',37),
('326587417','Joe','Stevens',37),
('332154719','Mary-Anne','Foster',14),
('332569843','George','ODonnell',77),
('546523478','John','Doe',59),
('631231482','David','Smith',77),
('654873219','Zacary','Efron',59),
('745685214','Eric','Goldsmith',59),
('845657245','Elizabeth','Doe',14),
('845657246','Kumar','Swamy',14);


select * from departments;
-- Code, Name, Budget (65K,15K,240K,55K)
select * from employees;
-- SSN, Name, LastName, Department (Code) (14,37,77,59)

-- Q6) select distinct last name from employee
select distinct lastname from employees;

-- Q7) Select all records from employees table where last Name ends with 'ith'
select * from employees where lastname like '%ith';

-- Q8) Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employees where lastname in ('Smith', 'Doe');
select * from Employees where lastname = 'Smith' or lastname = 'Doe';

-- Q9) Select all the data of employees that work in department 14.
select * from Employees where department = 14;

-- Q10) Select all the data of employees that do not work in department 37 or department 77.
select * from employees where department not in (37, 77);

-- Q11) Select all the data of employees whose first name begins with an "M".
select * from employees where Name like 'M%';


-- Q12) Display all the names
# (First Name and Last name with a underscore in between and set the column name as Full Name)
-- and SSN from employees
select * from employees;
select SS_No, concat(Name,'_',LastName) as FullName from employees;

select concat(Name,'_',LastName) as FullName from employees;

-- Q13) Select the number of employees in each department 
-- (you only need to show the department code and the number of employees).
select * from employees;
select Department, count(name) as No_of_Emp from employees 
group by department;

show tables;

-- Q14) Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
insert into departments values(11, 'Quality Assurance', 40000);
select * from departments;
-- budget (40K,65K,15K,240K,55K)

-- Q15) Add an employee called "Mary Moore" in that department, with SSN 847219811.
# Use department code as 11;
insert into employees values(847219811, 'Mary', 'Moore', 11);
select * from employees;

-- Q16) Reduce the budget of all departments by 10%.
select 0.9*budget from departments;

select * from departments;
update departments set budget = 0.9 * budget;

-- Q17) Reassign all employees from the Research department (code 77) to the IT department (code 14).
select * from employees;
update employees set department = 14 where department = 77;

-- Q18) Delete from the table all employees in the IT department (code 14).
delete from employees where department=14;
select * from employees;

-- Q19) Modify the columns name SSN as SS_No in the employees table
alter table employees change SSN SS_No int;
select * from employees;

-- Q20) Add a city column character length of 50 to the employees table
alter table employees add city varchar(50);
select * from employees;

-- Q21) Reset the city value to 
-- a) Delhi for department 14 
-- b) Mumbai for department 59
-- c) Bangalore for department 37

select * from employees;
# update employees set city = 'Delhi' where department=14;
update employees set city = 'Mumbai' where department=59;
update employees set city = 'Bangalore' where department=37; 




