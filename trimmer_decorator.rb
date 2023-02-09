require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @wrapper.correct_name[0...10]
  end
end
