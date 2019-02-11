class Station
  attr_reader :trains, :name

  @@stations = []
  include InstanceCounter

  def initialize(name)
    @name = name
    @trains = []
    @@stations.push(self)
  end

  def which_types(type)
    @trains.count { |trn| trn.type == type }
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def self.all
    @@stations
  end
end
