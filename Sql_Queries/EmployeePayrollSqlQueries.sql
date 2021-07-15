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