
############################################## INDEX ############################################
# • Index improve speed of operation in the table
# • A Simple index allows duplicate values in a table

use mydb;
insert into Information1 (cust1, name, country, city) values(1, "vijay", "india", "pune");
select *from Information1;
create index index_i on information1(cust1,name,country,city);

################ DROP INDEX ###########

ALTER TABLE Information1 DROP INDEX index_i;           # Syntax - ALTER TABLE table_name DROP INDEX index_name;

########################################## UNIQUE INDEX #########################

# • A unique index means that two rows cannot have the same index value

CREATE UNIQUE INDEX INDEX1 ON Information1(name);
SHOW INDEX FROM Information1;                         # It will indexes available on table

insert into Information1 (cust1, name, country, city) values(1, "Pratik", "india", "pune");


insert into Information1 (cust1, name, country, city) values(2, "Pratik", "Aust", "Satara");

# If we try to add duplicate entry in name column which we have selected as UNIQUE INDEX IT WILL SHOW ERROR AS BELOW....

#     Error Code: 1062. Duplicate entry 'Pratik' for key 'information1.INDEX1'	0.000 sec


########## ADDING INDEX AN IN AN EXISTING TABLE ##################

# • ALTER TABLE tbl_name ADD PRIMARY KEY (column_list)   -  indexed values must be unique and cannot be NULL

# • ALTER TABLE tbl_name ADD UNIQUE index_name (column_list)- indexed column values must be unique (except for the NULL values, which may appear multiple times)

# • ALTER TABLE tbl_name ADD INDEX index_name (column_list)- adds an ordinary index in which any value may appear more than once

# • ALTER TABLE tbl_name ADD FULLTEXT index_name (column_list)- creates a special FULLTEXT index that is used for text-searching purposes 


select * from information5;
truncate table information5;
ALTER TABLE information5 DROP primary key;
insert into information5 values(1, 'vijay', 'india', 'kolhapur'),(2, 'Pratik', 'India', 'Satara');
select * from information5;

ALTER TABLE information5 ADD UNIQUE index_U (city);

insert into information5 values(2, 'vijay', 'india', NULL);   # taking null value bcz of unique index
#18:54:31	insert into information5 values(2, 'vijay', 'india', NULL)	1 row(s) affected	0.047 sec

insert into information5 values(3, 'vijay', 'india', NULL);   # taking null value bcz of unique index
#18:55:54	insert into information5 values(3, 'vijay', 'india', NULL)	1 row(s) affected	0.063 sec

insert into information5 values(4, 'vijay', 'india', 'kolhapur');  # showing Error bcz we set uniuqe index to 'city column'
# 18:57:25	insert into information5 values(4, 'vijay', 'india', 'kolhapur')	Error Code: 1062. Duplicate entry 'kolhapur' for key 'information5.index_U'	0.000 sec



################################### PRIMARY INDEX #######################################

CREATE TABLE Person1 (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    City varchar(255), primary key(PersonID));
    
    alter TABLE Person1 drop PRIMARY KEY;
    
    ALTER TABLE Person1 ADD PRIMARY KEY (PersonID,FirstName);
    # 19:59:44	ALTER TABLE Person1 ADD PRIMARY KEY (PersonID,FirstName)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.125 sec
    
    
    insert into person1 values(1, 'patil', 'vijay', 'kolhapur');
# 20:01:22	insert into person1 values(1, 'patil', 'vijay', 'kolhapur')	1 row(s) affected	0.063 sec

    insert into person1 values(2, 'patil', 'vijay', 'kolhapur');
# 20:02:10	insert into person1 values(2, 'patil', 'vijay', 'kolhapur')	1 row(s) affected	0.078 sec

    insert into person1 values(2, 'patil', 'vija', 'kolhapur');
# 20:03:08	insert into person1 values(2, 'patil', 'vija', 'kolhapur')	1 row(s) affected	0.047 sec


    insert into person1 values(2, 'pati', 'vijay', 'kolhapur');
# 20:03:50	insert into person1 values(2, 'pati', 'vijay', 'kolhapur')	Error Code: 1062. Duplicate entry '2-vijay' for key 'person1.PRIMARY'	0.000 sec

select * from person1;