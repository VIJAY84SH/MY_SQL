use mydb1;
create table my_sale(month varchar(15), prod_name varchar(20), sale int);
INSERT INTO my_sale VALUES('Jan', 'Fruits', 45000),
 ('Jan', 'Vegetables', 67000),
 ('Jan', 'Dairy', 55000),
 ('Feb', 'Fruits', 42000),
 ('Feb', 'Vegetables', 32000),
 ('Feb', 'Dairy', 52000),
 ('March', 'Fruits', 61000), 
 ('March', 'Vegetables', 43000),
 ('March', 'Dairy', 92000);
 
 select* from my_sale;
 select min(sale) from my_sale where month = 'jan';
 
 ######################## GROUP BY #################################
 
 select prod_name from my_sale group by prod_name;
 
 select prod_name, sum(sale) from my_sale group by prod_name;
 
 select	month, sum(sale) from my_sale group by month;
 
 select prod_name, avg(sale) from my_sale group by prod_name;
 
 select month, avg(sale) from my_sale group by month;
 
 select prod_name, min(sale) from my_sale group by prod_name;
 
 select month, min(sale) from my_sale group by month;
 
 select prod_name, max(sale) from my_sale group by prod_name;
 
 
 
 ##################### DATE FUNCTIONS ###################################
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 #################### Joins #################################
 use mydb;
 select * from employee_details;     # total 21
 select * from department_details;   # total 19
 
 
 ################ Right Join########### total 19
 select * from employee_details right join department_details on employee_details.EMPLOYEE_ID = department_details.EMPLOYEE_ID;
 
 ############## left_join ################## total 19
  select * from employee_details right join department_details on employee_details.EMPLOYEE_ID = department_details.EMPLOYEE_ID;
  
  
  create table j1 (c1 char unique);
  create table j2 (c2 char unique);
  insert into j1 values('a'),('b'),('c'),('d'),('e');
   insert into j2 values('d'),('e'),('f'),('g'),('h');
 
 select * from j1;
 select * from j2;
 
 select * from j1 left join j2 on j1.c1 = j2.c2;       # left Join
 select * from j1 right join j2 on j1.c1 = j2.c2;      # Right join
 select * from j1 inner join j2 on j1.c1 = j2.c2;      # Inner join

 
 select * from j1 left join j2 on j1.c1 = j2.c2
 union
 select * from j1 right join j2 on j1.c1 = j2.c2;     # Outer Join
 
 
 
  ######################## Self join ######################
  
  create table self_join (level1 varchar(20), level2 varchar(20));
  insert into self_join values 
  ('Pune', 'MH'),
  ('MH', 'India'),
  ('Jaipur', 'RJ'),
  ('RJ', 'India');
  select * from self_join;
 
  select t1.level1, t1.level2,t2.level1, t2.level2 as level3
  from self_join t1 join self_join t2 on t1.level2 = t2.level1;
 
select * from b_a_r_d ;
 

################################## Joins ###################

create table cricket(cricket_id int auto_increment, name varchar(30), primary key(cricket_id));

create table football(football_id int auto_increment, name varchar(30), primary key(football_id));
insert into cricket (name) values ('vijay'), ('ram'),('pratik'),('shinde');
select * from cricket;

insert into football (name) values ('vijay'), ('amol'),('pratik'),('akash');
select * from football;

select * from cricket as c inner join football as f on c.name = f.name;

select c.cricket_id, c.name, f.football_id, f.name from cricket as c inner join football as f on
c.name = f.name;


######################################################### JOIN ##############################################
create table student_persinal (id int, name varchar(30), percentage int, agae int, gender varchar(20), city int);
insert into student_persinal values(1, 'ram', 45, 19, 'm', 1);
insert into student_persinal values(2, 'sarita', 55, 29, 'f', 2);
insert into student_persinal values(3, 'salman', 62, 20, 'm', 1);
insert into student_persinal values(4, 'juhi', 47, 18, 'f', 3);
insert into student_persinal values(5, 'anil', 74, 22, 'm', 1);

create table student_city (city_id int, city_name varchar(20));
insert into student_city values(1, 'agra'), (2,'delhi'),(3,'bhopal'),(4, 'jaipur');

select * from student_persinal;
select * from student_city;

select id, name, city_name from student_persinal inner join student_city on
student_persinal.city = student_city.city_id;

select p.id, p.name, c.city_name from student_persinal as p inner join student_city as c on
p.city = c.city_id;

select p.id, p.name, c.city_name from student_persinal as p inner join student_city as c on
p.city= c.city_id where c.city_name = 'agra';


#################################### Left Join ###############################

create table student (id int, name varchar(30), agae int, city int);
insert into student values(1, 'ram', 19, 1);
insert into student values(2, 'salman', 18, 2);
insert into student values(3, 'meera', 19, null);
insert into student values(4, 'sarita', 21,3);

select * from student;

create table city(c_id int, city_name varchar(20));
insert into city values(1, 'agra'),(2, 'bhopal'), (3, 'delhi'), (4, 'noida');

select* from city;

select * from student left join city on student.city = city.c_id where agae = 19;
select * from student as s left join city as c on s.city = c.c_id where agae = 19;

select * from student as s left join city as c on s.city = c.c_id where agae = 19 order by name;

################################ Right Join #####################################

select * from student right join city on student.city = city.c_id;



################################# Full Outer Join #########################################

select * from student left join city on student.city = city.c_id
union
select * from student right join city on student.city = city.c_id;

############################### Self Join ###########################################

CREATE TABLE employee (Name VARCHAR(20), Age int, City  VARCHAR(20), Salary int);
INSERT INTO employee (Name, Age, City, Salary) Values ('Allex', 34, 'New York', 50000),
 ('Mia', 25, 'Texas', 30000),
 ('Sara', 30, 'California', 67000),
 ('Allen', 29, 'New York', 45000),
 ('John',45, 'Texas', 55000); 
 
 select * from employee;
 select distinct a.name, a.salary, a.city from employee as a, employee as b where a.city = b.city and a.salary > 50000;
 
 
 select a.name,a.salary, a.city from employee as a, employee as b where a.city = b.city and b.salary > 50000;