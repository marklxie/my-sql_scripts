use EdDb;
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

select student.Firstname, major.description as 'Major' from Student
left join Major on major.Id =Student.MajorId

select * from Class
join Instructor on Instructor.Id = class.InstructorId

select * from Instructor
left join class on InstructorId = Instructor.Id



select * from Student s
left join StudentClassRel sc on s.Id = sc.StudentId
left join Class c  on sc.ClassId = c.Id

select * from Major m
join MajorClassRel mcr on mcr.MajorId = m.Id
join Class c on mcr.ClassId = c.Id
order by c.Subject


select m.description 'major' ,count(*) 'Number of Classes', 'M Classes' as 'ABCDE' from major m
join MajorClassRel mcr on mcr.MajorId = m.Id
join class c on mcr.ClassId = c.Id
group by m.Description
having count(*) > 10
union
select m.description 'major' ,count(*) 'Number of Classes', 'E classes' as 'ABCDE' from major m
join MajorClassRel mcr on mcr.MajorId = m.Id
join class c on mcr.ClassId = c.Id
group by m.Description
having m.Description like 'E%'


