class Situation
  attr_reader :line, :status

  def initialize(line:, status:)
    @line = line
    @status = status
  end
end
