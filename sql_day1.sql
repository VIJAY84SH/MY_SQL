use mydb;
CREATE table Information1(cust1 int not null, name varchar(20) not null, country varchar(20) not null, city varchar(20));
insert into Information1 (cust1, name, country, city) values(1, "vijay", "india", "pune");
select * from Information1