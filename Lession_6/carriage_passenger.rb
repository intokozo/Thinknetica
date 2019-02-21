class Carriage_passenger < Carriage

  attr_reader :type, :places, :places_occupied, :places_free

  def initialize(places)
    @type = :passenger
    @places = places
    @places_free = places
    @places_occupied = 0
  end

  def take_place
    @places_occupied += 1
    @places_free = @places - 1 if @places != @places_occupied
  end
end
