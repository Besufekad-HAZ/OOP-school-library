require_relative '../book'
require 'date'

describe Book do
  before :each do
    @book = Book.new 'Harry Potter', 'Imran'
  end

  it 'checking book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'checking attributes' do
    expect(@book).to have_attributes(title: 'Harry Potter', author: 'Imran')
  end

  it 'test for add_rental' do
    person = double('Person', rentals: [])
    allow(person).to receive(:age) { '12' }
    allow(person).to receive(:name) { 'Imran' }
    allow(person).to receive(:parent_permission) { true }
    rental = double('Rental', person: person, book: @book, date: Date.today)
    @book.add_rental(rental)
    expect(@book.rentals).to include rental
  end
end
