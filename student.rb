class Student < Person
  attr_reader :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
