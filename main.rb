require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'
require_relative 'book'
require_relative 'rental'

# Create a Classroom object
classroom = Classroom.new('Class A')

# Create Student objects
Student.new('John Doe', 16, classroom: classroom)
Student.new('Jane Smith', 17, classroom: classroom)

# Print the classroom label and its students
puts "Classroom: #{classroom.label}"
puts "Students in the classroom: #{classroom.students.map(&:name).join(', ')}"

# Create a Book object
book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')

# Create Person objects
person1 = Person.new('Alice')
person2 = Person.new('Bob')

# Create Rental objects
Rental.new('2023-06-20', book, person1)
Rental.new('2023-06-21', book, person2)

# Print the book title and its rentals
puts "Book: #{book.title}"
puts "Rentals for the book: #{book.rentals.map(&:person).map(&:name).join(', ')}"
