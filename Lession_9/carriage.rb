class Carriage
  attr_reader :type, :space, :space_occupied, :space_free

  include ManufacturerСompany
  include Validate
  extend Acсessors

  def initialize(space)
    @type = 'unknown'
    @space = space
    @space_occupied = 0
    @space_free = space
  end

  def take_space(vol = 1)
    @space_occupied += vol if @space_occupied < @space
    @space_free = @space - @space_occupied
  end
end
