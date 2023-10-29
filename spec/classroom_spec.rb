require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Eight')
  end

  it 'checking classroom instance' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'checking attributes' do
    expect(@classroom.classroom_label).to eq('Eight')
  end

  it 'test for add student' do
    student = double('student')
    allow(student).to receive(:age) { '12' }
    allow(student).to receive(:name) { 'Imran' }
    allow(student).to receive(:parent_permission) { true }
    allow(student).to receive(:classroom=).and_return(Classroom)
    expect(@classroom.add_student(student).students[0].name).to eq('Imran')
  end
end
