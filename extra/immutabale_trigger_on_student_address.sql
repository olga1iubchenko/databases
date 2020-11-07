--Create table

CREATE TABLE public.student_address
(
    id serial NOT NULL,
    city character varying,
    street character varying,
    building character varying,
    unit character varying,
    zip character varying,
	student_id integer NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.student_address
    OWNER to postgres;
	
--Create function to merge changes on insert and violate all others	
CREATE OR REPLACE FUNCTION address_violate_update() RETURNS TRIGGER AS $stop_update$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update not allowed!'
        ELSIF (TG_OP = 'UPDATE') THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update not allowed!'
        ELSIF (TG_OP = 'INSERT') THEN
            MERGE INTO emp_audit SELECT id, city, street, building, unit, zip
	        FROM public.student_address;
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$stop_update$ LANGUAGE plpgsql;
	
--Create trigger based on function
CREATE TRIGGER stop_update BEFORE UPDATE OR INSERT OR DELETE ON public.student_address
FOR EACH ROW
  EXECUTE PROCEDURE address_violate_update();