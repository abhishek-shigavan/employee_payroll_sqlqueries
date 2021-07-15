# UC1
create database payroll_service_db;		# create database
show databases;					# To see all databases
use payroll_service_db;				# To use payroll_service_db database

# UC2
create table employee_payroll 					# creating employee_payroll table 
(
    Id int unsigned not null auto_increment,			# Id of employee
    EmpName varchar(120) not null,				# Name of employee
    Salary double not null,					# Salary of employee
    StartDate date not null,					# Start date of employess
    primary key(Id)						# make Id primary key 
);
show tables;							# show all tables of database
describe employee_payroll;					# show structure of employee_payroll table

# UC3
insert into employee_payroll (EmpName, Salary, StartDate) values		# inserting values into employee_payroll table
    ('Bill', '1000000.00', '2018-07-11'),
    ('Terisa', '2000000.00', '2019-02-08'),
    ('Charlie', '3000000.00', '2020-09-10');

# UC4
select * from employee_payroll;					# displaying employee_payroll table

# UC5
select Salary from employee_payroll where EmpName = 'Bill';	# retrieving salary by employee name
select * from employee_payroll where StartDate 			# retrieving all entries between specified date
	between cast('2019-01-01' as date) and date(now());

# UC6
alter table employee_payroll add Gender char(6) not null default 'N/A' after EmpName;	      # adding new column in table
describe employee_payroll;					                      # displaying employee_payroll table structure
update employee_payroll set Gender = 'M' where EmpName = 'Bill';			      # updating values of new column
update employee_payroll set Gender = 'F' where EmpName = 'Terisa';
update employee_payroll set Gender = 'M' where EmpName = 'Charlie';
select * from employee_payroll; 							# displaying updated employee_payroll table

# UC7
#performing sum, avg, min, max opeartion on salary of employee according to gender
select sum(Salary) from employee_payroll where Gender = 'M' group by Gender;
select sum(Salary) from employee_payroll where Gender = 'F' group by Gender;
select avg(Salary) from employee_payroll where Gender = 'M' group by Gender;
select avg(Salary) from employee_payroll where Gender = 'F' group by Gender;
select min(Salary) from employee_payroll where Gender = 'M';
select min(Salary) from employee_payroll where Gender = 'F';
select max(Salary) from employee_payroll where Gender = 'M';
select max(Salary) from employee_payroll where Gender = 'F';
select count(Salary) from employee_payroll where Gender = 'M';
select count(Salary) from employee_payroll where Gender = 'F';

# UC8
alter table employee_payroll add PhoneNo varchar(150) after EmpName;	                        # adding phone number field
alter table employee_payroll add Address varchar(255) default 'N/A' after PhoneNo;		# adding address field
alter table employee_payroll add Department varchar(255) not null after Address;		# adding department field
describe employee_payroll;
