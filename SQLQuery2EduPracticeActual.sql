use EdDb
select s.id, (s.Firstname + ' ' + s.lastname)  'Full Name', s.GPA 'grade point average'--, m.Description 'Major Monogram'
from student s
order by [grade point average] desc
--join Major m on m.id = s.MajorId

--select * from major

select (s.Firstname + ' ' + s.Lastname) 'Name', m.Description 'potential major', m.MinSAT, s.SAT from student s
join major m on m.minsat <= s.sat
order by 'Name'
--select * from Major

select c.subject, c. Section, i.Firstname + ' ' + i.Lastname 'Instructor Name' from Class c
join Instructor i on c.InstructorId = i.Id

select * from StudentClassRel
select * from student s
join StudentClassRel sc on s.Id = sc.StudentId
join Class c on sc.ClassId = c.Id

select * from Student s
where s.SAT < 1000

select i.firstname, i.Lastname, i.YearsExperience from Instructor as i
where i.firstname like '%a%'
order by i.Lastname


select m.Description, mc.ClassId, c.Subject from Major as m
join MajorClassRel as mc on mc.MajorId = m.Id
join class as c on mc.ClassId = c.Id
where m.Description like 'General%'

select * from student as s
left join major as m on m.Id = s.MajorId

select c.*, (i.Firstname + ' ' + i.Lastname) as 'Instructor Name' from Class as c
left join Instructor as i on i.Id = c.InstructorId

select * from student as s
where s.SAT < (select avg(sat) from student)

declare @maxsat int;
set @maxsat = 1100;

select * 
	from student where sat > @maxsat
	order by sat desc

declare @lowsat int = 1000;
declare @highsat int = 1200;

select * from student
where sat >= @lowsat and sat <= @highsat;