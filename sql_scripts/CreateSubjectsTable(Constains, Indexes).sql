-- Table: public.Subjects

-- DROP TABLE public."Subjects";

CREATE TABLE public."Subjects"
(
    id integer NOT NULL DEFAULT nextval('"Subjects_id_seq"'::regclass),
    subject_name character varying(500) COLLATE pg_catalog."default" NOT NULL,
    tutor character(100) COLLATE pg_catalog."default",
    duration_hours integer NOT NULL,
    CONSTRAINT "Subjects_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Subjects"
    OWNER to postgres;
	
CREATE INDEX search_by_duration
    ON public."Subjects" USING btree
    (duration_hours ASC NULLS LAST);
	
CREATE INDEX search_by_subject_name
    ON public."Subjects" USING hash
    (subject_name);
	
CREATE INDEX fki_result_to_subject_rel
    ON public."Results" USING btree
    (subject_id ASC NULLS LAST)
    TABLESPACE pg_default;
	
CREATE INDEX student_surname_search
    ON public."Students" USING hash
    (surname COLLATE pg_catalog."default" varchar_pattern_ops)
    TABLESPACE pg_default;
