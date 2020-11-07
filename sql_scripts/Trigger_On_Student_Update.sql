
CREATE TRIGGER student_update
AFTER INSERT OR UPDATE ON Students
    FOR EACH ROW EXECUTE PROCEDURE public.stamp_student();



CREATE FUNCTION public.stamp_student()
    RETURNS timestamp with time zone
    LANGUAGE 'sql'
    
AS $BODY$
CREATE FUNCTION stamp_student(id int) RETURNS void AS $$
    <<fn>>
    DECLARE
        curtime timestamp := now();
    BEGIN
        UPDATE users SET last_modified = fn.curtime;
          WHERE users.id = stamp_user.id;
    END;
$$ LANGUAGE plpgsql;
$BODY$;

ALTER FUNCTION public.stamp_student()
    OWNER TO postgres;
	
	
	
	