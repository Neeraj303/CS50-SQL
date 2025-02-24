import os
import os.path
import sqlite3

# remove the database at the beginning (convenient for testing the module)
if os.path.exists("courses.db"):
    os.remove("courses.db")

db = sqlite3.connect("courses.db")
db.isolation_level = None

# create the necessary tables in the database
def create_tables():
    pass

# add a teacher to the database
def create_teacher(name):
    pass

# add a course to the database
def create_course(name, credits, teacher_ids):
    pass

# add a student to the database
def create_student(name):
    pass

# gives a student credits for a course
def add_credits(student_id, course_id, date, grade):
    pass

# add a group to the database
def create_group(name, teacher_ids, student_ids):
    pass

# retrieves the courses taught by a teacher (in alphabetical order)
def courses_by_teacher(teacher_name):
    pass

# retrieves the number of credits given by a teacher
def credits_by_teacher(teacher_name):
    pass

# retrieves the courses a student has completed with grades (in alphabetical order)
def courses_by_student(student_name):
    pass

# retrieves the number of credits obtained in a specific year
def credits_by_year(year):
    pass

# retrieves the grade distribution for a course (in order of grades 1-5)
def grade_distribution(course_name):
    pass

# retrieves a list of courses (name, number of teachers, number of students) (in alphabetical order)
def course_list():
    pass

# retrieves a list of teachers with their courses (in alphabetical order of teachers and courses)
def teacher_list():
    pass

# retrieves the people in a group (in alphabetical order)
def group_people(group_name):
    pass

# retrieves the number of credits obtained in groups (in alphabetical order)
def credits_in_groups():
    pass

# retrieves the groups that have a specific teacher and student (in alphabetical order)
def common_groups(teacher_name, student_name):
    pass
