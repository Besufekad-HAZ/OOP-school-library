require_relative 'student'

class Classroom
  attr_accessor :classroom_label

  def initialize(classroom_label)
    @classroom_label = classroom_label
    @students = []
  end

  def add_student(student)
    return if student.nil?

    @students.push(student)
    student.classroom = self
  end

  def students
    @students.dup.freeze
  end
end
