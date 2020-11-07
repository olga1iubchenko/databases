-- Table: public.Students

-- DROP TABLE public."Students";

CREATE TABLE public."Students"
(
    id integer NOT NULL DEFAULT nextval('"Students_id_seq"'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    surname character varying(500) COLLATE pg_catalog."default" NOT NULL,
    gender character(8) COLLATE pg_catalog."default",
    date_of_birth date NOT NULL,
    primary_phone_number bigint,
    secondary_phone_number bigint,
    email character varying(500) COLLATE pg_catalog."default" NOT NULL,
    subject_id integer,
    create_datetime timestamp with time zone,
    update_datetime timestamp with time zone,
    CONSTRAINT "ID" PRIMARY KEY (id),
    CONSTRAINT "Email" UNIQUE (email),
    CONSTRAINT student_to_subject_rel FOREIGN KEY (subject_id)
        REFERENCES public."Subjects" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public."Students"
    OWNER to postgres;
-- Index: fki_student_to_subject_rel

-- DROP INDEX public.fki_student_to_subject_rel;

CREATE INDEX fki_student_to_subject_rel
    ON public."Students" USING btree
    (subject_id ASC NULLS LAST)
    TABLESPACE pg_default;
	

CREATE UNIQUE INDEX email_search
    ON public."Students" USING btree
    (email COLLATE pg_catalog."default" varchar_pattern_ops ASC NULLS LAST)
    INCLUDE(email)
    TABLESPACE pg_default;

ALTER TABLE public."Students"
    CLUSTER ON email_search;

COMMENT ON INDEX public.email_search
    IS 'as email the only student contact to be guaranteed unique and not null';
	
CREATE INDEX student_surname_search
    ON public."Students" USING hash
    (surname COLLATE pg_catalog."default" varchar_pattern_ops)
    TABLESPACE pg_default;
