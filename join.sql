
create table categories(
categoryid varchar(20) primary key,
category_name varchar(30),
abcd varchar(20));

create table products(
product_id varchar(20) ,
categoryid varchar(30),
product_name varchar(30),
xyz varchar(20),
primary key(product_id),
constraint fk_catid foreign key (categoryid) references 
categories(categoryid) on update cascade on delete set null
);

insert into categories values(
101,'phones','any description'),
(102,'laptop','any description'),
(305,'fashion','any description');

insert into products values
    (201,101,'realme xt','hello'),
    (202,101,'redmi note 9','	hello'),
    (203,102,'hp'	,'hello'),
    (204,102,'dell vestro','	hello'),
    (205,305,'shirt','	hello');
    
    select * from categories;
    select * from products;
    select * from categories,products;
    
    -- 28/7/2021
    
use mydatabase;
insert into products values (206,null,'shirt1','hello');
insert into products values (207,null,'jeans','hello');

select * from categories
inner join products
on categories.categoryid=products.categoryid;
-- or 
select * from categories as c
inner join products as p
on c.categoryid=p.categoryid;
-- or 
select * from categories c
inner join products p
on c.categoryid=p.categoryid;
-- or 
select * from categories
inner join products
using(categoryid);

-- 29/07/2021
use mydatabase;

insert into categories values(500,"bags","waterproof");

select * from categories p1
left join products c1
on p1.categoryid=c1.categoryid;

-- left:categories
-- right:products

-- or 
select * from categories p1
left join products c1
using(categoryid);

-- 03/8/2021

use mydatabase;

-- right join
select * from categories c
right join products p
on c.categoryid=p.categoryid; 

-- only right
select * from categories c
right join products p
on c.categoryid=p.categoryid
where c.categoryid is null;

-- only left 

select * from categories c
left join products p
on c.categoryid=p.categoryid
where p.categoryid is null;

-- full outer join 

-- unique columns only ( no common data will be duplicated)
select * from categories c
left join products p
on c.categoryid=p.categoryid
union
select * from categories c
right join products p
on c.categoryid=p.categoryid;
