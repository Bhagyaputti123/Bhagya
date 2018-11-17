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



create proc proc_addAccount(@CID int,@accbal int,@acctype varchar(100),@accopendate datetime)
as
insert Accounts values(@CID,@accbal,@acctype,GETDATE())
return @@identity

create proc proc_showAccount(@acctype varchar(100))
as
select * from Accounts where accounttype=@acctype


create proc proc_addTransaction(@accid int,@amount int,@transType varchar(100),@transDate datetime)
as
insert Accounts values(@accid,@amount,@transType,GETDATE())
return @@identity

create proc proc_showTransaction(@transType varchar(100))
as
select * from Transactions where transactiontype=@transType

create proc proc_updateBalance(@accid int,@amount int,@transtype varchar(100),@transDate datetime)
as
update  Transactions set amount=@amount,transactiontype=@transtype,transactiondate=GETDATE() where accountid=@accid
return @@rowcount


















 