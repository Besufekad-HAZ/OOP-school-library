require_relative 'storage'
require 'json'

class StorageHandler
  def initialize
    @storage = Storage.new
    @books = 'books.json'
    @rentals = 'rentals.json'
    @persons = 'peoples.json'
  end

  def store_books(title, author)
    books = []
    book = { title: title, author: author }
    books = @storage.file_read(@books) if File.exist?(@books)
    books.push(book)
    @storage.file_write(@books, books)
  end

  def store_persons(person)
    persons = []
    persons = @storage.file_read(@persons) if File.exist?(@persons)
    persons.push(person)
    @storage.file_write(@persons, persons)
  end

  def store_rentals(rental)
    rentals = []
    rentals = @storage.file_read(@rentals) if File.exist?(@rentals)
    rentals.push(rental)
    @storage.file_write(@rentals, rentals)
  end
end
