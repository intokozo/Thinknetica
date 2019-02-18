class Carriage

  attr_reader :type

  include ManufacturerСompany

  def initialize(type)
    @type = type
  end
end
