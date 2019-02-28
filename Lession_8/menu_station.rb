class MenuStation < Menu
  OPNS = { '1' => :create_station, '2' => :show_stations,
           '3' => :show_trains_on_station, '0' => :menu }.freeze

  def menu
    puts 'Станции. Что хотите сделать?'
    puts '1.Создать станцию'
    puts '2.Список всех станций'
    puts '3.Cписок поездов на станции'
    puts '0.Вернуться в предыдущее меню'
  end

  def select_station
    show_stations
    puts 'Выберете номер станции'
    @stn = stations[gets.to_i - 1]
  end

  def create_station
    puts 'Введите название станции'
    stations << Station.new(gets.chomp)
    puts "Станция создана\n "
  end

  def show_trains_on_station
    select_station
    @stn.each_train do |trn|
      puts "Номер поезда #{trn.number}, тип поезда #{trn.type},\
       количество вагонов #{trn.carriages.count}"
    end
  end
end
