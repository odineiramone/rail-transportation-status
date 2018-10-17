require_relative 'rail_transports/subway'
require_relative 'rail_transports/train'

class RailTransports
  def self.check_status
    {
      subway: Subway.status,
      train: Train.status
    }
  end
end
