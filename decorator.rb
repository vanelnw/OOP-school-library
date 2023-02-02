require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @wrapper = nameable
  end

  def correct_name
    @wrapper.correct_name
  end
end
