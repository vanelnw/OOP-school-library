require './app'

class Main
  def initialize
    @app = App.new
  end

  def run
    options = { '1' => :list_books,
                '2' => :list_persons,
                '3' => :create_person,
                '4' => :create_book,
                '5' => :create_rental,
                '6' => :list_rentals, '7' => :exit }

    puts ' '
    puts 'Please select one of the following options:'
    options.each { |key, value| puts "#{key} - #{value.to_s.capitalize.tr('_', ' ')}" }

    option = gets.chomp

    @app.process_action(option)

    run
  end
end

main = Main.new

main.run
