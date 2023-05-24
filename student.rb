require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_accessor :name

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def can_use_services?
    super && !suspended?
  end

  def suspended?
    false
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
