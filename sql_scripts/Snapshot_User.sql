/*Note from official Postgres Documentation:

The Repeatable Read isolation level is implemented using a technique known in academic database literature and in some other database products as Snapshot Isolation. Differences in behavior and performance may be observed when compared with systems that use a traditional locking technique that reduces concurrency. Some other systems may even offer Repeatable Read and Snapshot Isolation as distinct isolation levels with different behavior. The permitted phenomena that distinguish the two techniques were not formalized by database researchers until after the SQL standard was developed.

PosgreSQL uses Repeatable Read isolation level as Snapshot and doesn't have a separate Snapshot isolation level (please see details in https://www.postgresql.org/docs/9.5/transaction-iso.html)

So inmplementation using REPEATABLE READ:*/

BEGIN ISOLATION LEVEL REPEATABLE READ;

BEGIN;

SELECT st.name AS student_name, st.surname AS student_surname , sbj.subject_name as subject_name, r.grade AS mark
	FROM public."Students" st 
	JOIN public."Subjects" sbj ON st.subject_id = sbj.id
	JOIN public."Results" r ON st.id = r.student_id;


