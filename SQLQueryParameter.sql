declare @gpascoresmin float;
declare @gpascoresmax float;
set @gpascoresmin = 2.2;
set @gpascoresmax = 3.5;

declare @studentSAT int;
set @studentSAT = 1000;

select * from student
where GPA > @gpascoresmin and GPA < @gpascoresmax
order by GPA

select * from Major
where MinSAT <= @studentSAT