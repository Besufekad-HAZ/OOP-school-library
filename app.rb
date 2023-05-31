require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :books, :peoples

  def initialize
    @books = []
    @peoples = []
  end

  def list_all_books
    @books.each { |book| puts "Title = #{book.title} Author = #{book.author}" }
  end

  def list_all_peoples
    @peoples.each { |people| puts "#{[people.class.name]} Name = #{people.name} ID = #{people.id} Age = #{people.age}" }
  end

  def create_student(age, name, parent_permission)
    @peoples << Student.new(age, name, parent_permission: parent_permission)
  end

  def create_teacher(specialization, age, name)
    @peoples << Teacher.new(specialization, age, name)
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(date, people, book)
    Rental.new(date, people, book)
  end

  def list_rentals(id)
    @peoples.each do |person|
      next unless person.id == id

      return person
    end
  end
end
