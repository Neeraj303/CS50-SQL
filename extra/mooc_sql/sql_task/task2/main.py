import courses

courses.create_tables()

t1 = courses.create_teacher("Erkki Kaila")
t2 = courses.create_teacher("Antti Laaksonen")
t3 = courses.create_teacher("Matti Luukkainen")
t4 = courses.create_teacher("Emilia Oikarinen")
t5 = courses.create_teacher("Leena Salmela")

c1 = courses.create_course("Computational Models", 5, [t1])
c2 = courses.create_course("Software Engineering", 5, [t2, t4, t5])
c3 = courses.create_course("Programming Fundamentals", 5, [])
c4 = courses.create_course("Database Fundamentals", 5, [t3, t5])
c5 = courses.create_course("Computer Operations", 5, [t1])

s1 = courses.create_student("Heikki Lokki")
s2 = courses.create_student("Liisa Marttinen")
s3 = courses.create_student("Otto Nurmi")
s4 = courses.create_student("Esko Ukkonen")
s5 = courses.create_student("Arto Wikla")

courses.add_credits(s1, c2, "2020-06-01", 5)
courses.add_credits(s1, c3, "2021-01-08", 3)
courses.add_credits(s2, c5, "2022-03-23", 2)
courses.add_credits(s4, c3, "2022-01-27", 4)
courses.add_credits(s4, c4, "2021-05-05", 4)
courses.add_credits(s4, c2, "2021-10-03", 5)
courses.add_credits(s4, c5, "2021-10-04", 5)
courses.add_credits(s5, c2, "2020-12-24", 1)

courses.create_group("Basic encoders", [t2, t3], [s1, s2, s3])
courses.create_group("Cobol Encoders", [t1], [s2, s4])
courses.create_group("Fortran Coders", [t1, t2, t3, t4, t5], [s1, s2, s3, s4, s5])
courses.create_group("PHP Coders", [t4, t5], [s3])

print(courses.courses_by_teacher("Leena Salmela"))
print(courses.credits_by_teacher("Leena Salmela"))
print(courses.courses_by_student("Esko Ukkonen"))

print(courses.credits_by_year(2020))
print(courses.credits_by_year(2021))
print(courses.credits_by_year(2022))

print(courses.grade_distribution("Programming Fundamentals"))
print(courses.grade_distribution("Computer Operations"))

print(courses.course_list())
print(courses.teacher_list())

print(courses.group_people("Basic coders"))
print(courses.credits_in_groups())
print(courses.common_groups("Antti Laaksonen", "Otto Nurmi"))import courses

courses.create_tables()

t1 = courses.create_teacher("Erkki Kaila")
t2 = courses.create_teacher("Antti Laaksonen")
t3 = courses.create_teacher("Matti Luukkainen")
t4 = courses.create_teacher("Emilia Oikarinen")
t5 = courses.create_teacher("Leena Salmela")

c1 = courses.create_course("Computational Models", 5, [t1])
c2 = courses.create_course("Software Engineering", 5, [t2, t4, t5])
c3 = courses.create_course("Programming Fundamentals", 5, [])
c4 = courses.create_course("Database Fundamentals", 5, [t3, t5])
c5 = courses.create_course("Computer Operations", 5, [t1])

s1 = courses.create_student("Heikki Lokki")
s2 = courses.create_student("Liisa Marttinen")
s3 = courses.create_student("Otto Nurmi")
s4 = courses.create_student("Esko Ukkonen")
s5 = courses.create_student("Arto Wikla")

courses.add_credits(s1, c2, "2020-06-01", 5)
courses.add_credits(s1, c3, "2021-01-08", 3)
courses.add_credits(s2, c5, "2022-03-23", 2)
courses.add_credits(s4, c3, "2022-01-27", 4)
courses.add_credits(s4, c4, "2021-05-05", 4)
courses.add_credits(s4, c2, "2021-10-03", 5)
courses.add_credits(s4, c5, "2021-10-04", 5)
courses.add_credits(s5, c2, "2020-12-24", 1)

courses.create_group("Basic encoders", [t2, t3], [s1, s2, s3])
courses.create_group("Cobol Encoders", [t1], [s2, s4])
courses.create_group("Fortran Coders", [t1, t2, t3, t4, t5], [s1, s2, s3, s4, s5])
courses.create_group("PHP Coders", [t4, t5], [s3])

print(courses.courses_by_teacher("Leena Salmela"))
print(courses.credits_by_teacher("Leena Salmela"))
print(courses.courses_by_student("Esko Ukkonen"))

print(courses.credits_by_year(2020))
print(courses.credits_by_year(2021))
print(courses.credits_by_year(2022))

print(courses.grade_distribution("Programming Fundamentals"))
print(courses.grade_distribution("Computer Operations"))

print(courses.course_list())
print(courses.teacher_list())

print(courses.group_people("Basic coders"))
print(courses.credits_in_groups())
print(courses.common_groups("Antti Laaksonen", "Otto Nurmi"))