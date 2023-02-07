class RentalManager
  attr_reader :rentals

  def initialize
    @rentals = []
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book '#{rental.book.title}' By #{rental.person.name} "
      end
    end
  end

  def create_rental(books, people)
    puts 'Select abook from the following by number'
    books.each_with_index { |book, index| puts " #{index})  Title: #{book.title} , Author: #{book.author}" }

    book_index = gets.chomp.to_i
    book = books[book_index]

    puts 'select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      case person
      when Student
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      when Teacher
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end

    person_index = gets.chomp.to_i
    person = people[person_index]

    print 'Date (YYYY-MM-DD): '
    date = gets.chomp
    @rentals << Rental.new(date, book, person)
    puts 'Rental created.'
  end
end
