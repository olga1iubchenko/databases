EXPLAIN ANALYZE

INSERT INTO public."Subjects"(
	id, subject_name, tutor, duration_hours)
	VALUES (generate_series(1,1000), md5(random()::text), md5(random()::text), floor(random() * 50 + 1)::int)
	
	
