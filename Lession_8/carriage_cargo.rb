class CarriageCargo < Carriage
  attr_reader :type

  def initialize(space)
    super
    @type = :cargo
  end
end
