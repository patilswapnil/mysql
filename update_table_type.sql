# Update same table record by select same table ::

UPDATE stud t, (SELECT create_at, stud_id FROM stud) t1
SET t.create_at = '2016-07-29'
WHERE t.stud_id = t1.stud_id;
#---------------------------------------------------------

# update create_at field by specific geting time_zone timezone field and UTC ::
#mysql> select * from stud; #exiting table 
#+---------+---------+------------+---------------------+------+
#| stud_id | name    | create_at  | time_zone           | mark |
#+---------+---------+------------+---------------------+------+
#|       1 | swapnil | 2016-07-29 | America/Detroit     |   11 |
#|       2 | nikhil  | 2016-07-29 | America/Los_Angeles |   22 |
#|       3 | raju    | 2016-07-29 | Asia/Kolkata        |   33 |
#+---------+---------+------------+---------------------+------+
#

# step 1] change created field datatype
> ALTER TABLE revision_task MODIFY COLUMN due_date datetime;
# step 2] update field by timezone and it's covert into 'UTC'
> UPDATE stud t, (SELECT create_at, stud_id, (CASE 1 WHEN time_zone='America/Detroit' THEN '-04:30' WHEN time_zone='America/Los_Angeles' THEN '-07:00' WHEN time_zone='Asia/Kolkata' THEN '+05:30' ELSE '−05:00' END)as timezone FROM stud) t1
  SET t.create_at = CONVERT_TZ(t1.create_at, timezone, '+00:00')
  WHERE t.stud_id = t1.stud_id;

#---------------------------------------------------------

# Update only Time in a mysql DateTime field ::
#mysql> select * from stud;
#+---------+---------+---------------------+---------------------+------+
#| stud_id | name    | create_at           | status              | mark |
#+---------+---------+---------------------+---------------------+------+
#|       1 | swapnil | 2016-07-29 00:00:00 | America/Detroit     |   11 |
#|       2 | nikhil  | 2016-07-29 00:00:00 | America/Los_Angeles |   22 |
#+---------+---------+---------------------+---------------------+------+
#
> UPDATE stud t, (SELECT create_at, stud_id FROM stud) t1
  SET t.create_at = concat(date(t1.create_at), ' 23:59:00')
  WHERE t.stud_id = t1.stud_id;


#---------------------------------------------------------
