require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @wrapper.correct_name.capitalize
  end
end
