class MenuCarriage < Menu
  OPNS = { '1' => :add_car_to_train, '2' => :delete_car_from_train,
           '3' => :take_space_in_car }.freeze

  def menu
    puts 'Вагоны. Что хотите сделать?'
    puts '1.Создать и прицепить вагон к поезду'
    puts '2.Отцепить вагон от поезда'
    puts '3.Занять место в вагоне'
  end

  def show_carriages
    select_train
    @trn.each_car do |car, index|
      puts "Номер вагона: #{index}, тип вагона: #{car.type},\
            свободно: #{car.space_free}, занято: #{car.space_occupied}"
    end
  end

  def add_car_to_train
    select_train
    @car = @trn.type == :cargo ? add_cargo_car : add_pass_car
    @trn.add_car(car)
    puts "Вагон добавлен к поезду\n "
  end

  def add_cargo_car
    puts 'Введите объем вагона'
    CarriageCargo.new(gets.to_i)
  end

  def add_pass_car
    puts 'Введите количество посадочных мест в вагоне'
    CarriagePassenger.new(gets.to_i)
  end

  def delete_car_from_train
    select_train
    @trn.remove_car(-1)
    puts "Вагон отцеплен\n "
  end

  def take_space_in_car
    show_carriages
    puts 'Выберете номер вагона'
    car = choise_car
    car.type == :passenger ? pass_space(car) : cargo_space(car)
  end

  def choise_car
    puts 'Выберете номер вагона'
    @trn.carriages[gets.to_i - 1]
  end

  def cargo_space(car)
    puts 'Сколько займет груз?'
    inp = gets.to_i
    if car.space_free > inp
      car.take_space(inp)
      puts "Груз объемом #{inp} загружен в вагон."
    else
      print 'Нет столько места'
    end
  end

  def pass_space(car)
    car.take_space
    puts 'Пассажир добавлен'
  end
end
