require './book'

class BookManager
  attr_reader :books

  def initialize
    @books = []
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def gets_book_details
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_book
    book_details = gets_book_details
    @books << Book.new(book_details[0], book_details[1])
    puts 'Book created successfully'
  end
end
