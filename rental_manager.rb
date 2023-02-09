class RentalManager
  attr_reader :rentals

  def initialize
    @rentals = []

    File.open('rentals.json', 'a+') do |f|
      rents = f.read
      @rentals = if rents.empty?
                   []
                 else
                   JSON.parse(rents, create_additions: true)
                 end
    end
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

  def gets_book(books)
    puts 'Select abook from the following by number'
    books.each_with_index { |book, index| puts " #{index})  Title: #{book.title} , Author: #{book.author}" }

    book_index = gets.chomp.to_i
    books[book_index]
  end

  def gets_person(people)
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
    people[person_index]
  end

  def gets_date
    print 'Date (YYYY-MM-DD): '
    gets.chomp
  end

  def create_rental(books, people)
    book = gets_book(books)
    person = gets_person(people)
    date = gets_date

    @rentals << Rental.new(date, book, person)
    puts 'Rental created.'
  end
end
