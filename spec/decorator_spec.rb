require_relative '../decorator'

describe Decorator do
  before :each do
    person = double('Person', rentals: [])
    allow(person).to receive(:age) { 12 }
    allow(person).to receive(:name) { 'Imran' }
    allow(person).to receive(:parent_permission) { true }
    allow(person).to receive(:correct_name).and_return(person.name)
    @decorator = Decorator.new(person)
  end

  it 'checking for correct name method should renturn same name' do
    expect(@decorator.correct_name).to eq('Imran')
  end
end
