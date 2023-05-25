require_relative 'app'

class UI
  def initialize(app)
    @app = app
  end

  def main
    loop do
      puts 'Choose an option:'
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person ID'
      puts '7. Quit'
      choose_option
    end
  end

  private

  def choose_option
    option = gets.chomp
    case option
    when '1' then list_books
    when '2' then list_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_rentals_by_person_id
    when '7' then quit
    else
      puts 'Invalid option. Please choose a valid option.'
    end
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals_by_person_id
    @app.list_rentals_by_person_id
  end

  def quit
    puts 'Thank you for using this app!'
    exit
  end
end

app = App.new
UI.new(app).main
