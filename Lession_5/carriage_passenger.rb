class Carriage_passenger < Carriage

  attr_reader :type

  def initialize
    @type = :passenger
  end
end
