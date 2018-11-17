create database BankDB

use BankDB

create table tbl_customerinfo
(
customerid int identity(1000,1) primary key,
customername varchar(100) not null,
customerCity varchar(100) not null,
customerAddress varchar(100) not null,
customerMobileNo varchar(100) not null unique,
customerPanNo varchar(100) not null unique,
customerPassword varchar(100) not null
)

insert tbl_customerinfo values('bhagya','banglr','btm','8722219772','cpfp1535','a@123')
insert tbl_customerinfo values('sindhu','tumkur','bgr','8746275546','hffhfg765','f@122')
insert tbl_customerinfo values('madhu','chennai','lgm','8845675657','hfhd65435','g@154')
insert tbl_customerinfo values('roja','kerala','jhgj','8778456875','hjgh46777','h@5456')
insert tbl_customerinfo values('shree','pune','hgjh','86468758387','jhgd56754','hj@65577')
insert tbl_customerinfo values('bhagi','bombay','hgfg','87546757857','hfdh7547','hfd@8687')
insert tbl_customerinfo values('deee','kodagu','hfdhg','87632459485','kgfj6745','fd@86bhj')

select * from tbl_customerinfo


create table tbl_accountinfo
(
accountid int identity(100,1) primary key,
customerid int not null foreign key references tbl_customerinfo(customerid),
accountType varchar(100) not null,
accountBalance int not null,
accountOpenDate varchar(100) not null,
accountStatus varchar(100) not null
)

insert tbl_accountinfo values(1001,'savings',2000,getdate(),'open')
insert tbl_accountinfo values(1000,'current',3000,getdate(),'open')
insert tbl_accountinfo values(1002,'savings',5000,getdate(),'closed')
insert tbl_accountinfo values(1004,'current',4000,getdate(),'blocked')
insert tbl_accountinfo values(1003,'savings',6000,getdate(),'open')
insert tbl_accountinfo values(1005,'current',20000,getdate(),'open')
insert tbl_accountinfo values(1006,'savings',30000,getdate(),'closed')

select * from tbl_accountinfo



create table TransactionInfo
(
transactionid int identity(10,1) primary key,
accountid int not null foreign key references tbl_accountinfo(accountid),
transactionType varchar(100) not null,
amount int check(amount>0),
transactiondate datetime not null
)

insert TransactionInfo values(100,'debit',2000,getdate())
insert TransactionInfo values(103,'credit',4000,getdate())
insert TransactionInfo values(102,'debit',30000,getdate())
insert TransactionInfo values(104,'credit',25000,getdate())
insert TransactionInfo values(106,'debit',3500,getdate())
insert TransactionInfo values(105,'debit',4000,getdate())
insert TransactionInfo values(101,'credit',3000,getdate())

update TransactionInfo set transactiondate='10-28-2018' where accountid=102
update TransactionInfo set transactiondate='10-31-2018' where accountid=106


select * from TransactionInfo

select * from tbl_customerinfo
select * from tbl_accountinfo

select top 5 * from TransactionInfo where accountid=101 order by transactiondate  desc


select * from TransactionInfo where transactiondate between '10-28-2018' and '10-31-2018'


select tbl_customerinfo.customerid,tbl_customerinfo.customername,
tbl_customerinfo.customerAddress,tbl_customerinfo.customerMobileNo,
tbl_accountinfo.accountid,tbl_accountinfo.accountBalance from tbl_customerinfo
join tbl_accountinfo 
on
tbl_customerinfo.customerid=tbl_accountinfo.customerid


select tbl_accountinfo.accountid,tbl_accountinfo.accountBalance,
TransactionInfo.transactionid,TransactionInfo.amount,TransactionInfo.transactionType
from tbl_accountinfo join TransactionInfo
on 
tbl_accountinfo.accountid=TransactionInfo.accountid


select tbl_customerinfo.customerid,tbl_customerinfo.customername,
	tbl_customerinfo.customerAddress,tbl_customerinfo.customerMobileNo,tbl_accountinfo.accountid,
tbl_accountinfo.accountbalance,TransactionInfo.transactionid,TransactionInfo.amount,
TransactionInfo.transactionType from tbl_customerinfo join tbl_accountinfo
on
tbl_customerinfo.customerid=tbl_accountinfo.customerid
join TransactionInfo
on
tbl_accountinfo.accountid=TransactionInfo.accountid


select * from tbl_customerinfo where customerid in(select customerid from tbl_accountinfo)

select * from tbl_accountinfo where accountid in(select accountid from TransactionInfo)


select * from tbl_accountinfo where accountid  not in(select accountid from TransactionInfo)









