class Train

  attr_reader :number, :type, :lot_cars, :speed, :station

  def initialize(number, type, lot_cars)
    @number = number
    @type = type
    @lot_cars = lot_cars
    @speed = 0
  end

  def speed_up(accel = 10)
    @speed += accel
  end

  def brake
    @speed = 0
  end

  def add_car
    @lot_cars += 1 if speed > 0
  end

  def remove_car
    @lot_cars -= 1 if @lot_cars > 0 && speed > 0
  end

  def take_route(route)
    @route = route
    @station = route.stations[0]
    @index = 0
  end

  def move_forward
    @station.send_train(self)
    @index += 1
    @station = route.stations[@index]
    @station.take_train(self)
  end

  def move_back
    @station.send_train(self)
    @index -= 1 if @index > 0
    @station = route.stations[@index]
    @station.take_train(self)
  end

  def next_station
    route.stations[@index + 1]
  end

  def prev_station
    route.stations[@index - 1] if @index > 0
  end
end
