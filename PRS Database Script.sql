Use Master;
go

drop database if exists PRS;
go

create database PRS
go
use PRS;
go

create table [User](
	ID int not null primary key identity(1,1),
	UserName varchar(20) not null unique,
	[Password] varchar(10) not null,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	PhoneNumber varchar(12) not null,
	Email varchar(75) not null,
	IsReviewer bit not null default 0,
	isAdmin bit not null default 0
);

insert [User](UserName, Password, FirstName, LastName, PhoneNumber, Email) values
	('Steve', 'SteveSteve', 'Steve', 'Steve', '513', 'steve@steve'),
	('Bubs', 'SteveBubs', 'Bubs', 'Steve', '5134', 'bubs@steve');

select * from [User]

create table [Vendor](
	ID int not null primary key identity(1,1),
	Code varchar(10) not null unique,
	[Name] varchar(25) not null,
	Address varchar(25) not null,
	City varchar(25) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	PhoneNumber varchar(12) not null,
	Email varchar(100) not null
);

insert [Vendor](Code, [Name], Address, City, State, Zip, PhoneNumber, Email) values
	('A', 'Bob', '4325 Logs', 'Cincinnati', 'OH', '45011', '513888888', 'bob@cinci.logs'),
	('B', 'Bob', '4325 Logs', 'Cinci', 'OH', '46011', '513888888', 'bob@cinci.logs');

select * from [Vendor]

create table Product(
	ID int not null primary key identity(1,1),
	VendorID int foreign key references Vendor(ID),
	PartNumber varchar(50) unique,
	[Name] varchar(150) not null,
	Price Decimal(10,2) not null,
	Unit Varchar(255),
	PhotoPath varchar(255)
);

insert Product(VendorID, PartNumber, [Name], Price) values
	(2, 'IMSA-6109B-TE', 'B to B', .25),
	(1, 'IMSA-6110B-TE', 'PinHeader', .10);

insert Product(VendorID, PartNumber, [Name], Price, Unit, PhotoPath) values
	(2, 'IMSA-7109B-TE', 'B to B', .256,'10','html'),
	(1, 'IMSA-7110B-TE', 'PinHeader', 3.10,'11', 'htmls');

select * from Product
	join Vendor on Vendor.ID = Product.VendorID


create table Request(
	ID int not null primary key identity(1,1),
	UserID int not null foreign key references [User](ID),
	Description varchar(100) not null,
	Justification varchar(255) not null,
	DateNeeded date not null,
	DeliveryMode varchar(25) not null,
	Status varchar(20) not null default 'NEW',
	Total decimal(10,2) not null,
	SubmittedDate datetime not null default getdate(),
	ReasonForRejection varchar(100)
	);

insert Request(UserID, Description, Justification, DateNeeded, DeliveryMode, Status, Total, ReasonForRejection) values
	(1, 'Hold', 'Test', '9-15-2017', 'FedEx', 'Open', 10, 'Something'),
	(2, 'Holm', 'Tesm', '10-15-2027', 'FedEm', 'Opem', 10, 'Somethinm')

insert Request(UserID, Description, Justification, DateNeeded, DeliveryMode, Total, ReasonForRejection) values
	(2, 'Holm', 'Tesm', '10-15-2027', 'FedEm', 10, 'Somethinm')

	insert Request(UserID, Description, Justification, DateNeeded, DeliveryMode, Total) values
	(2, 'Holm', 'Tesm', '10-15-2027', 'FedEm', 10)

select * from Request

create table [Line Item](
	ID int not null primary key identity(1,1),
	RequestID int not null foreign key references Request(ID),
	ProductID int not null foreign key references Product(ID),
	Quantity int not null
);

insert [Line Item](RequestID, ProductID, Quantity) values
	(2, 2, 100),
	(3, 1, 1000);

select * from [Line Item]
	join Request on Request.ID = [Line Item].RequestID
	join Product on Product.ID = [Line Item].ProductID