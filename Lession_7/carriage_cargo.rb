class Carriage_cargo < Carriage

  attr_reader :type, :volume, :volume_free, :volume_occupied

  def initialize(volume)
    @type = :cargo
    @volume = volume
    @volume_free = volume
    @volume_occupied = 0.0
  end

  def take_volume(vol)
      @volume_occupied += vol if @volume_occupied < @volume
      @volume_free = @volume - @volume_occupied
  end

  def info
    "тип: #{@type}, свободно места: #{@volume_free}, занято места: #{@volume_occupied}"
  end
end
