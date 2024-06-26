echo hello SQL
psql --username=freecodecamp --dbname=postgres
\l
DROP DATABASE students;
CREATE DATABASE students;
CREATE TABLE students();
CREATE TABLE majors();
CREATE TABLE courses();
CREATE TABLE majors_courses();
ALTER TABLE students ADD COLUMN student_id SERIAL PRIMARY KEY;
ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN major_id INT;
ALTER TABLE students ADD COLUMN gpa NUMERIC(2,1);
\d students
ALTER TABLE majors ADD COLUMN major_id SERIAL PRIMARY KEY;
ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;
\d majors
ALTER TABLE students ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
\d students
ALTER TABLE courses ADD COLUMN course_id SERIAL PRIMARY KEY;
ALTER TABLE courses ADD COLUMN course VARCHAR(100) NOT NULL;
\d courses
ALTER TABLE majors_courses ADD COLUMN major_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
ALTER TABLE majors_courses ADD COLUMN course_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);
\d majors_courses
ALTER TABLE majors_courses ADD PRIMARY KEY(major_id,course_id);
\d majors_courses
INSERT INTO majors(major) VALUES('Database Administration');
SELECT * FROM majors;
INSERT INTO courses(course) VALUES('Data Structures and Algorithms');
\d majors_courses
INSERT INTO majors_courses(major_id,course_id) VALUES(1,1);
INSERT INTO students(first_name,last_name,major_id,gpa) VALUES('Rhea','Kellems',1,2.5);
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM majors_courses;
SELECT * FROM majors;
TRUNCATE students,majors,courses,majors_courses;
INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id,course_id) VALUES('$MAJOR','$COURSE')")



