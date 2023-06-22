require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def display_menu
    puts 'Welcome to the School Library App'
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      if person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name} ID: #{person.id}: Age: #{person.age}"
      elsif person.is_a?(Student)
        puts "[Student] Name: #{person.name} ID: #{person.id}: Age: #{person.age}"
      else
        puts "Person Name: #{person.name} ID: #{person.id}: Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Create a Person'
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid person type'
    end
  end

  def create_student
    puts 'Create a Student'
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(name, age, parent_permission: parent_permission)
    @people << student
    puts 'Student created successfully'
  end

  def create_teacher
    puts 'Create a Teacher'
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(name, age, parent_permission: true, specialization: specialization)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Create a Book'
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Create a Rental'
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    unless person
      puts 'Invalid person ID'
      return
    end

    puts 'Enter book title:'
    book_title = gets.chomp

    book = @books.find { |b| b.title == book_title }
    unless book
      puts 'Invalid book title'
      return
    end

    puts 'Enter rental date (YYYY-MM-DD):'
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    puts 'List all rentals for a given person id'
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    unless person
      puts 'Invalid person ID'
      return
    end

    rentals = @rentals.select { |r| r.person == person }
    if rentals.empty?
      puts "No rentals found for #{person.name}"
    else
      puts "Rentals for #{person.name}:"
      rentals.each { |rental| puts "#{rental.book.title}, Date: #{rental.date}" }
    end
  end

  def exit_app
    puts 'Exiting the app...'
    exit
  end
end
