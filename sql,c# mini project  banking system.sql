create database BankingDB
use BankingDB

create table Customers
(
customerid int identity(1000,1) primary key,
customername varchar(100),
customeremail varchar(100),
customermobileno varchar(100),
customergender varchar(100),
customerpassword varchar(100)
)

create table Accounts
(
accountid int identity(100,1) primary key,
customerid int foreign key references Customers(customerid),
accountbalance int,
accounttype varchar(100),
accountopeningdate datetime
)

create table Transactions
(
transactionid int identity(10,1) primary key,
accountid int foreign key references Accounts(accountid),
amount int,
transactiontype varchar(100),
transactiondate datetime
)

select * from Customers

select * from Accounts

select * from Transactions


alter proc proc_addCustomer(@name varchar(100),@email varchar(100),@mobileno varchar(100),@gender varchar(100),@password varchar(100))
as
insert Customers values(@name,@email,@mobileno,@gender,@password)
return @@identity

create proc proc_showCustomer(@email varchar(100))
as
select * from Customers where customeremail=@email

create proc proc_login(@id int,@password varchar(100))
as
declare @count int
select @count=count(*) from Customers where customerid=@id and customerpassword=@password
return @count



create proc proc_addAccount(@CID int,@accbal int,@acctype varchar(100),@accopendate datetime)
as
insert Accounts values(@CID,@accbal,@acctype,GETDATE())
return @@identity

alter proc proc_showAccount(@id int)
as
select * from Accounts where customerid=@id


alter proc proc_addTransaction(@accid int,@amount int,@transType varchar(100),@transDate datetime)
as
insert Transactions values(@accid,@amount,@transType,@transDate)
return @@identity

alter proc proc_showTransaction(@id int)
as
select * from Transactions where accountid=@id


alter trigger trg_updatebalance
on Transactions
for insert
as
begin
declare @id int
declare @type varchar(100)
declare @balance int
select  @id=accountid,@type=transactiontype,@balance=amount from inserted

if(@type='credit')
begin
update Accounts set accountbalance=accountbalance+@balance where accountid=@id
end
else
update Accounts set accountbalance=accountbalance-@balance where accountid=@id
end



select * from Accounts

select * from Transactions



















 