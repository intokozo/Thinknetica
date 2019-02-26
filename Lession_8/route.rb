class Route
  attr_reader :stations

  include InstanceCounter
  include Valid

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end

  def validate!
    if @stations.count < 2 || (@stations[0].name == @stations[-1].name)
      raise ArgumentError, 'В маршруте должны быть две разные станции'
    end
  end
end
