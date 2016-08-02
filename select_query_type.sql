# select query from same table but different filter ::

select t.id,t1.* from stud t, (SELECT start_date, end_date, id, (CASE 1 WHEN status='America/Detroit' THEN '-04:30' WHEN status='America/Los_Angeles' THEN '-07:00' WHEN status='Asia/Kolkata' THEN '+05:30' ELSE '−05:00' END)as timezone FROM stud) t1
WHERE t.id = t1.id order by t.id desc limit 5;

#---------------------------------------------------------

# Inner join for multiple selection tables ::

select ad.id, md.id,  
from stud ad
INNER JOIN tutorial ar ON ad.id = ar.id
INNER JOIN assigment aa ON aa.id = ar.id
INNER JOIN course md ON md.id = aa.id

#---------------------------------------------------------

# Simple if vise selection ::
select count(id) from stud where tutorial_id in( select id from tutorial where assignment_id in(select id from assignment where course_id in(select id from course)));


