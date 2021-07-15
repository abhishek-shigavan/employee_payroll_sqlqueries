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

# UC9
alter table employee_payroll rename column Salary to BasicPay;					# renaming salary field
alter table employee_payroll add Deductions double not null after BasicPay;			# adding deductions field
alter table employee_payroll add TaxablePay double not null after Deductions;			# adding taxable pay field
alter table employee_payroll add Tax double not null after TaxablePay;				# adding tax field
alter table employee_payroll add NetPay double not null after Tax; 				# adding net pay field
describe employee_payroll;

# UC10
update employee_payroll set Department = 'Sales' where EmpName = 'Terisa';			# setting department field 
insert into employee_payroll 									# inserting data into table 
	( EmpName, PhoneNo, Address, Department, Gender,
          BasicPay, Deductions, TaxablePay, Tax, NetPay, StartDate )
        values
        ( 'Terisa', '9078563412', 'Mumbai', 'Marketing', 'F',
	  '2000000.00', '500000.00', '1500000.00', '50000', '1450000', '2019-02-08');
select * from employee_payroll; 

# UC11
create table company 						# Creating company table
(
    CompanyId int not null,					# Id of company
    CompanyName varchar(75)					# Name of company
);
describe company;						# Displaying company table structure
create table employee						# Creating employee table
(
    CompanyId int not null,					# Id of company
    EmpId int not null,						# ID of employee
    EmpName varchar(55) not null,				# Name of employee 
    PhoneNo varchar(50) not null,				# Phone number of employee
    Address varchar(150) not null,				# Address of employee
    Gender varchar(6) not null,					# Gender of employee
    StartDate date not null					# Joining date of employee
);
describe employee;						# Displaying employee table structure
create table emp_payroll					# Creating emp_payroll table
(
    EmpId int not null,						# Id of employee
    BasicPay double not null,					# Basic pay of employee
    Deductions double not null,					# Deductons from employee pay
    TaxablePay double not null,					# Taxable pay of employee
    Tax double not null,					# Tax on employee pay
    NetPay double not null					# Net pay of employee
);
describe emp_payroll;						# Displaying emp_payroll table structure
create table emp_department					# Creating emp_department table
(
    EmpId int not null,						# Id of employee
    DepId int not null,						# Id of department
    DepName varchar(55) not null				# Name of Department
);
describe emp_department;					# Displaying emp_department table structure

# UC12
insert into company							# Adding all data field values into company table 
	(CompanyId, CompanyName) 
	values
	('1', 'BridgeLabz');
select * from company;    
insert into employee							# Adding all data field values into company table
	(CompanyId, EmpId, EmpName, PhoneNo, Address, Gender, StartDate) 
	values
	('1', '101', 'Bill', '9876543210', 'Dadar, Mumbai', 'M', '2018-07-11'),
	('1', '102', 'Terisa', '8978675645', 'Borivali, Mumbai', 'F', '2019-02-08'),
	('1', '103', 'Charlie', '6789098978', 'Bandra, Mumbai', 'M', '2020-09-10');
select * from employee;
insert into emp_payroll							# Adding all data field values into company table
	(EmpId, BasicPay, Deductions, TaxablePay, Tax, NetPay)
	values
	('101', '1000000.00', '200000.00', '800000.00', '20000.00', '1180000.00'),
	('102', '2000000.00', '500000.00', '1500000.00', '50000.00', '1450000.00'),
	('103', '3000000.00', '1000000.00', '2000000.00', '100000.00', '1900000.00');    
select * from emp_payroll;
insert into emp_department						# Adding all data field values into company table
	(EmpId, DepId, DepName)
    	values
    	('101', '11', 'Technical'),
    	('102', '12', 'Sales'),
    	('102', '13', 'Marketing'),
    	('103', '11', 'Technical'),
    	('103', '13', 'Marketing');
select * from emp_department;

# Retrieving all the data of employee
select company.CompanyName, employee.*, 
   emp_payroll.BasicPay, emp_payroll.Deductions, emp_payroll.TaxablePay, emp_payroll.Tax, emp_payroll.NetPay, emp_department.DepName
from employee
inner join company on employee.CompanyId = company.CompanyId
inner join emp_payroll on employee.EmpId = emp_payroll.EmpId 
inner join emp_department on employee.EmpId = emp_department.EmpId
order by employee.EmpID; 

# Retrieving payroll data of particular employee
select company.CompanyName, employee.EmpId, employee.EmpName, 
	emp_payroll.BasicPay, emp_payroll.Deductions, emp_payroll.TaxablePay, emp_payroll.Tax, emp_payroll.NetPay
from employee
inner join company on employee.CompanyId = company.CompanyId
inner join emp_payroll on employee.EmpId = emp_payroll.EmpId 
where employee.EmpName = 'Bill';

# Retrieving payroll data of employees who joined between specified dates 
select company.CompanyName, employee.EmpId, employee.EmpName, 
	emp_payroll.BasicPay, emp_payroll.Deductions, emp_payroll.TaxablePay, emp_payroll.Tax, emp_payroll.NetPay
from employee
inner join company on employee.CompanyId = company.CompanyId
inner join emp_payroll on employee.EmpId = emp_payroll.EmpId 
where employee.StartDate between cast('2019-01-01' as date) and date(now());
