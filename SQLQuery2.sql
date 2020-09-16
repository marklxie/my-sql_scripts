create database college;
use college;
create table student (
	id int not null primary key identity(1,1),
    name varchar(50) not null,
    email varchar(100) not null,
    cell varchar(12),
    sat float not null,
    gpa int not null,
    bff bit not null
);
insert student values
('alice', 'alice@email.com', '513-555-1212', 1300, 3.5, 1),
('bill', 'bill@email.com', '513-555-1212', 1000, 2.5, 0),
('ben', 'ben@email.com', '513-555-1212', 1200, 2.7, 0);
    
select * from student;