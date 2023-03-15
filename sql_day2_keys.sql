use mydb;
create table information4 (
cust int not null UNIQUE,
custname varchar(20) not null,
country varchar(20) not null,
city varchar(20));

select * from information4;
insert into information4 values(1, 'anand', 'india', 'pune');
insert into information4 values(2, 'vinay', 'india', 'pune');
select * from information4;
insert into information4 values(1, 'anand', 'india', 'pune');

################################################################## UNIQUE KEY #################################################

create table tbl1 (cust_id int UNIQUE, name varchar(20), city varchar(20)); 
insert into tbl1 values(1, 'vijay', 'pune');                                  # Unique key avoid duplicate entry
insert into tbl1 values(2, 'vijay', 'pune');
insert into tbl1 values(3, 'vijay', 'pune');
insert into tbl1 values(null, 'vikas','pune');                                # if we take null value in unique key column it take value
select * from tbl1;

############################################################### PRIMARY KEY ####################################################

create table information5 (
cust int not null ,
custname varchar(20) not null,
country varchar(20) not null,
city varchar(20), PRIMARY KEY(cust));

insert into information5 values(1, 'vijay', 'india', 'pune');                  
insert into information5 values(2, 'vijay', 'india', 'pune');
insert into information5 values(3, 'vijay', 'india', 'pune');
insert into information5 values(3, 'vijay', 'india', 'pune');         # if we try to add duplicate then Error Code: 1062. Duplicate entry '3' for key 'information5.PRIMARY'	0.000 sec

select * from information5;

############################################################# FOREIGN KEY ######################################################

CREATE TABLE personal_info (
    cust_id INT NOT NULL,
    cust_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (cust_id)
);

select * from personal_info;

CREATE TABLE order_info (
    order_id INT NOT NULL,
    order_num INT NOT NULL,
    cust_id INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (cust_id)
        REFERENCES personal_info(cust_id)
);

select * from order_info;

insert into personal_info(cust_id, cust_name) values
(101, 'Anand'),
(102, 'Pratik'),
 (103, 'Vijay');
 
select * from personal_info;

insert into order_info(order_id, order_num, cust_id) values
(201, 75125,103),
 (202, 75126,103),
 (203, 75127,102),
 (204, 75128,101);
 
select * from order_info;

insert into order_info( order_id, order_num, cust_id) values
(205,75129,104);  #Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`order_info`, CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `personal_info` (`cust_id`))	0.062 sec


############################################################### Drop Database ############################################
create database dbdb;
show databases;
drop database dbdb;
show databases;

############################################################# Drop table ################################################

drop table table_name;

##################################################### Truncate Tavble ###################################################

# Truncate is used to delete the data inside a table but not the table itself

create table vijay (user_id int , user_name varchar(20), mob_no int);
insert into vijay values(101, 'vijaypatil', 8484);
select * from vijay;
truncate table vijay;
select * from vijay;

################################################### Alter Commad #######################################################
# The Change clause allows you to:
#	Change The name of column
#	Change the column Data type
#	change the column constraints


create table information6 (
cust int not null ,
custname varchar(20) not null,
country varchar(20) not null,
city varchar(20), PRIMARY KEY(cust));

insert into information6 values(1, 'vijay', 'india', 'pune');                  
insert into information6 values(2, 'vijay', 'india', 'pune');
insert into information6 values(3, 'vijay', 'india', 'pune');

select * from information6;  

alter table information6 change cust cust_id int; 
select * from information6; 
alter table information6 change custname cust_full_name varchar(30);                 # TO CHAGE COLUMN NAME
select * from information6; 