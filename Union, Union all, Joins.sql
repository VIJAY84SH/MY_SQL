use mydb;
create table t1(cust_id int);
create table t2(cust_id int);
select * from t1;
insert into t1 values(1);
insert into t1 values(2);
insert into t1 values(3);

select * from t1;

insert into t2 values(4);
insert into t2 values(2);
insert into t2 values(3);

select * from t2;

select * from t1 union select * from t2;                               # it returns all union value and remove duplicate value
select * from t1 union all select * from t2;                           # it returns all union value with duplicate
select * from t1 where t1.cust_id in (select t2.cust_id from t2);      # Itersect Command    

#################################### joins---left,Right,Inner,Outer,self#############################################
create table customer(cust_id INT, cust_name VARCHAR(20), conatct_name VARCHAR(20), city varchar(20), telephone VARCHAR(10));
select * from customer;
create table orders(cust_id INT, order_id INT, order_date varchar(20), shipper_id varchar(20));
select * from orders;

insert into customer values
 (101, "Oliver", "Joy", "New York", 2016776708), 
(102,"George", "George", "Chicago" , "209761700"),
 (103,"Harry", "Harry", "Texas" , "2097617866"), 
 (104,"Jack", "Noah", "California", "2097627999");

insert into orders values
(101, 4501, '12/03/1997', 'A111' ), 
(102, 4502, '13/03/1997', 'A112'), 
(103, 4503, '14/03/1997', 'A113'),
 (105, 4505, '16/03/1997', 'A115'), 
 (106, 4506, '17/03/1997', 'A116');
 
 select* from customer;
 select* from orders;
 
 select cust.cust_id, cust.cust_name, ord.cust_id, ord.order_id from customer as cust, orders as ord;
 
 ######################################## Inner Join ########################################################
 
 select * from customer inner join orders on customer.cust_id = orders.cust_id;
 
  ######################################## Right Join ########################################################
 
 select * from customer right join orders on customer.cust_id = orders.cust_id;
 
 ######################################## Left Join #######################################################
 
 select * from customer left join orders on customer.cust_id = orders.cust_id;
 
 ######################################## Outer Join ######################################################
  select * from customer left join orders on customer.cust_id = orders.cust_id 
  union
  select * from customer right join orders on customer.cust_id = orders.cust_id;
  
  ######################################## Self Join ###################################################
  
  CREATE TABLE employee (Name VARCHAR(20), Age int, City  VARCHAR(20), Salary int);
  INSERT INTO employee (Name, Age, City, Salary) Values 
  ('Allex', 34, 'New York', 50000), 
  ('Mia', 25, 'Texas', 30000),
  ('Sara', 30, 'California', 67000), 
  ('Allen', 29, 'New York', 45000),
  ('John',45, 'Texas', 55000);
  
  select * from employee;
  
  select a.Name, b.Name, a.City, b.City, a.Salary, b.Salary from employee as a, employee as b
  where a.City = b.City and a.Salary >50000 and a.Name <> b.Name;
  
 
  
  
  
  
  
  
  