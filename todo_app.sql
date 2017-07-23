--Write a query to drop a database named `todo_app` if it exists
DROP DATABASE IF EXISTS todo_app;



--Write a query to delete a user named `michael` if it exists
DROP USER IF EXISTS michael;

--Write a query to create a user named `michael` with an encrypted password `stonebreaker`
CREATE USER michael with ENCRYPTED PASSWORD 'stonebreaker';



--Write a query to create a database named `todo_app`
CREATE DATABASE todo_app WITH OWNER michael;

--Connect to the newly created database
\c todo_app

--Write a query to create a table named `tasks` using the **Initial columns** detailed below
--\d movies to see the details of the table
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at timestamp NOT NULL DEFAULT NOW(),
  updated_at timestamp,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

--remove the column named completed
ALTER TABLE tasks DROP COLUMN completed;

--add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.
ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;

--change the updated_at column to not allow NULL values, and have a default value of now()
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

--create a new task, by only setting values (not defining which columns)
--id = default value
--title = 'Study SQL'
--description = 'Complete this exercise'
--created_at = now()
--updated_at = now()
--completed_at = NULL
INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);

--create a new task
--title = 'Study PostgreSQL'
--description = 'Read all the documentation'
INSERT INTO tasks (title, description)
VALUES('Study PostgreSQL', 'Read all the documentation');

--select all the titles of tasks that are not yet completed
SELECT title FROM tasks WHERE completed_at = NULL;

--update the task with a title of 'Study SQL' to be completed as of now
UPDATE tasks SET completed_at = NOW() WHERE title = 'Study SQL';

--select all titles and descriptions of tasks that are not yet completed
SELECT title, description FROM tasks WHERE completed_at = NULL;

