class Situation
  attr_reader :title, :status

  def initialize(title:, status:)
    @title = title
    @status = status.map { |status| Status.new(status) }
  end

  def as_hash
    {
      title: title,
      status: status.map(&:as_hash)
    }
  end
end
