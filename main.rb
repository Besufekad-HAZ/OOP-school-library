require_relative 'app'
require_relative 'handle_options'
require_relative 'loader'

def run_app(handle_options, _app)
  menu_options = {
    '1' => :list_all_books,
    '2' => :list_all_peoples,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals,
    '7' => :exit
  }
  loop do
    handle_options.display
    input = gets.chomp
    if menu_options.key?(input)
      run = menu_options[input]
      handle_options.send(run)
      break if run == 'exit'
    else
      puts 'Enter the correct option: '
    end
  end
end

def main
  app = App.new
  loader = Loader.new(app)
  loader.load_all
  handle_options = HandleOptions.new(app)
  puts 'Welcome to the School Library App!'
  run_app(handle_options, app)
end

main
