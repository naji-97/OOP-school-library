require_relative 'person'

class Teacher < Person
  def initialize(name = 'Unknown', age = nil, parent_permission = true, specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end


teacher = Teacher.new('Jane Smith', 35, true, 'Mathematics')
puts teacher.name
puts teacher.age
puts teacher.can_use_services?
