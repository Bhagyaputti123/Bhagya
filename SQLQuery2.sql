
create database Pathfrontdb2

use Pathfrontdb2

create table tbl_Customers
(
customerID int identity(1000,1) primary key,
customername varchar(100) not null,
customercitty varchar(100) not null,
customeremail varchar(100) not null unique,
customerMobileno varchar(100) not null unique
)


insert tbl_Customers values('bhagya','tumkur','abc@gamil.com','8722219772')
insert tbl_Customers values('sindhu','banglore','xyz@gmail.com','3543286556')
insert tbl_Customers values('megha','kerala','hfs@gmail.com','6857255458')
insert tbl_Customers values('sreeja','hyderabad','hgh@gmail.com','2547755678')
insert tbl_Customers values('shriya','chennai','bcc@gmail.com','9536438687')

select * from tbl_Customers


create table tbl_items
(
itemid int identity(1,1) primary key,
itemname varchar(100) not null,
itemprice int check(itemprice>0)
)

insert tbl_items values('rice','200')
insert tbl_items values('chese','500')
insert tbl_items values('wheet','400')
insert tbl_items values('cloth','300')
insert tbl_items values('plastic','600')

select * from tbl_items


create table tbl_invoices
( 
invoiceid int identity(10000,1) primary key,
customerid int not null foreign key references tbl_customers(customerid),
invoicecity varchar(100) not null,
invoicedate datetime not null,
invoiceaddress varchar(100)
)

insert tbl_invoices values(1000,'banglr','2-15-2018','chamarajpet')

insert tbl_invoices values(1003,'pune','4-2-2018','btm')

insert tbl_invoices values(1004,'chennai','6-7-2018','banashankari')

insert tbl_invoices values(1005,'Bengaluru','6-4-2017','hyd')

insert tbl_invoices values(1002,'tumkur','8-25-2018','telangana')

select * from tbl_invoices

update tbl_invoices set invoicedate=getdate() where invoiceid=10004




create table tbl_invoiceitems
(
invoiceid int not null foreign key references tbl_invoices(invoiceid),
itemid int not null foreign key references tbl_items(itemid),
itemqty int check(itemqty>0),
itemprice int check(itemprice>0),
primary key(invoiceid,itemid)
)

insert tbl_invoiceitems values(10003,5,7,30)

select * from tbl_invoiceitems

update tbl_invoiceitems set itemprice=250 where itemprice=30 and itemid=3

select * from tbl_Customers where customerid in(select customerid from tbl_invoices)

select * from tbl_Customers where customerid not in(select customerid from tbl_invoices)

select * from tbl_items where itemid in(select itemid from tbl_invoiceitems)

select * from tbl_invoices

select * from tbl_Customers where customerid= (select top 1 with ties *  from tbl_invoices
order by invoicedate desc)


create table tbl_employees
(
employeeid int identity(1,1) primary key,
employeename varchar(100) not null,
employeeSalary int not null,
employeeDept varchar(100),
managerID int foreign key references tbl_employees(employeeid)
)

insert tbl_employees values('john',20000,'HR',null)
insert tbl_employees values('roja',16000,'HR',2)
insert tbl_employees values('xyz',30000,'IT',null)
insert tbl_employees values('abc',35000,'IT',4)

select * from tbl_employees

select * from tbl_employees e1 where e1.employeeSalary>
(select avg(employeeSalary) from tbl_employees e2
where e2.employeeDept=e1.employeeDept)

select top 1 * from tbl_employees where employeeid not in(
select top 1 with ties employeeid from tbl_employees order by employeeSalary desc )
order by employeeSalary desc

select top 1 * from tbl_employees where employeeid in(
select top 2 employeeid from tbl_employees order by employeeSalary desc)
order by employeeSalary desc

select * from tbl_Customers
select * from tbl_invoices

select tbl_Customers.customerID,tbl_Customers.customername,tbl_invoices.invoiceid,
tbl_invoices.invoicedate from tbl_Customers right outer join tbl_invoices
on
tbl_Customers.customerID=tbl_invoices.customerid



select tbl_invoices.invoiceid,tbl_invoices.customerid,tbl_invoices.invoicecity,
tbl_invoiceitems.invoiceid,tbl_invoiceitems.itemid,tbl_invoiceitems.itemqty,tbl_items.itemname
from tbl_invoices join tbl_invoiceitems
on
tbl_invoices.invoiceid=tbl_invoiceitems.invoiceid 
join tbl_items
on
tbl_invoiceitems.itemid=tbl_items.itemid

--where tbl_invoiceitems.itemqty>1

select * from tbl_Customers cross join tbl_invoices

select * from tbl_employees

select e.employeeid,e.employeename,e.employeeSalary,e.employeeDept,e.managerId ,m.employeename
from tbl_employees e left outer join tbl_employees m
on
e.managerID=m.employeeid

--self join
































