class Status
  attr_reader :line, :description

  def initialize(line:, description:)
    @line = line
    @description = description
  end
end
