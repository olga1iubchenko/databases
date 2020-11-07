RESULTS

-- Index: fki_re

-- DROP INDEX public.fki_re;

CREATE INDEX fki_re
    ON public."Results" USING btree
    (student_id ASC NULLS LAST)
    TABLESPACE pg_default;
	
-- Index: fki_result_to_subject_rel

-- DROP INDEX public.fki_result_to_subject_rel;

CREATE INDEX fki_result_to_subject_rel
    ON public."Results" USING btree
    (subject_id ASC NULLS LAST)
    TABLESPACE pg_default;
	

STUDENTS

-- Index: email_search

-- DROP INDEX public.email_search;

CREATE UNIQUE INDEX email_search
    ON public."Students" USING btree
    (email COLLATE pg_catalog."default" varchar_pattern_ops ASC NULLS LAST)
    INCLUDE(email)
    TABLESPACE pg_default;

ALTER TABLE public."Students"
    CLUSTER ON email_search;

COMMENT ON INDEX public.email_search
    IS 'as email the only student contact to be guaranteed unique and not null';
	
-- Index: fki_student_to_subject_rel

-- DROP INDEX public.fki_student_to_subject_rel;

CREATE INDEX fki_student_to_subject_rel
    ON public."Students" USING btree
    (subject_id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Index: student_surname_search

-- DROP INDEX public.student_surname_search;

CREATE INDEX student_surname_search
    ON public."Students" USING hash
    (surname COLLATE pg_catalog."default" varchar_pattern_ops)
    TABLESPACE pg_default;
	

SUBJECTS

-- Index: search_by_duration

-- DROP INDEX public.search_by_duration;

CREATE INDEX search_by_duration
    ON public."Subjects" USING btree
    (duration_hours ASC NULLS LAST)
    TABLESPACE pg_default;
	
-- Index: search_by_subject_name

-- DROP INDEX public.search_by_subject_name;

CREATE INDEX search_by_subject_name
    ON public."Subjects" USING hash
    (subject_name COLLATE pg_catalog."default")
    TABLESPACE pg_default;	

