-- Query 1: Create index on table "enrollments" of "student_id" col
CREATE INDEX "student_index" ON "enrollments" ("student_id");

-- Query 2: 
CREATE INDEX "course_index" ON "enrollments" ("course_id");
CREATE INDEX "semester_fall_23" ON "courses" ("semester") WHERE "semester" = 'Fall 2023';
--CREATE INDEX "semester_index" ON "courses" ("semester");
--CREATE INDEX "course_info" ON "courses" ("department", "number", "semester"); not required since we just use 1 column as index

-- Query 3
--CREATE INDEX "semester_index" ON "courses" ("semester"); already created above

-- Query 4
CREATE INDEX "semesterspring__43" ON "courses" ("semester") WHERE "semester" = 'Spring 2024';

--Query 5
CREATE INDEX "course_index2" ON "satisfies" ("course_id");

--Query 6

--Query 7


VACUUM;
