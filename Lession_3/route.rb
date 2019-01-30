class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(1, station)
  end

  def del_station(station)
    stations.delete(station)
  end
end
