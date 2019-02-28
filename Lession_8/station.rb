class Station
  attr_reader :trains, :name

  @@stations = []
  include InstanceCounter
  include Valid

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations.push(self)
    register_instance
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

  def each_train
    @trains.each { |trn| yield(trn) }
  end

  def validate!
    raise ArgumentError, 'Имя станции минимум два символа' if name.length < 2
  end
end
