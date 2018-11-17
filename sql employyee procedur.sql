select * from tbl_students
select * from tbl_employees

select * from tbl_customers

alter proc proc_addemployees(@name varchar(100),@city varchar(100),@password varchar(100))
as
insert tbl_employees values(@name,@city,@password,getdate())
return @@identity


create proc proc_employyeedetails(@id int)
as
select * from tbl_employees where employeeid=@id


create proc proc_Showemployees(@city varchar(100))
as
select * from tbl_employees where employeecity=@city


create proc proc_searchemployees(@key varchar(100))
as
select * from tbl_employees where employeeid like '%'+@key+'%' or employeename like '%'+@key+'%' or employeecity like '%'+@key+'%'


create proc proc_updateemployees(@id int,@city varchar(100),@password varchar(100))
as
update tbl_employees set employeecity=@city, employeepassword=@password where employeeid=@id
return @@rowcount


create proc proc_deleteemployee(@id int)
as
delete tbl_employees where employeeid=@id 
return @@identity
  

create proc proc_login(@id int,@password varchar(100))
as


declare @count int
select @count=count(*) from tbl_employees where employeeid=@id and employeepassword=@password
return @count

select * from tbl_Employees

select * from tbl_customers

create proc proc_addCustomer(@name varchar(100),@password varchar(100),@city varchar(100),@address varchar(100),@mobileno varchar(100),@email varchar(100))
as
insert tbl_customers values(@name,@password,@city,@address,@mobileno,@email)
return @@identity


create proc proc_customerdetails(@id int)
as
select * from tbl_customers where customerid=@id


create proc proc_showcustomer(@city varchar(100))
as
select * from tbl_customers where customercity=@city


create proc proc_searchcustomer(@key varchar(100))
as
select * from tbl_customers where customerid like '%'+@key+'%' or customername like '%'+@key+'%' or customercity like '%'+@key+'%' 


create proc proc_updatecustomers(@id int,@address varchar(100),@mobileno varchar(100))
as
update tbl_customers set customeraddress=@address,customermobileNo=@mobileno where customerid=@id
return @@rowcount


alter proc proc_deletecustomers(@id int)
as 
delete tbl_customers where customerid=@id
return @@identity


create proc proc_logincustomer(@id int,@password varchar(100))
as
declare @count int
select @count=count(*) from tbl_customers where customerid=@id and customerpassword=@password
return @count


