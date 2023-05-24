require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students.push(student)
    student.classroom = self
  end
end

classroom = Classroom.new('Math')
student1 = Student.new(age: 11, name: 'Alice')
student2 = Student.new(age: 14, name: 'Bob')
classroom.add_student(student1)
classroom.add_student(student2)
puts classroom.students.map(&:name)
