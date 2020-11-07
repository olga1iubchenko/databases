-- DROP TABLE public."Results";

CREATE TABLE public."Results"
(
    id integer NOT NULL DEFAULT nextval('"Results_id_seq"'::regclass),
    student_id integer NOT NULL,
    subject_id integer NOT NULL,
    grade integer,
    pass_rate character(8) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Results_pkey" PRIMARY KEY (id),
    CONSTRAINT result_to_student_rel FOREIGN KEY (student_id)
        REFERENCES public."Students" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT result_to_subject_rel FOREIGN KEY (subject_id)
        REFERENCES public."Subjects" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public."Results"
    OWNER to postgres;
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
	
CREATE INDEX student_surname_search
    ON public."Students" USING hash
    (surname COLLATE pg_catalog."default" varchar_pattern_ops)
    TABLESPACE pg_default;
