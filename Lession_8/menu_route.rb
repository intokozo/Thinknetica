class MenuRoute < Menu
  OPNS = { '1' => :create_route, '2' => :add_station_to_route,
           '3' => :del_stn_to_route, '4' => :add_route_to_train,
           '5' => :show_routes_menu, '0' => :back }.freeze

  def menu
    puts 'Маршруты. Что хотите сделать?'
    puts '1.Создать маршрут'
    puts '2.Добавить станцию в маршрут'
    puts '3.Удалить станцию из маршрута'
    puts '4.Добавить поезд на маршрут'
    puts '5.Список маршрутов'
    puts '0.Вернуться в предыдущее меню'
  end

  def count_stations
    puts 'В маршруте должно быть минимум две станции' if @stations.size < 2
  end

  def add_route
    s = choice_start_route
    f = choice_finish_route
    routes << Route.new(stations[s], stations[f])
  end

  def choice_start_route
    puts 'Введите номер начальной станции'
    gets.chomp.to_i - 1
  end

  def choice_finish_route
    puts 'Введите номер конечной станции'
    gets.chomp.to_i - 1
  end

  def create_route
    count_stations
    puts 'Есть следующие станции:'
    show_stations
    add_route
  end

  def add_station_to_route
    show_routes
    puts 'Выберете номер маршрута'
    route = routes[gets.to_i - 1]
    select_station
    route.add_station(@stn)
    puts "Станция добавлена в маршрут\n "
  end

  def del_stn_to_route
    show_routes
    route = choise_num_route
    show_stations_on_route
    puts 'Выберете номер станции'
    @stn = route.stations[gets.to_i - 1]
    route.del_station(@stn)
    puts "Станция удалена из маршрута\n "
  end

  def choise_num_route
    puts 'Выберете номер маршрута'
    routes[gets.to_i - 1]
  end

  def add_route_to_train
    select_train
    show_routes
    puts 'Выберете номер маршрута'
    route = routes[gets.to_i - 1]
    @trn.take_route(route)
    puts "Поезду добавлен маршрут\n "
  end

  def show_routes_menu
    show_routes
  end

  def show_routes
    if routes.any?
      routes.each.with_index(1) do |route, index|
        puts "#{index}: #{route.stations[0].name}-#{route.stations[-1].name}"
      end
    else
      puts "Маршрутов не создано\n "
    end
  end

  def show_stations_on_route
    show_routes
    puts 'Выберете номер маршрута'
    route = routes[gets.to_i - 1]
    route.stations.any? ? stations_route(route) : no_stations
  end

  def stations_route(route)
    route.stations.each.with_index(1) do |station, index|
      puts "#{index}: #{station.name}"
    end
  end
end
