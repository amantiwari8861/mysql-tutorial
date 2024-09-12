create database net;
use net;

create table banker
(banker_id int ,
banker_name varchar (255),
branch_id int primary key);
desc banker;

create table branch
(branch_id int ,
foreign key(branch_id) references banker(branch_id),
branch_name varchar(255),
branch_adddress varchar(255));
desc branch;

create table account
(account_id int primary key ,
account_balance int,
account_type varchar(255),
branch_id int,
foreign key(branch_id) references banker(branch_id));
desc account;

create table credit_card
(Credit_card_id int,
expiry_date date,
card_limit int,
account_id int ,
customer_id int primary key,
foreign key(account_id) references account (account_id));
desc credit_card;

create table customers
(-- cutomer_id int,
-- foreign key(customer_id) references credit_card(customer_id),
customer_name varchar(255),
dob date,
mobil bigint,
account_id int,
foreign key(account_id) references account(account_id));
desc customers;

create table transaction
(transaction_id int,
account_id int ,
foreign key(account_id) references account(account_id),
customer_id int,
foreign key(customer_id) references credit_card(customer_id));

desc transaction;

create table loan
(loan_id int primary key,
issued_amount int,
remaining_amount int,
branch_id int,
foreign key(branch_id) references banker(branch_id),
account_id int,
foreign key(account_id) references account(account_id));
desc loan;

create table loan_payment
(loan_payment_id int,
loan_id int,
foreign key(loan_id) references loan(loan_id),
amount int);
 
 desc loan_payment;
 
 create table borrower
 (borrower_id int,
 loan_id int,
 foreign key(loan_id) references loan(loan_id),
 customer_id int,
 foreign key(customer_id) references credit_card(customer_id));
 desc borrower;
 
 show databases;