CREATE ROLE role_with_validation WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD 'xxxxxx';

GRANT postgres TO role_with_validation;

SECURITY LABEL FOR no_special_chars ON ROLE role_with_validation IS '^/(?!@$)(?!#$)(?!$$)[a-z0-9]+$';


ALTER ROLE role_with_validation IN DATABASE college
    SET role TO 'role_with_validation';