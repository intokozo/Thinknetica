class Station
  attr_reader :trains_on_st, :name

  def initialize(name)
    @name = name
    @trains_on_st = []
  end

  def take_train(train)
    @train_on_st.push(train)
  end

  def which_trains
    @train_on_st.each { |train| print "#{train.number_trn}, " }
  end

  def which_types
    cargo = 0
    pass = 0
    train_on_st.each { |trn| trn.type == "cargo" ? cargo += 1 : pass += 1 }
    print "Пассажирских: #{pass}, грузовых: #{cargo}"
  end

  def send_train(train)
    @train_on_st.delete(train)
  end
end

class Route

  def initialize(start_point, end_point)
    @stations = [start_point, end_point]
  end

  def add_station(name_station)
    stations.insert(1, name_station)
  end

  def del_station(name_station)
    stations.delete(name_station)
  end

  def list_station
    station.each { |st| print "#{st.name} ," }
  end
end

class Train

  attr_reader :number_trn, :trn_type, :lot_cars, :speed, :station

  def initialize(number_trn, trn_type, lot_cars)
    @number_trn = number_trn
    @trn_type = trn_type
    @lot_cars = lot_cars
    @speed = 0
  end

  def speed_up(accel = 10)
    @speed += accel
  end

  def current_speed
    print @speed
  end

  def brake
    @speed = 0
  end

  def hook_unhook
    puts "Прицепить или отцепить вагон?"
    input = gets.chomp.downcase
    if input == "прицепить" && speed > 0
      @lot_cars += 1
    elsif input == "отцепить" && speed > 0
      @lot_cars -= 1 if @lot_cars > 0
    else puts "Невозможно"
    end
  end

  def take_route(route)
    @route = route
    @current_station = route.stations[0]
    @index = 0
  end

  def move
    puts "Куда вы хотите переместить поезд? Вперед или назад."
    move = gets.chomp.downcase
    if move == "вперед"
      @index += 1
    elsif move == "назад"
      @index -= 1 if @index > 0
    else
      puts "Нет такого направления"
    end
    @current_station = route.stations[@index]
  end

  def know_routing
    index = @index
    puts "Какую станцию узнать? Текущая, предыдущая, следующая."
    input = gets.chomp.downcase
    if input == "текущая"
      puts @current_station
    elsif input == "предыдущая"
      index -= 1 if index > 0
      puts route.stations[index]
    elsif input == "следующая"
      index += 1
      puts route.stations[index]
    end
  end
end
