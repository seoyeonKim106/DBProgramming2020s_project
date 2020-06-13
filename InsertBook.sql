CREATE PROCEDURE InsertBook(
	b_id IN VARCHAR2,
	s_id IN VARCHAR2
	result OUT VARCHAR)
IS
	too_many_books	EXCEPTION;
	too_many_delay	EXCEPTION;
	duplicate_reserve EXCEPTION;
	nBooks	NUMBER;
	
BEGIN
	result='temp';
END 