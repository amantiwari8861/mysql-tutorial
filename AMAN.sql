SELECT   department_id dept_id, job_id, SUM(salary)
FROM     hr.employees
GROUP BY department_id, job_id ;

create table student(

SELECT   department_id, MAX(salary)
FROM     hr.employees
HAVING   MAX(salary)>10000 ;

SELECT last_name, salary
FROM   hr.employees
WHERE  salary BETWEEN 2500 AND 3500 ;

SELECT employee_id, last_name, salary, manager_id
FROM   hr.employees
WHERE  manager_id IN (100, 101, 201) ;

select * from hr.employees;

SELECT	last_name
FROM 	hr.employees
WHERE	last_name <>'King' ;

SELECT last_name, manager_id
FROM   hr.employees
WHERE  manager_id IS NULL ;

SELECT last_name, job_id
FROM   hr.employees
WHERE  job_id 
       NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;

SELECT last_name, job_id, salary
FROM   hr.employees
WHERE  job_id = 'SA_REP'
OR     job_id = 'AD_PRES'
AND    salary > 15000;

SELECT last_name, job_id, salary
FROM   hr.employees
WHERE  (job_id = 'SA_REP'
OR     job_id = 'AD_PRES')
AND    salary > 15000;


select * from hr.employees;





SELECT   last_name, job_id, department_id, hire_date
FROM     hr.employees
ORDER BY hire_date desc;


SELECT employee_id, last_name, salary*12 annsal
FROM   hr.employees
ORDER BY annsal ;

SELECT last_name, department_id, salary
FROM   hr.employees
ORDER BY department_id, salary DESC;



SELECT employee_id, last_name, salary, department_id
FROM   hr.employees
WHERE  employee_id = &aman ;

SELECT last_name, department_id, salary*12
FROM   hr.employees
WHERE  job_id = '&job_title' ;

DEFINE CONDITION=SALARY>1500
SELECT employee_id, last_name, job_id,&column_name
FROM   HR.employees
WHERE  &condition
ORDER BY &order_column ;


SELECT   employee_id, last_name, job_id, &&COLUMN_NAME
FROM     HR.employees
ORDER BY &column_name ;

DEFINE employee_num = 101
SET VERIFY ON
SELECT employee_id, last_name, salary, department_id
FROM   HR.employees
WHERE  employee_id = &employee_num ;

UNDEFINE employee_num


select * from hr.employees;
describe hr.employees;

SET VERIFY ON
SELECT employee_id, last_name, salary
FROM   HR.employees
WHERE  employee_id = &employee_num;

number(9,2)

SELECT employee_id, last_name, department_id
FROM   hr.employees
WHERE  UPPER(last_name) = 'HIGGINS';

CREATE TABLE DEMO(NAME VARCHAR2(20),ROLL NUMBER);
INSERT INTO DEMO VALUES ('AMAN',21);

SELECT *  FROM DEMO WHERE LOWER(NAME)='AMAN';


SELECT employee_id, CONCAT(first_name, last_name) NAME, 
       job_id, LENGTH (last_name), 
       INSTR(last_name, 'a') "Contains 'a'?"
FROM   hr.employees
WHERE  SUBSTR(job_id, 4) = 'REP';



DROP TABLE DEMO;






