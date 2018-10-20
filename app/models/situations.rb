class Situations
  attr_reader :title, :status

  def initialize(title:, status:)
    @title = title
    @status = status.map { |status| Status.new(status) }
  end
end
