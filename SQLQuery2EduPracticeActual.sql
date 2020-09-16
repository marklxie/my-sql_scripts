select s.id, (s.Firstname + ' ' + s.lastname)  'Full Name', s.GPA 'grade point average', m.Description 'Major Monogram'
from student s
join Major m on m.id = s.MajorId

--select * from major