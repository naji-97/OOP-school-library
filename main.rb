require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'

student = Student.new('Naji', 16, parent_permission: false, classroom: 'Classroom 101')
puts student.name
puts student.age
# puts student.can_use_services?
puts student.play_hooky

teacher = Teacher.new('John Doe', 35, specialization: 'Mathematics')
puts teacher.name
puts teacher.age
puts teacher.can_use_services?


person = Person.new('maximilianus', 22)
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
