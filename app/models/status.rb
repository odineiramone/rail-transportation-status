class Status
  attr_reader :line, :description

  def initialize(line:, description:)
    @line = line
    @description = description
  end

  def as_hash
    {
      line: line,
      description: description
    }
  end
end
