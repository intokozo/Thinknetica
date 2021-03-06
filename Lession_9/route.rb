class Route
  attr_reader :stations

  include InstanceCounter
  include Validate
  extend Acсessors

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    valid!
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end

  def valid!
    raise ArgumentError, 'В маршруте должны быть две разные станции' if
      @stations.count < 2 || (@stations[0].name == @stations[-1].name)
  end
end
