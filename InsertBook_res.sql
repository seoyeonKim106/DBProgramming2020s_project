CREATE PROCEDURE InsertBook_res(
	bId IN books.b_id%type,
	sId IN students.s_id%type,
	result OUT VARCHAR2
)

IS
	duplicate_reserve EXCEPTION;
	
	nBooks	NUMBER;
	rBooks	NUMBER;
	nReserv	NUMBER;
	
BEGIN
	result:='temp';
	nReserv:=0;

	/*에러 처리2: 이미 자신이 예약한 책에 대해 다시 예약하려고 하는 경우  -> 예약하는 경우에만 확인*/ 
	SELECT COUNT(s_id) INTO rBooks FROM reserve WHERE s_id=sId and b_id=bId;	
	IF(rBooks=1)
		THEN
			RAISE duplicate_reserve;
	END IF;	
	
	/*다른 사람도 예약하고 있는 경우를 위한 처리*/
	SELECT COUNT(s_id) INTO nReserv FROM reserve WHERE b_id=bId;
	

	INSERT INTO reserve(b_id,s_id,r_date) VALUES(bId,sId,sysdate());
	result:=CONCAT('reserve successfully\n',CONCAT(TO_CHAR(nReserv),' people are waiting this book'));
	
	COMMIT;
	
	EXCEPTION 
		WHEN duplicate_reserve THEN
			result:='Already reserved book';
		WHEN OTHERS THEN
			rollback;
			result:=SQLERRM;
END;
/