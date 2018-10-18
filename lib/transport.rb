class Transport
  class << self
    def title
      self.to_s
          .chomp("Crawler")
    end
  end
end
