class Menu
  attr_accessor :stations, :routes, :trains

  OPNS = { '1' => :train_menu, '2' => :station_menu,
           '3' => :route_menu, '4' => :carriage_menu }.freeze

  def initialize(options = {})
    @stations = options[:stations] || []
    @trains = options[:trains] || []
    @routes = options[:routes] || []
  end

  def opts
    @opts = { stations: @stations, trains: @trains, routes: @routes }
  end

  def menu
    puts 'С чем хотите работать?'
    puts '1.Поезда'
    puts '2.Станции'
    puts '3.Маршруты'
    puts '4.Вагоны'
    puts '0.Выход'
  end

  def start
    loop do
      menu
      inp = gets.chomp
      break if inp == '0'

      choise_menu(inp)
    end
  end

  def choise_menu(inp)
    func = self.class::OPNS[inp] || wrong_choice
    send(func)
  end

  def train_menu
    opts
    @train_menu ||= MenuTrain.new(@opts)
    @train_menu.start
  end

  def station_menu
    opts
    @station_menu ||= MenuStation.new(@opts)
    @station_menu.start
  end

  def route_menu
    opts
    @route_menu ||= MenuRoute.new(@opts)
    @route_menu.start
  end

  def carriage_menu
    opts
    @carriage_menu ||= MenuCarriage.new(@opts)
    @carriage_menu.start
  end

  def wrong_choice
    puts 'Неверный выбор'
  end

  def no_stations
    puts "Станций не создано\n "
  end

  def select_train
    show_trains
    puts 'Выберете номер поезда'
    @trn = trains[gets.to_i - 1]
  end

  def show_stations
    if @stations.any?
      @stations.each.with_index(1) do |station, index|
        puts "#{index}: #{station.name}"
      end
    else
      no_stations
    end
  end
end
