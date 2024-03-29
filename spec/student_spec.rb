require_relative '../student'

describe Student do
  before :each do
    @student = Student.new(30, 'Imran', 'true')
  end

  it 'checking student instance' do
    expect(@student).to be_instance_of Student
  end

  it 'checking attributes' do
    expect(@student.play_hooky).to eq('¯(ツ)/¯')
  end

  it 'test for setter_classroom' do
    classroom = double('classroom', students: [])
    allow(classroom).to receive(:label) { 'Eight' }
    @student.classroom = classroom
    expect(@student.classroom.label).to eq('Eight')
  end
end
