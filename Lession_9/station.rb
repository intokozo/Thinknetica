class Station
  attr_reader :trains, :name

  @@stations = []
  include InstanceCounter
  include Validate
  extend Acсessors

  def initialize(name)
    @name = name
    valid!
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

  def valid!
    raise ArgumentError, 'Имя станции минимум два символа' if name.length < 2
  end
end
