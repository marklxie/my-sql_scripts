select email, cell
from student
where (sat > 1000 and sat <1300) or sat > 1400
order by sat desc, name;