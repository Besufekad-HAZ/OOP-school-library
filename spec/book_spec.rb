require_relative '../book'

describe Book do
  before :each do
    @book = Book.new 'Harry Potter', 'Shubham'
  end

  it 'checking book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'checking attributes' do
    expect(@book).to have_attributes(title: 'Harry Potter', author: 'Shubham')
  end

  it 'test for add_rental' do
    person = double('Person', rentals: [])
    allow(person).to receive(:age) { '12' }
    allow(person).to receive(:name) { 'Imran' }
    allow(person).to receive(:parent_permission) { true }
    rental = @book.add_rental('2323-23-23', person)
    expect(rental.person.name).to eq('Imran')
  end
end
