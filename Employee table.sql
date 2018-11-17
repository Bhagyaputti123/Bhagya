create database Emp_DB
use Emp_DB

create table tbl_Employees
(
EmployeeID int,
EmployeeFName varchar(100),
EmployeeLName varchar(100),
EmployeeCity varchar(100),
EmployeeDOB datetime,
EmployeeSalary int,
EmployeeStatus varchar(100)
)

select * from tbl_Employees

alter table tbl_Employees add EmployeeDept varchar(100)
alter table tbl_Employees add EmployeeDOJ varchar(100)

select * from tbl_Employees

insert tbl_Employees values(1,'bhagya','lakshmi',
'banglore','7-28-1996',30000,'working','computer','7-10-2017')
insert tbl_Employees values(2,'sindhu','naik',
'banglore','6-25-1996',30000,'working','information','6-15-2017')
insert tbl_Employees values(3,'bhavya','kc',
'bagalkot','7-20-1996',20000,'working','computer','5-10-2017')
insert tbl_Employees values(4,'bhuvana','ls',
'manglore','5-28-1992',25000,'working','networking','6-6-2017')
insert tbl_Employees values(5,'chaitra','cm',
'udupi','7-24-1995',40000,'working','bigdata','5-10-2017')
insert tbl_Employees values(6,'inchara','pm',
'pune','4-21-1995',30000,'working','iot','8-10-2016')
insert tbl_Employees values(7,'kasthuri','ks',
'kerala','7-24-1996',60000,'working','graphics','8-9-2017')
insert tbl_Employees values(8,'deepa','ds',
'mysore','5-27-1993',20000,'working','electronics','10-10-2017')
insert tbl_Employees values(9,'deeksha','ms',
'kodagu','11-26-1996',50000,'working','bigdata','8-10-2017')
insert tbl_Employees values(10,'nayana','kr',
'kolar','5-15-1992',30000,'working','cloud','9-10-2016')

update tbl_Employees set EmployeeCity='chennai' where EmployeeID='4'
update tbl_Employees set EmployeeCity='chennai' where EmployeeID='7'

select * from tbl_Employees

select * from tbl_Employees where EmployeeCity='chennai'

select * from tbl_Employees where EmployeeSalary between 25000 and 50000

select EmployeeFName,EmployeeID,EmployeeCity from tbl_Employees

select * from tbl_Employees order by len(EmployeeFName) asc

select sum(EmployeeSalary) from tbl_Employees

select count(*) from tbl_Employees

select * from tbl_Employees where datepart(mm,EmployeeID)=1

select * from tbl_Employees where datediff(yy,EmployeeDOJ,GetDate())>5

select EmployeeDept , count(*) from tbl_Employees group by EmployeeDept

select EmployeeCity,count(*) numberofEmp  from tbl_Employees group by EmployeeCity

update tbl_Employees set EmployeeCity='pune' where EmployeeCity='chennai'

select * from tbl_Employees

select EmployeeDept , count(*) from tbl_Employees where EmployeeSalary>40000
group by EmployeeDept

select cast(EmployeeSalary as decimal(12,4)) from tbl_Employees

update tbl_Employees set EmployeeStatus='resigned' where EmployeeStatus='working'

select * from tbl_Employees

select * from tbl_Employees where EmployeeDOJ=getdate()





















