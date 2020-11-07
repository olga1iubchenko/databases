Test queries:

a. Find user by name (exact match)

SELECT id, name, surname, gender, date_of_birth, primary_phone_number, secondary_phone_number, email, subject_id, create_datetime, update_datetime
	FROM public."Students" 
	WHERE public."Students".name = 'b758a746487f681cffbf7151be5433a8';

b. Find user by surname (partial match)

SELECT id, name, surname, gender, date_of_birth, primary_phone_number, secondary_phone_number, email, subject_id, create_datetime, update_datetime
	FROM public."Students" 
	WHERE public."Students".surname = '031811db4108efdbb%';

OR


SELECT id, name, surname, gender, date_of_birth, primary_phone_number, secondary_phone_number, email, subject_id, create_datetime, update_datetime
	FROM public."Students" 
	WHERE public."Students".surname LIKE '%031811db4108efdbb%';	

c. Find user by phone number (partial match)

SELECT id, name, surname, gender, date_of_birth, primary_phone_number, secondary_phone_number, email, subject_id, create_datetime, update_datetime
	FROM public."Students" s 
	WHERE s.primary_phone_number LIKE '%0375%' OR s.secondary_phone_number LIKE '%0375%';

d. Find user with marks by user surname (partial match)

SELECT s.name AS student_name, s.surname AS student_surname , r.grade AS Marks
	FROM public."Students" s 
	RIGHT JOIN public."Results" r
	ON s.id = r.student_id
	WHERE s.surname = '031811db4108efdbb849%' AND s.name LIKE '%6487f681cffbf7151be5433a8';

