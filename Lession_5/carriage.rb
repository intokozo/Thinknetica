class Carriage

  attr_reader :type

  include Manufacturer_company

  def initialize(type)
    @type = type
  end
end
