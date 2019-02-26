class TrainCargo < Train
  attr_reader :type

  def initialize(number)
    super
    @type = :cargo
  end

  def add_car(car)
    super if car.type == :cargo
  end
end
