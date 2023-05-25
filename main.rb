require_relative 'app'

def main
  app = App.new

  loop do
    display_menu
    choose_option(app)
  end
end

def display_menu
  puts 'Choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person ID'
  puts '7. Quit'
end

def choose_option(app)
  options = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals_by_person_id,
    '7' => :exit_app
  }

  option = gets.chomp
  if options.key?(option)
    app.send(options[option])
  else
    puts 'Invalid option. Please choose again.'
  end
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

main
