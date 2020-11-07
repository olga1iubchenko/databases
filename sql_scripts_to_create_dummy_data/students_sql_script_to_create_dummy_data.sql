EXPLAIN ANALYZE

INSERT INTO public."Students"(
	 id, name, surname, gender, date_of_birth, primary_phone_number, secondary_phone_number, email, subject_id, create_datetime, update_datetime)
	 VALUES (generate_series(1, 100000), md5(random()::text), md5(random()::text), md5(random()::text)
			 , (SELECT NOW() - '1 year'::INTERVAL * ROUND(RANDOM() * 100))
			 , (SELECT ROUND(RANDOM() * 9000000))
			 , (SELECT ROUND(RANDOM() * 9000000)) 
 			 , (SELECT
                       'user_' || seq || '@' || (
                       CASE (RANDOM() * 2)::INT
                     WHEN 0 THEN 'gmail'
                      WHEN 1 THEN 'hotmail'
                       WHEN 2 THEN 'yahoo'
                        END
                       ) || '.com' AS email
                      FROM GENERATE_SERIES(1, 10) seq) 
			 , (SELECT id 
				FROM public."Subjects" where id = ROUND(RANDOM() * 100))
			 , (select NOW() + (random() * (NOW()+'90 days' - NOW())) + '30 days')
			 , (select timestamp '2020-11-10 20:00:00' +
                   random() * (timestamp '2020-01-01 20:00:00' -
                   timestamp '2020-12-01 10:00:00')))



