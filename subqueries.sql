use mydatabase;
select * from products;

select categoryid from categories 
where category_name='phones';  -- 101

select * from products 
where categoryid=101; -- full row
 -- or 
 
 select * from products 
where categoryid =(
select categoryid from categories  -- subqueries
where category_name='phones' );

-- derived tables

select category_name from 
( select * from categories ) as der -- derived table
where categoryid=101;

-- exists

 select * from products 
 where exists(select * 
 from  categories 
 where products.categoryid=categories.categoryid);  
 -- null and 500 is not coming 

select * from products;
select * from categories;

 select * from products 
 where not exists(select * 
 from  categories 
 where products.categoryid=categories.categoryid); 
