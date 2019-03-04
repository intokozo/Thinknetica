class Train
  attr_reader :number, :carriages, :type, :speed, :station

  include ManufacturerСompany
  include InstanceCounter
  include Valid
  extend Acсessors

  @@trains = {}
  NUMBER = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i.freeze

  def initialize(number)
    @number = number
    validate!
    @type = type
    @speed = 0
    @carriages = []
    @@trains[number] = self
    register_instance
  end

  def speed_up(accel = 10)
    @speed += accel
  end

  def brake
    @speed = 0
  end

  def add_car(car)
    @carriages << car if @speed.zero?
  end

  def remove_car(car)
    @carriages.delete(car) if @speed.zero?
  end

  def take_route(route)
    @route = route
    @station = route.stations[0]
    @index = 0
    @station.take_train(self)
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
    @@trains[number]
  end

  def each_car
    @carriages.each.with_index(1) { |car, index| yield(car, index) }
  end

  def validate!
    raise ArgumentError, 'Неправильный формат номера' unless number =~ NUMBER
  end
end
