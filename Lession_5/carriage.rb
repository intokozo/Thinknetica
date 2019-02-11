class Carriage

  attr_reader :type

  include ManufacturerCompany

  def initialize(type)
    @type = type
  end
end
