class MenuTrain < Menu
  OPNS = { '1' => :create_train, '2' => :show_trains,
           '3' => :move_train_forward, '4' => :move_train_back,
           '0' => :menu }.freeze

  def menu
    puts 'Поезда. Что хотите сделать?'
    puts '1.Создать поезд'
    puts '2.Список всех поездов'
    puts '3.Переместить поезд вперед'
    puts '4.Переместить поезд назад'
    puts '0.Вернуться в предыдущее меню'
  end

  def create_train
    puts 'Введите номер поезда'
    number = gets.chomp
    puts "1.Пассажирский\n2.Грузовой"
    type = gets.chomp
    check_type(type)
    type == '1' ? create_pass_train(number) : create_cargo_train(number)
  end

  def check_type(type)
    wrong_choice if type != '1' && type != '2'
  end

  def create_cargo_train(number)
    trains << TrainCargo.new(number)
    puts "Грузовой поезд создан\n "
  end

  def create_pass_train(number)
    trains << TrainPassenger.new(number)
    puts "Пассажирский поезд создан\n "
  end

  def show_trains
    if trains.any?
      trains.each.with_index(1) do |train, index|
        print "#{index}: #{train.number}(#{train.type}); "
      end
    else
      puts "Нет созданных поездов\n "
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
end
