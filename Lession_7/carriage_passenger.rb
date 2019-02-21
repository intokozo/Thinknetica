class CarriagePassenger < Carriage

  attr_reader :type

  def initialize(space)
    super
    @type = :passenger
  end
end
