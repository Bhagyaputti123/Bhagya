create database employeesmanagementDB
use employeesmanagementDB

create table tbl_Employees
(
employeeid int identity(1000,1) primary key,
employeename varchar(100) not null,
employeecity varchar(100) not null,
employeesalary int not null,
employeeDOB datetime,
employeeDOJ datetime,
employeeMobileNO varchar(100) not null,
employeeEmailid varchar(100) not null,
employeePassword varchar(100) not null,
employeeDept varchar(100) not null
)

drop table tbl_employees

select * from tbl_Employees

insert into tbl_Employees values('jkhvbkh','chennai',30000,'6-21-1996',
getdate(),'9864657868','bhgay@gmail.com','ds@edf','sd')

select * from tbl_Employees

create table tbl_employee_available_leave
(
employeeID int not null foreign key references tbl_Employees(employeeid),
sickleave varchar(100) not null,
casualleave varchar(100) not null,
vacationleave varchar(100) not null,
compoff int not null
)

insert tbl_employee_available_leave values(1000,'caugh','celbn','ncvcb',10)

select * from tbl_employee_available_leave

create table tbl_employeeleaves
(
employeeID int not null foreign key references tbl_Employees(employeeid),
leavetype varchar(100) not null,
leaveapplydate datetime,
leavedate datetime,
noofleave int not null,
)

insert tbl_employeeleaves values(1001,'localleave',getdate(),getdate(),10)

select * from tbl_employeeleaves


create table tbl_employeeSalary
(
employeeID int not null foreign key references tbl_Employees(employeeid),
employeesalary int not null,
salarymonth int not null,
salaryYear int not null,
salaryDate datetime
)

insert tbl_employeeSalary values(1002,40000,7,2018,getdate())

select * from tbl_employeeSalary
select * from tbl_Employees

select employeename from tbl_Employees order by employeeDOJ asc

select  employeename from tbl_Employees where employeesalary>20000

select employeeDept , count(*) from tbl_Employees 

select tbl_Employees.employeeid,tbl_Employees.employeename,
tbl_employee_available_leave.sickleave,tbl_employee_available_leave.casualleave,
tbl_employee_available_leave.vacationleave,tbl_employee_available_leave.compoff
from tbl_Employees join tbl_employee_available_leave on
tbl_Employees.employeeid=tbl_employee_available_leave.employeeid


select tbl_Employees.employeeid,tbl_Employees.employeename,
tbl_Employees.employeesalary,tbl_employeeSalary.salarymonth,tbl_employeeSalary.salarydate
from tbl_Employees join tbl_employeeSalary on
tbl_Employees.employeeid=tbl_employeeSalary.employeeid

select * from tbl_employee_available_leave


create proc sp_employeeleaves
@sleave varchar(100)
@cleave varchar(100)
@vacatleave varchar(100)
begin
update tbl_employee_available_leave set sickleave=@sleave,casualleave=@cleave,
vacationleave=@vacatleave where employeeID=1000
end
declare @i int
exec sp_employeeleaves=@i 







create table


