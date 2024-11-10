create database learning;
USE learning;
#This is for comment
-- is a comment as well
/* 
This is how to 
write a multi line
comment
*/

CREATE TABLE employee
(
emp_id INT,
emp_name varchar(60)
);

describe employee;
drop table employee;

# adding primary key

CREATE TABLE employee
(
emp_id INT primary key,
emp_name varchar(60)
);

insert into employee
(emp_id,emp_name)
values
(101, 'Tom');


select * 
from employee;

insert into employee
(emp_id,emp_name)
values
(102, 'Jerry');

/* composit key (multiple primary key) */

create table marks
(
stu_id INT,
sub_id int,
attempt_no int,
marks_obtained int,
total_marks int,
primary key (stu_id, sub_id, attempt_no)
);

/* cannot mention PK besides the field, 
hence a new field PRIMARY KEY is created and all the PK are addin in the () */

select * from marks;
describe marks;

insert into employee
(emp_id)
values
(103);

select * from employee;

#treating null values

drop table employee;

CREATE TABLE employee
(
emp_id INT primary key,
emp_name varchar(60) not null
);

#unique key
/* Does not allow duplicates, like PAN number, 
can have null values, uness specified */
drop table employee;

create table employee
(
emp_id int primary key,
emp_name varchar(60) not null,
aadhar_num int unique
);

insert into employee
(emp_id, emp_name, aadhar_num)
values
(102, "Jerry", 2345);

insert into employee
(emp_id, emp_name)
values
(103, "Ben");

insert into employee
(emp_id, emp_name)
values
(104, "Iron man");

select * from employee;

insert into employee
values
(105, "Spiderman", 4321),
(106, "Hulk", 2222);

drop table employee;

create table employee
(
emp_id int primary key,
emp_name varchar(60) not null,
dept_id int default 10
);

insert into employee
values
(101, "Tom", 15),
(102, "Jerry", default),

select * from employee ;

insert into employee
values
(103, "John", default);

select * from employee ;

drop table employee;

create table employee
(
emp_id int primary key,
emp_name varchar(60) not null,
salary int check (salary > 999)
);

insert into employee
values
(101, "Tom", 12000),
(102,"Jerry",50000);


# Forein Key

drop table employee;

Create table department
(
Dept_id INT primary key,
dept_name varchar(60)
);

Create table employee
(
emp_id INT primary key,
emp_name varchar(60) not null,
dep_id int,
foreign key (dep_id) references department (dept_id)
);

insert into department
values (10,"HR");

insert into employee
values
(101, "Tom", 10);

#Altert able (add, modify, rename and delete columns)

describe employee;

alter table employee
add careeeer_band char(2);

alter table employee
rename column careeeer_band to career_band;

alter table employee
modify career_band char(3);

alter table employee
drop column career_band;

drop table employee;

CREATE TABLE employee 
(
	employee_id INT NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
    gender char(1) NOT NULL,
	hire_date DATE NOT NULL,
	salary INT,
	department_id INT DEFAULT 10,
	PRIMARY KEY (employee_id)
);

DESCRIBE EMPLOYEE;

INSERT INTO employee (employee_id, first_name, last_name, gender, hire_date, salary, department_id)
VALUES (151, 'David','Bernstein','M','1997-03-24',9500,80);

INSERT INTO employee VALUES 
(152, 'Peter','Hall','M','1997-08-20',9000,80);

INSERT INTO employee VALUES 
(153, 'Christopher','Olsen','M','1998-03-30',8000,80),
(154, 'Nanette','Cambrault','F','1998-12-09',7500,80);

SELECT * FROM employee;

INSERT INTO employee (employee_id, first_name, last_name, gender, hire_date) 
VALUES (155, 'Oliver','Tuvault','M','1999-11-23');

SELECT * FROM employee;

INSERT INTO employee VALUES 
(156, 'Janette','King','F','1996-01-30',10000,80),
(157, 'Patrick','Sully','M','1996-03-04',9500,80),
(158, 'Allan','McEwen','M','1996-08-01',9000,80),
(159, 'Lindsey','Smith','F','1997-03-10',8000,80),
(160, 'Louise','Doran','F','1997-12-15',7500,80),
(161, 'Sarath','Sewall','M','1998-11-03',7000,80),
(162, 'Clara','Vishney','F','1997-11-11',10500,80),
(163, 'Danielle','Greene','F','1999-03-19',9500,80),
(164, 'Mattea','Marvins','F','2000-01-24',7200,80),
(165, 'David','Lee','M','2000-02-23',6800,80),
(166, 'Sunder','Ande','M','2000-03-24',6400,80),
(167, 'Amit','Banda','M','2000-04-21',6200,80),
(168, 'Lisa','Ozer','F','1997-03-11',11500,80),
(169, 'Harrison','Bloom','M','1997-03-11',NULL,NULL);

SELECT * FROM EMPLOYEE;

create table temp_qual_emp
(
emp_id INT primary key,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL
);

insert into temp_qual_emp
select employee_id, first_name, last_name from employee;

select * from temp_qual_emp;


update EMPLOYEE
set first_name = 'Alan'
Where employee_id = 158;