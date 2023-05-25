require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def create_student
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Has Parent permission? [Y/N]'
    permission = gets.chomp
    permission = permission.downcase == 'y'

    student = Student.new(age, nil, name: name, parent_permission: permission)
    @people.push(student)
    puts 'Student Created Successfully'
  end

  def create_teacher
    print 'Specialization:'
    specialization = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    @people << Teacher.new(age, specialization, name: name)
    puts 'Teacher Created Successfully'
  end

  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    case gets.chomp.to_i
    when 1 then create_student
    when 2 then create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, i| puts "#{i}) Title: #{book.title}, Author: #{book.author}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index { |person, i| puts "#{i}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(@books[book_index], @people[person_index], date)
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    puts 'Enter a person ID:'
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == person_id }
    rentals.each { |rental| puts "Book: #{rental.book.title}, Date: #{rental.date}" }
  end
end
