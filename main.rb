require_relative 'person'
require_relative 'student'
require_relative 'teacher'

student = Student.new('Naji', 25, parent_permission: false, classroom: 'Classroom 101')
puts student.name
puts student.age
puts student.can_use_services?
puts student.play_hooky

teacher = Teacher.new('Jane Smith', 35, true, 'Mathematics')
puts teacher.name
puts teacher.age
puts teacher.can_use_services?
