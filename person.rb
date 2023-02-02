# Class that represents a person
class Nameable
  def correct_name
    raise NotImplementedError, 'correct_name method must be implemented in a subclass.'
  end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super
    @id = rand(100..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super
    @wrapper = nameable
  end

  def correct_name
    @wrapper.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @wrapper.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @wrapper.correct_name[0...10]
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
