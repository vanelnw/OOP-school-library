class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.add_rental(self)

    @person = person
    person.add_rental(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['date'], object['book'], object['person'])
  end
end
