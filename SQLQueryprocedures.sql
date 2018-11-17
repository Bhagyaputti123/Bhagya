select * from tbl_Customers

create proc sp_add_customers(@CustomerID int ,@customername varchar(100),
@customercity varchar(100),@customerDOB varchar(100))
as
select * from tbl_Customers
begin 
insert tbl_Customers values(@CustomerID,@customername,@customercity,@customerDOB)
return @@identity
end
declare @c int
exec @c=sp_add_customers 1008,'bhagya','tamilunadu','10-11-1996'
select  @c



select * from tbl_Customers


alter proc sp_customers(@id int,@name varchar(100),
@city varchar(100),@DOB varchar(100))
as
update tbl_Customers set customername=@name
customercity=@city customerDOB=@DOB where CustomerID=@id
return 1;

declare @c int
exec @c=sp_customers 1009,'inchara','mumbai','9-16-1996'
select  @c

select * from tbl_Customers

select * from tbl_customerinfo


create proc sp_customersinfo(@cid int,@password varchar(100),@mobilno varchar(100))
as
select * from tbl_customerinfo where customerid=1000

declare
if(@password=@mobilno)
begin
update tbl_customerinfo set customerMobileNo=9732477533 where customerMobileNo=@mobilno
end
else
begin
print 'not updated'
end

select * from tbl_customerinfo
select * from tbl_accountinfo

select * from TransactionInfo


alter trigger trg_add_transaction
on Transactioninfo
for insert
as
begin
select * from inserted
update tbl_accountinfo set accountBalance=35000 where accountid=104

end

select * from TransactionInfo
select * from tbl_accountinfo
select * from tbl_customerinfo

create view v_customer_account
with encryption
as
select customerid,customername,accountid,accountbalance













create view












