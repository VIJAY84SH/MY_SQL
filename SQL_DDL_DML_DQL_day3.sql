create database mydb1;
show databases;
use mydb1;

################################################## CREATE COMMAND #######################################################
create table table1 (cust1 int not null unique, name varchar(20) not null, country varchar(20) not null, city varchar(20));
insert into table1 (cust1, name, country, city) values(1, "vijay", "india", "pune"),(2 , "pratik", "india", "satara");

select * from table1;

################################################## ALTER COMMANDS #######################################################

################## ALTER- CHANGE #########################

 #alter table table1 name name1 varchar(20);
 
 ################## ALTER- MODIFY #########################
 
alter table table1 modify cust1 char(100) ;
select * from table1;

insert into table1 (cust1, name, country, city) values("char", "vijay", "india", "pune"),(2 , "pratik", "india", "satara");
select * from table1;


 ################## ALTER- ADD #########################
 
alter table table1 add state varchar(20) after country;
select * from table1;

alter table table1 add subDistc varchar(20);
select * from table1;

 ################## ALTER- DROP #########################
 
alter table table1 drop subDistc;
select * from table1;


 ########################################################## RENAME- TABLE ##########################################
 
 rename table table1 to table2;
select * from table2;

####################################### TRUNCATE- TABLE #####################

TRUNCATE TABLE table1;

##################################################### DML- DATA MANIPULATION LANGUAGE #######################################################

select * from table2;
insert into table2 values(101,"shri", "ind", "Thane");
select * from table2;

################# Update cell record based on condn ######$$$$$$$$$$$################
update table2 set state = "maha" where city = "pune";
select * from table2;

################## Delete row record based on a condition ########################

 delete from table2 where city = "pune";
 select * from table2;
 describe table2;
 
 ####################################################### Data Query language ##############################################
 
 select city country from table2;
 select country, state from table2; # select specific columns and all rows in a table
 
 select * from table2;
 
 select * from table2 where state is  not null;
 
 select * from table2 where cust1 in ("1");
 
 select * from table2 where name in("pratik") and city in ("satara");
 
 