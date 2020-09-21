Use Master;
go

Drop database if exists BcDb;
go

create database BcDb;
go

Use BcDb;
go

create table Customers(
	ID int not null primary key identity(1,1),
	Code varchar(10) not null unique,
	[Name] varchar(30) not null,
	Sales decimal(9,2) not null default 0 check(Sales >=0),
	Active bit not null default 1,
	Created datetime not null default getdate()
	);
go

insert Customers(Code, Name, Sales) values
	('A', 'ACME MFG', 10000),
	('B', 'BOB LTD', 5000),
	('C', 'Corner Drugstore', 3000);

Insert Customers(Code, Name) Values
	('D', 'Quick Easy Repair')	
select * from Customers

create table Orders(
	ID int not null Primary Key Identity(1,1),
	[Description] varchar(30) not null,
	Total decimal(9,2) not null default 0,
	[Customer ID] int not Null foreign key references Customers(ID)
);

Insert Orders(Description, Total, [Customer ID]) Values
	('1st Order', 1000, 1),
	('2nd Order', 5000, 2),
	--('3rd Order', 10, );
	Select * from Orders;