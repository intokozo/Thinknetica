class TrainPassenger < Train

  attr_reader :type

  def initialize(number)
    super
    @type = "passenger"
  end

  def add_car(car)
    super if car.type == :passenger
  end
end
