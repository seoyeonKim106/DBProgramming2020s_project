CREATE OR REPLACE PROCEDURE res_delete(
	bId IN VARCHAR2,
	sId IN VARCHAR2,
	result OUT VARCHAR2
)
IS
	not_in_table EXCEPTION;
	
	nRes NUMBER;

BEGIN
	nRes:=0;
	
	SELECT count(*) INTO nRes FROM reserve WHERE b_id=bId and s_id=sId;
	IF (nRes>0)
	THEN
		result:='Reservation delete successfully';
	ELSE
		RAISE not_in_table;
	END IF;
	
	DELETE FROM reserve WHERE b_id=bID and s_id=sId;
	COMMIT;
	
	EXCEPTION 
		WHEN not_in_table THEN
			result:='no reserved book exists';
		WHEN OTHERS THEN
			rollback;
			result:=SQLERRM;
END;
/