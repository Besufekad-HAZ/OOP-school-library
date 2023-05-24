require_relative 'book'
require_relative 'person'

require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date

    # has-many side of Book and Rental
    book.add_rental(self)

    # has-many side of Person and Rental
    person.add_rental(self)
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end
end

book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')

person1 = Person.new(25, name: 'Alice')
person2 = Person.new(17, name: 'Bob', parent_permission: true)

rental1 = Rental.new(book1, person1, Date.today)
rental2 = Rental.new(book2, person2, Date.today)

p rental1.date
p rental1.book.title
p rental1.person.name

p rental2.date
p rental2.book.title
p rental2.person.name
