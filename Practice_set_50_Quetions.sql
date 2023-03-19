CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
select * from worker;


#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select first_name as Worker_name from worker;


#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select ucase(first_name) from worker;


#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(department) from worker;


#Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table
 select substring('first_name',1,3) from worker;
 
# Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table
select instr(first_name,binary 'a') from worker where first_name = 'amitabh';

#Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side. 
select rtrim(first_name) from worker;

#Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
 select ltrim(department)from worker;
 
# Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct(department), length(department) from worker;

#Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'a', 'A') from worker;


#Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them
select concat(first_name,' ', last_name) as complete_name from worker;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by first_name asc;

#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name asc, DEPARTMENT desc;

#Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
 select * from worker where first_name in ('vipul', 'satish');
 
 
# Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name not in ('vipul' , 'satish');

#Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select *  from worker where department like 'admin%';
select * from worker where department = 'admin';


#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’
select * from worker where first_name like '%a%';

 

#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like '%a' ;

#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select *from worker where first_name  like '_____h';

#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;


#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where year(joining_date) = 2014 and month(joining_date) = 2;


#Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(department) from worker where department = 'admin';


#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000

select first_name from worker where salary>=50000 and salary <=100000;

select concat(first_name, ' ', last_name) from worker where worker_id in ( select worker_id from worker where salary between 50000 and 100000);

#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department,count(WORKER_ID) as worker_count from worker group by department order by worker_count desc;


CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
        
    select * from worker;    
	select * from bonus;
	select * from title;
    
#Q-24. Write an SQL query to print details of the Workers who are also Managers        

select worker.first_name, title.worker_title from worker inner join title on worker. worker_id = title.WORKER_REF_ID where title.worker_title = 'manager';
select w.first_name, t.worker_title from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'manager';


select w.first_name, t.worker_title from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title in('manager');

#Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
 select worker_title, AFFECTED_FROM, count(*) from title  group by worker_title, AFFECTED_FROM having count(*) >1;
 
#Q-26. Write an SQL query to show only odd rows from a table.
select * from worker where mod(worker_id,2) <> 0;

#Q-27. Write an SQL query to show only even rows from a table.
select * from worker where mod(worker_id,2) = 0;

#Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker;
CREATE TABLE WorkerClone LIKE Worker;

#Q-29. Write an SQL query to fetch intersecting records of two tables.
select  * from worker where worker.worker_id in( select title.WORKER_REF_ID from title);

(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

#Q-30. Write an SQL query to show records from one table that another table does not have


#Q-31. Write an SQL query to show the current date and time.
select curdate();

#Following MySQL query returns the current date and time:
select now();

#Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker;
select * from worker order by salary desc limit 10;

#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker as w where 5-1 = (select count(distinct salary) from worker as w2 where w2.salary >w.salary);

# Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker as w where w.department = 'hr'
union all
select * from worker as w2 where w2.department ='hr' ;



# Q-42. Write an SQL query to show the last record from a table.
 select * from worker where worker_id =(select max(worker_id)from worker);

# Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id = (select min(worker_id) from worker);

# Q-44. Write an SQL query to fetch the last five records from a table.
select * from worker order by worker_id desc limit 5;


 select * from worker ; 

# Q-45. Write an SQL query to print the name of employees having the highest salary in each department


select a.DEPARTMENT, a.FIRST_NAME, a.salary from(select max(salary) as max_salary, DEPARTMENT from worker group by DEPARTMENT) as t
inner join worker a on t.DEPARTMENT = a.DEPARTMENT and t.max_salary = a.salary;

select max(salary) as max_salary, DEPARTMENT from worker group by DEPARTMENT;

#Q-46. Write an SQL query to fetch three max salaries from a table.
select distinct(salary) from worker order by salary desc limit 3;

SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

# Q-47. Write an SQL query to fetch three min salaries from a table.

select distinct(salary) from worker order by salary asc limit 3;

SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;

# Q-48. Write an SQL query to fetch nth max salaries from a table
SELECT distinct Salary from worker a WHERE 5 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

# Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department, sum(salary) from worker group by department;

# Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select First_name, salary from worker where salary = (select max(salary) from worker);