class Situations
  attr_reader :title, :situations

  def initialize(title:, situations:)
    @title = title
    @situations = situations.map { |situation| Situation.new(situation) }
  end
end
