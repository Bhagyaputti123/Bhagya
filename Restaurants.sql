create database OnlineFoodOrderingDB

use OnlineFoodOrderingDB

create table Restaurants
(
restaurantid int identity(1000,1) primary key,
restaurantname varchar(100) not null,
restaurantaddress varchar(100) not null,
restaurantcity varchar(100) not null,
contactNo varchar(100) not null unique
)

insert Restaurants values

create table tbl_Rmenuitems
(
menuid int identity(100,1) primary key,
restaurantid int not null foreign key references Restaurants(restaurantid),
menuname varchar(100) not null,
menutype varchar(100) not null,
menucategory varchar(100) not null,
menuprice int not null,
menuDesc varchar(100) not null
)

create table customers
(
customerid  varchar(100) primary key,
customername varchar(100) not null,
customercity varchar(100) not null,
customerDOB varchar(100) not null,
customerGender varchar(100) not null,
customerPassword varchar(100) not null
)

create table tbl_orders
(
orderid int identity(10,1) primary key,
customerid int not null foreign key references customers(customerid),
orderdate varchar(100) not null,
deliveryaddress varchar(100) not null,
orderstatus varchar(100) not null
)

create table ordermenus
(
orderid int not null foreign key references tbl_orders,
menuid int not null foreign key references tbl_Rmenuitems(menuid),
menuqty int not null,
menuprice int not null,
primary key(orderid,menuid)
)







