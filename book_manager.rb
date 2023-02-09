require 'json'
require './book'

class BookManager
  attr_reader :books

  def initialize
    @books = []

    File.open('books.json', 'a+') do |f|
      bookss = f.read
      @books = if bookss.empty?
                 []
               else
                 JSON.parse(bookss, create_additions: true)
               end
    end
  end

  def insert_book_to_file
    File.write('books.json', JSON.dump(@books))
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
    insert_book_to_file
  end
end
