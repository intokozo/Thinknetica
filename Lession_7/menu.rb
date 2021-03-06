class Menu
  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
    menu
  end

  def menu
    loop do
      puts 'С чем хотите работать?'
      puts '1.Поезда'
      puts '2.Станции'
      puts '3.Маршруты'
      puts '0.Выход'
      case gets.chomp
      when '1' then show_train_menu
      when '2' then station_menu
      when '3' then route_menu
      when '0' then break
      else puts 'Неправильный ввод.'
      end
    end
  end

  def show_train_menu
    puts 'Поезда. Что хотите сделать?'
    puts '1.Создать поезд'
    puts '2.Задать маршрут'
    puts '3.Прицепить вагон'
    puts '4.Отцепить вагон'
    puts '5.Занять место в вагоне'
    puts '6.Список вагонов у поезда'
    puts '7.Список всех поездов'
    puts '8.Переместить поезд вперед'
    puts '9.Переместить поезд назад'
    puts '0.Вернуться в предыдущее меню'
    choise_train_menu
#     case gets.chomp
#     when '1' then create_train
#     when '3' then add_car_to_train
#     when '4' then delete_car_from_train
#     when '5' then take_space_in_car
#     when '6' then show_carriages
#     when '7' then show_trains
#     when '8' then move_train_forward
#     when '9' then move_train_back
#     when '0' then break
#     else puts 'Неправильный ввод'
#     end
  end

  def choise_train_menu
    options = { '1' => create_train, '2' => add_car_to_train,
                '3' => delete_car_from_train, '4' => delete_car_from_train,
                '5' => take_space_in_car, '6' => show_carriages,
                '7' => show_trains, '8' => move_train_forward,
                '9' => move_train_back, '0' => menu }
    options[gets.chomp] || puts('Неправильный ввод')
    show_train_menu
  end

  def route_menu
    loop do
      puts 'Маршруты. Что хотите сделать?'
      puts '1.Создать маршрут'
      puts '2.Добавить станцию в маршрут'
      puts '3.Удалить станцию из маршрута'
      puts '4.Список маршрутов'
      puts '0.Вернуться в предыдущее меню'
      case gets.chomp
      when '1' then create_route
      when '2' then add_station_to_route
      when '3' then delete_station_from_route
      when '4' then show_routes
      when '0' then break
      else puts 'Неправильный ввод'
      end
    end
  end

  def station_menu
    loop do
      puts 'Станции. Что хотите сделать?'
      puts '1.Создать станцию'
      puts '2.Список всех станций'
      puts '3.Cписок поездов на станции'
      puts '0.Вернуться в предыдущее меню'
      case gets.chomp
      when '1' then create_station
      when '2' then show_stations
      when '3' then show_trains_on_station
      when '0' then break
      else puts 'Неправильный ввод'
      end
    end
  end

  def create_train
    puts 'Введите номер поезда'
    number = gets.chomp
    puts "1.Пассажирский\n2.Грузовой"
    type = gets.chomp.downcase
    if type == '2'
      trains << TrainCargo.new(number)
      puts "Грузовой поезд создан\n "
    elsif type == '1'
      trains << TrainPassenger.new(number)
      puts "Пассажирский поезд создан\n "
    else
      puts "Неправильный ввод. Повторите\n "
      create_train
    end
  end

  def select_train
    show_trains
    puts 'Выберете номер поезда'
    @trn = trains[gets.to_i - 1]
  end

  def add_route_to_train
    select_train
    show_routes
    puts 'Выберете номер маршрута'
    route = routes[gets.to_i - 1]
    @trn.take_route(route)
    puts "Поезду добавлен маршрут\n "
  end

  def add_car_to_train
    select_train
    if @trn.type == :cargo
      puts 'Введите объем вагона'
      car = CarriageCargo.new(gets.to_i)
    elsif @trn.type == :passenger
      puts 'Введите количество посадочных мест в вагоне'
      car = CarriagePassenger.new(gets.to_i)
    end
    @trn.add_car(car)
    puts "Вагон добавлен к поезду\n "
  end

  def delete_car_from_train
    select_train
    @trn.remove_car(-1)
    puts "Вагон отцеплен\n "
  end

  def take_space_in_car
    show_carriages
    puts 'Выберете номер вагона'
    car = @trn.carriages[gets.to_i - 1]
    case car.type
    when :passenger
      car.take_space
      puts 'Пассажир добавлен'
    when :cargo
      puts 'Сколько займет груз?'
      inp = gets.to_i
      if car.space_free > inp
        car.take_space(inp)
        puts "Груз объемом #{inp} загружен в вагон."
      else
        print 'Нет столько места'
      end
    end
  end

  def show_trains
    if trains.any?
      trains.each.with_index(1) do |train, index|
        print "#{index}: #{train.number}(#{train.type}); "
      end
    else
      puts "Нет созданных поездов\n "
      train_menu
    end
  end

  def show_carriages
    select_train
    @trn.each_car do |car, index|
      puts "Номер вагона: #{index}, тип вагона: #{car.type}, свободно: #{car.space_free}, занято: #{car.space_occupied}"
    end
  end

  def move_train_forward
    select_train
    if @trn.station
      @trn.move_forward
      puts "Поезд перемещен вперед\n "
    else
      puts "Назначьте поезду маршрут\n "
    end
  end

  def move_train_back
    select_train
    if @trn.station
      @trn.move_back
      puts "Поезд перемещен назад\n "
    else
      puts "Назначьте поезду маршрут\n "
    end
  end

  def create_route
    if stations.size < 2
      puts 'В маршруте должно быть минимум две станции, создайте их'
      return
    end

    puts 'Есть следующие станции:'
    stations.each.with_index(1) { |station, index| puts "#{index}: #{station.name}" }
    puts 'Введите номер начальной станции'
    start = gets.chomp.to_i - 1
    puts 'Введите номер конечной станции'
    finish = gets.chomp.to_i - 1
    routes << Route.new(stations[start], stations[finish])
  end

  def show_routes
    if routes.any?
      routes.each.with_index(1) do |route, index|
        puts "#{index}: #{route.stations[0].name}-#{route.stations[-1].name}"
      end
    else
      puts "Маршрутов не создано\n "
      menu
    end
  end

  def select_station
    show_stations
    puts 'Выберете номер станции'
    @stn = stations[gets.to_i - 1]
  end

  def add_station_to_route
    show_routes
    puts 'Выберете номер маршрута'
    route = routes[gets.to_i - 1]
    select_station
    route.add_station(@stn)
    puts "Станция добавлена в маршрут\n "
  end

  def delete_station_from_route
    show_routes
    puts 'Выберете номер маршрута'
    route = routes[gets.to_i - 1]
    show_stations_on_route
    puts 'Выберете номер станции'
    @stn = route.stations[gets.to_i - 1]
    route.del_station(@stn)
    puts "Станция удалена из маршрута\n "
  end

  def create_station
    puts 'Введите название станции'
    stations << Station.new(gets.chomp)
    puts "Станция создана\n "
  end

  def show_stations
    if stations.any?
      stations.each.with_index(1) do |station, index|
        puts "#{index}: #{station.name}"
      end
    else
      puts "Станций не создано\n "
      menu
    end
  end

  def show_stations_on_route
    show_routes
    puts 'Выберете номер маршрута'
    route = routes[gets.to_i - 1]
    if route.stations.any?
      route.stations.each.with_index(1) do |station, index|
        puts "#{index}: #{station.name}"
      end
    else
      puts "Станций на маршруте не создано\n "
    end
  end

  def show_trains_on_station
    select_station
    @stn.each_train do |trn|
      puts "Номер поезда #{trn.number}, тип поезда #{trn.type}, количество вагонов #{trn.carriages.count}"
    end
  end
end
