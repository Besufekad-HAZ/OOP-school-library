require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

# classroom = Classroom.new('Physics')
# student1 = Student.new(15, nil, name: 'Betty')
# student2 = Student.new(12, nil, name: 'Sami')
# classroom.add_student(student1)
# classroom.add_student(student2)
# p classroom.students.map(&:name)
