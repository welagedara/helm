CREATE SCHEMA `menagerie`;
USE `menagerie`;

CREATE TABLE friends (id INT, name VARCHAR(256), age INT, gender VARCHAR(3));

INSERT INTO friends VALUES (1, 'John Smith', 32, 'm');
INSERT INTO friends VALUES (2, 'Lilian Worksmith', 29, 'f');
INSERT INTO friends VALUES (3, 'Michael Rupert', 27, 'm');