select * from tbl_Employees
select * from tbl_students


create proc sp_employeedetails(@id int,@name varchar(100) output,@city varchar


create table tbl_student
(
studentid int,
studentname varchar(100),
studentcity varchar(100)
)




alter Trigger trg_add_student
on tbl_student
for insert 
as
begin
select * from inserted
select 'trigger fired'
end

insert tbl_student values(3,'c','bglr')

select * from tbl_student

create table tbl_stock
(
itemid int primary key,
itemqty int not null
)

insert tbl_stock values(4,40)

select * from tbl_stock



create table tbl_order
(
orderid int identity(1000,1) primary key,
itemid int not null foreign key references tbl_stock(itemid),
quantity int not null,
price int not null
)

insert tbl_order values(4,20,30)

select * from tbl_order

alter trigger trg_update_stock
on tbl_order
for insert
as
begin

declare @itemid int
declare @qty int
select @itemid =itemid, @qty=quantity from inserted
update tbl_stock set itemqty=itemqty-@qty where itemid=@itemid

end

insert tbl_order values(2,30,40)
select * from tbl_order
select * from tbl_stock

alter view v_employees_BGL
with encryption, schemabinding
as
select EmployeeID,Employeename,Employeecity from dbo.tbl_Employees
 where Employeecity='BGL'

with check option
drop table tbl_Employees


sp_helptext v_employees_BGL

select * from v_employees_BGL 


insert v_employees_BGL values(1005,'abc','BGL',20000)
insert v_employees_BGL values(1006,'ABC','mumbai',20000)


create table tq
(
code int,
city varchar(100)
)
create table t2
(
code int,
name varchar(100)
)


insert tq values(1,'a')
insert tq values(1,'bgl')

insert t2 values(1,'a')
insert t2 values(3,'bgl')

update t2 set code=1 where code=3

select * from tq
select * from t2

create view v_data
as
select tq.code,tq.city,t2.name from tq join t2 on tq.code=t2.code


select * from v_data

insert v_data values(2,'pune','xyz')

create trigger trg_view
on v_data
instead of insert
as
begin
declare @code int
declare @name varchar(100)
declare @city varchar(100)
select @code=code,@name=name,@city=city from inserted
insert tq values(@code,@city)
insert t2 values(@code,@name)
end

create table tbl_employeeinfo
(
employeeid int identity(1,1),
employeename varchar(100),
employeecity varchar(100)
)

declare @c int=0;
while(@c<50000)
begin
insert tbl_employeeinfo values('abcd','hyd')
set @c=@c+1;
end

select * from tbl_employeeinfo where employeeid=49999

create clustered index idx
on tbl_employeeinfo(employeeid)

select * from tbl_Employees

begin tran tr1

insert tbl_Employees values(1010,'abc','bgl',2000)

rollback tran

commit tran




























