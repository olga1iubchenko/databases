EXPLAIN ANALYZE

INSERT INTO public."Results"(
	id, student_id, subject_id, grade)
	VALUES (generate_series(1,1000000)
			,(SELECT id 
				FROM public."Students" where id = ROUND(RANDOM() * 100))
			,(SELECT id 
				FROM public."Subjects" where id = ROUND(RANDOM() * 100)) 
			,(SELECT ROUND(RANDOM() * 100)))