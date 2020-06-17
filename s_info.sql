CREATE OR REPLACE VIEW s_info(s_id,b_quantity,b_days)
AS
SELECT s.s_id,a.a_quantity,a.a_date
FROM students s,authority a
WHERE s.stat=a.stat;