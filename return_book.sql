CREATE OR REPLACE PROCEDURE return_book(
	bId IN VARCHAR2,
	sId IN VARCHAR2,
	result OUT VARCHAR2
)
IS
	not_in_table EXCEPTION;
	
	nCk NUMBER;
	rDate DATE;
	aDays NUMBER;
	state VARCHAR2(4);
	overdue NUMBER;
BEGIN
	nCk:=0;
	overdue:=0;
	
	SELECT count(*) INTO nCk FROM checkOut WHERE b_id=bId and s_id=sId;	
	overdue:=calcOverdue(bId,sId);
	SELECT stat INTO state FROM students WHERE s_id=sId;
	SELECT a_date INTO aDays FROM authority WHERE stat=state;
	overdue:=calcOverdue(bId,sId);
	
	
	IF (nCk>0)
	THEN
		IF(overdue<=aDays)
		THEN
			result:='Return successfully';
		ELSE
			result:=CONCAT('Overdue for ',CONCAT(TO_CHAR(overdue),'days'));
		END IF;
	ELSE
		RAISE not_in_table;
	END IF;
	
	DELETE FROM checkOut WHERE b_id=bID and s_id=sId;
	
	COMMIT;
	
	EXCEPTION 
		WHEN not_in_table THEN
			result:='no checked out book exists';
		WHEN OTHERS THEN
			rollback;
			result:=SQLERRM;
END;
/