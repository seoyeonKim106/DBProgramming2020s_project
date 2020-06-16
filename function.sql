CREATE OR REPLACE FUNCTION calcOverdue
(
	bId IN books.b_id%type,
	sId IN students.s_id%type
)
RETURN NUMBER
IS
	oDays NUMBER;
	ckDate	DATE;
BEGIN
	oDays:=0;
	
	SELECT ck_date INTO ckDate FROM checkOut WHERE s_id=sId and b_id=bId;
	oDays:=TRUNC(SYSDATE)-ckDate;

	RETURN oDays;
END;
/