create or replace trigger change_passwd 
before
update on students
for each row

declare
    pw_len_error exception;
    pw_blank_error exception;
    pw_len students.s_pwd%type ;
begin
    pw_len := length(:new.s_pwd);
    if pw_len is null then
        raise pw_blank_error;
    elsif pw_len < 4 then
        raise pw_len_error;
    end if;
    
    exception
        when pw_blank_error then
            raise_application_error(-20003, 'password cannot be a blank.');
        when pw_len_error then
            raise_application_error(-20002, 'password cannot be shorter than 4.');
        when others then 
            dbms_output.put_line('error code:' || to_char(sqlcode));
            dbms_output.put_line('error message:' || sqlerrm) ;
end;
/

commit;

