--Create function that will return average mark for input user 

CREATE FUNCTION avg_mark(id int) RETURNS double AS $$
    BEGIN
      SELECT AVG(r.grade) AS avg_mark
	  FROM public."Students" st 
	  JOIN public."Results" r ON st.id = r.student_id;
	  RETURN NEW;
    END; 
$$ LANGUAGE plpgsql;

--Create function that will return avarage mark for input subject name

CREATE FUNCTION avg_mark(subject_name character varying) RETURNS void AS $$
    BEGIN
      SELECT sbj.subject_name AS subject, AVG(r.grade) AS avg_mark
	  FROM public."Subjects" sbj 
	  JOIN public."Results" r ON sbj.id = r.subject_id
	  GROUP BY sbj.subject_name;
    END; 
$$ LANGUAGE plpgsql;

--Create function that will return student at "red zone" (red zone means at least 2 marks <=3)

CREATE FUNCTION avg_mark(subject_name character varying) RETURNS void AS $$
    BEGIN
      SELECT st.name AS student_name, st.surname AS student_surname, 
	  FROM public."Students" st 
	  JOIN public."Results" r ON st.id = r.student_id;
	  WHERE r.grade <= 3;
	  GROUP BY st.surname, st.name;
	  HAVING COUNT (r.grade) >= 2;
    END; 
$$ LANGUAGE plpgsql;