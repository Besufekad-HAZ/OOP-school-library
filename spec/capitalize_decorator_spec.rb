require_relative '../decorator_capitalize'

describe CapitalizeDecorator do
  before :each do
    person = double('Person', rentals: [])
    allow(person).to receive(:age) { 12 }
    allow(person).to receive(:name) { 'shubham' }
    allow(person).to receive(:parent_permission) { true }
    allow(person).to receive(:correct_name).and_return(person.name)
    @capdecorator = CapitalizeDecorator.new(person)
  end

  it 'checking for correct name method should return Capitalize' do
    expect(@capdecorator.correct_name).to eq('Shubham')
  end
end
