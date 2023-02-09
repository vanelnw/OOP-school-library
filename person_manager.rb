require './student'
require './teacher'

class PersonManager
  attr_reader :people

  def initialize
    @people = []

    File.open('people.json', 'a+') do |f|
      persons = f.read
      @people = if persons.empty?
                  []
                else
                  JSON.parse(persons, create_additions: true)
                end
    end
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

  def gets_person_infos
    print 'Do you want to create a student (1) or teacher (2)? [Input the number] : '
    type = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    [type, age, name]
  end

  def gets_parent_permission
    print 'Has parent permission? [Y/N]: '
    gets.chomp == 'y'
  end

  def gets_specialization
    print 'Specialization: '
    gets.chomp
  end

  def create_person
    infos = gets_person_infos

    case infos[0]
    when '1'
      parent_permission = gets_parent_permission
      person = Student.new('classroom', infos[1], infos[2], parent_permission)
    when '2'
      specialization = gets_specialization
      person = Teacher.new(infos[1], specialization, infos[2])
    end

    @people << person
    puts 'Person created successfully'
  end
end
