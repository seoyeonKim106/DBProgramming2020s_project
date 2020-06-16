CREATE OR REPLACE FUNCTION calcOverdue
(
	bId IN books.b_id%type,
	sId IN students.s_id%type
)
RETURN NUMBER
IS
	oDays NUMBER;
	today VARCHAR2(15);
	ckDate	DATE;
BEGIN
	oDays:=0;
	
	SELECT ck_date INTO ckDate FROM checkOut WHERE s_id=sId and b_id=bId;
	today:=TO_CHAR(SYSDATE);
	oDays:=TRUNC(TO_DATE(today,'YY/MM/DD')-ckDate);

	RETURN oDays;
END;
/