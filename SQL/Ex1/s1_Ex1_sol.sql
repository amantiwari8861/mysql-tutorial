create database exercise;

use exercise;

CREATE TABLE Manufacturers (
  Code int primary key,
  Name VARCHAR(30)
);

CREATE TABLE Products (
  P_Code int primary key,
  Name VARCHAR(30) NOT NULL ,
  Price int NOT NULL ,
  Manufacturer INTEGER NOT NULL
);

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester'); 

INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(P_Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

select * from manufacturers;
-- Code, Name
select * from products; 
-- P_Code, Name, Price, Manufacturer

-- Q6)  Display the names of all the products in the store.
select Name from products;

-- Q7) Display the names and the prices of all the products in the store.
select name, price from products;

-- Q8) Display the name of the products with a price less than or equal to $200.
select name from products where price <= 200;

-- Q9) Display all the products with a price between $60 and $120.
select * from products where price between 60 and 120;
-- OR
select * from products where price >= 60 and price <= 120;

-- Q10) Display avg price of all the products
select avg(price) from products;

select * from  products;

-- Q11) Compute the average price of all products with 
# manufacturer code equal to 2.
select avg(price) from products where Manufacturer = 2;

-- Q12) Compute the number of products with a price larger 
# than or equal to $180 and set the column name as Prod_Count
select * from products;

select count(*) as Prod_Count from products where price>=180;
-- OR
select count(Name) as Prod_Count from products where price>=180;

-- Q13) Select the name and price of all products with a 
# price larger than or equal to $180, and sort by price 
# (in descending order).

select name, price from products where price>=180 
order by price desc;

-- Q14) Display the average price of each manufacturer's products, 
-- showing only the manufacturer's code.
select * from products;

select  Manufacturer, AVG(Price) from Products 
group by Manufacturer;

-- Q15) Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products values (11, 'Loudspeakers', 70, 2);

select * from Products;

-- Q16) Update the name of product 8 to "Laser Printer".
select * from products;
update products set name = 'Laser Printer' where p_code=8;

-- Q17) Update the products table and set discount to 10% 
# on all products

update products set price = price*0.9;

select * from products;

-- Q18) Delete the record where Product code is 11
delete from products where P_Code=11;

