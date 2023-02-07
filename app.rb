require './book'
require './person'
require './rental'
require './student'
require './teacher'
require './person_manager'
require './book_manager'
require './rental_manager'

class App
  def initialize
    @peoples = PersonManager.new
    @books = BookManager.new
    @rentals = RentalManager.new
  end

  def process_action(option)
    options = {
      '1' => proc { @books.list_books },
      '2' => proc { @peoples.list_persons },
      '3' => proc { @peoples.create_person },
      '4' => proc { @books.create_book },
      '5' => proc { @rentals.create_rental(@books.books, @peoples.people) },
      '6' => proc { @rentals.list_rentals },
      '7' => proc { exit }
    }

    if options.key?(option)
      options[option].call
    else
      puts 'Invalid option, please try again.'
    end
  end
end
