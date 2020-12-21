# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
student_1 = Student.create!(name: "Harry", age: 15, house: "Gryphindoor")
student_2 = Student.create!(name: "Ron", age: 14, house: "Gryphindoor")
student_3 = Student.create!(name: "Luna", age: 13, house: "Huffapuff")
course_1 = Course.create!(name: "Defense against the Dark Arts")
course_2 = Course.create!(name: "Herbology")
course_3 = Course.create!(name: "Potions")
StudentCourse.create!(course_id: course_1.id, student_id: student_1.id)
StudentCourse.create!(course_id: course_1.id, student_id: student_2.id)
StudentCourse.create!(course_id: course_1.id, student_id: student_3.id)
StudentCourse.create!(course_id: course_2.id, student_id: student_1.id)
StudentCourse.create!(course_id: course_3.id, student_id: student_3.id)
