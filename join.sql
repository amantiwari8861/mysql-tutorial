
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
    