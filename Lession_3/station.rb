class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains.push(train)
  end

  def which_trains
    @trains.each { |train| print "#{train.number_trn}, " }
  end

  def which_types(type)
    @trains.select { |trn| trn.type == type }.count
  end

  def send_train(train)
    @trains.delete(train)
  end
end
