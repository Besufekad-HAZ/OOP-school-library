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
    when '1' then @app.list_books
    when '2' then @app.list_people
    when '3' then @app.create_person
    when '4' then @app.create_book
    when '5' then @app.create_rental
    when '6' then @app.list_rentals_by_person_id
    when '7' then quit
    else
      puts 'Invalid option. Please choose a valid option.'
    end
  end

  def quit
    puts 'Thank you for using this app!'
    exit
  end
end

app = App.new
UI.new(app).main
