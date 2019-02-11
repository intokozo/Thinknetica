class Train

  attr_reader :number, :carriages, :type, :speed, :station

  include Manufacturer_company
  include InstanceCounter

  @@trains = []

  def initialize(number)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
    @@trains << self
  end

  def speed_up(accel = 10)
    @speed += accel
  end

  def brake
    @speed = 0
  end

  def add_car(car)
    @carriages << car if @speed == 0
  end

  def remove_car(car)
    @carriages.delete(car) if @speed == 0
  end

  def take_route(route)
    @route = route
    @station = route.stations[0]
    @index = 0
  end

  def move_forward
    @station.send_train(self)
    @index += 1
    @station = @route.stations[@index]
    @station.take_train(self)
  end

  def move_back
    @station.send_train(self)
    @index -= 1 if @index > 0
    @station = @route.stations[@index]
    @station.take_train(self)
  end

  def next_station
    @route.stations[@index + 1]
  end

  def prev_station
    @route.stations[@index - 1] if @index > 0
  end

  def self.find(number)
    @@trains.select { |train| train.number == number }
  end
end
