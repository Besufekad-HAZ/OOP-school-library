require_relative 'storage_handler'

class DisplayHandler
  def display_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given personID'
    puts '7 - Exit'
  end
end

class BookCreationHandler
  def initialize(app, storage_handler)
    @app = app
    @storage_handler = storage_handler
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
    @storage_handler.store_books(title, author)
  rescue => e
    puts "An error occurred while creating the book: #{e.message}"
  end
end

class PersonCreationHandler
  def initialize(app, storage_handler)
    @app = app
    @storage_handler = storage_handler
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    number = gets.chomp
    number = gets.chomp while number != '1' && number != '2'

    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = false
    parent_permission = true unless %w[N n No no].include?(gets.chomp.downcase)
    person = { options: number, age: age, name: name, permission: parent_permission }
    if number == '1'
      @app.create_student(age, name,parent_permission)
    else
      print 'Specialization: '
      specialization = gets.chomp
      person['specialization'] = specialization
      @app.create_teacher(specialization, age, name)
    end
    @storage_handler.store_persons(person)
  rescue => e
    puts "An error occurred while creating the person: #{e.message}"
  end
end

class RentalCreationHandler
  def initialize(app, storage_handler)
    @app = app
    @storage_handler = storage_handler
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @app.books.each_with_index { |book, index| puts "#{index} Title = #{book.title} Author = #{book.author}" }
    number = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    @app.peoples.each.with_index do |person, index|
      puts "#{index}) #{[person.class.name]} Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date(YYYY-MM-DD)'
    date = gets.chomp
    @app.create_rental(date, @app.peoples[person_index], @app.books[number])
    @storage_handler.store_rentals({ date: date, p_idx: person_index, b_idx: number })
    puts 'Rental created successfully'
 end

class RentalListHandler
  def list_rentals
    print 'ID of a person: '
    id = gets.chomp.to_i
    person = @app.list_rentals(id)
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  rescue => e
    puts "An error occurred while listing rentals: #{e.message}"
  end
end

class HandleOptions
  def initialize(app, storage_handler)
    @app = app
    @storage_handler = storage_handler
    @display_handler = DisplayHandler.new
    @book_creation_handler = BookCreationHandler.new(@app, @storage_handler)
    @person_creation_handler = PersonCreationHandler.new(@app, @storage_handler)
    @rental_creation_handler = RentalCreationHandler.new(@app, @storage_handler)
    @rental_list_handler = RentalListHandler.new(@app)
  end

  def run
    loop do
      @display_handler.display_options
      option = gets.chomp.to_i

      case option
      when 1
        @app.list_all_books
      when 2
        @app.list_all_peoples
      when 3
        @person_creation_handler.create_person
      when 4
        @book_creation_handler.create_book
      when 5
        @rental_creation_handler.create_rental
      when 6
        @rental_list_handler.list_rentals
      when 7
        exit
      else
        puts 'Invalid option. Please enter a number between 1 and 7.'
      end
    end
  end
end
