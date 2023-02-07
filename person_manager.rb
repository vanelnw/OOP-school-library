require './student'
require './teacher'

class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def list_persons
    @people.each do |person|
      case person
      when Student
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      when Teacher
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2)? [Input the number] : '
    type = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    case type
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp == 'y'
      person = Student.new('classroom', age, name, parent_permission)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    end

    @people << person
    puts 'Person created successfully'
  end
end
