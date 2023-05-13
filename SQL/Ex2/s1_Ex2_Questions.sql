
-- Exercise 2

-- Q1) Create a datbase exercise
-- Q2) Create a table departments as per the schema depicted
-- Q3) Create a table employees as per the schema depicted
-- Q4) Add records to the table department based on the table description.
-- Q5) Add records to the table employees based on the table description.
-- Q6) select distinct last name from employee
-- Q7) Select all records from employees table where last Name ends with 'ith'
-- Q8) Select all the data of employees whose last name is "Smith" or "Doe".
-- Q9) Select all the data of employees that work in department 14.
-- Q10) Select all the data of employees that do not work in department 37 or department 77.
-- Q11) Select all the data of employees whose first name begins with an "M".
-- Q12) Display all the names(First Name and Last name with a underscore in between as set the column name as Full Name)
-- and SSN from employees
-- Q13) Select the number of employees in each department 
-- (you only need to show the department code and the number of employees).
-- Q14) Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- Q15) Add an employee called "Mary Moore" in that department, with SSN 847219811.
-- Q16) Reduce the budget of all departments by 10%.
-- Q17) Reassign all employees from the Research department (code 77) to the IT department (code 14).
-- Q18) Delete from the table all employees in the IT department (code 14).
-- Q19) Modify the columns name SSN as SS_No in the employees tabele
-- Q20) Add a city column character length of 50 to the employees table
-- Q21) Reset the city value to 
-- a) Delhi for department 14 
-- b) Mumbai for department 59
-- c) Bangalore for department 37



CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget int NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);


INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);
