require_relative 'instance_counter.rb'
require_relative 'manufacturer_company.rb'
require_relative 'valid.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'
require_relative 'carriage.rb'
require_relative 'carriage_cargo.rb'
require_relative 'carriage_passenger.rb'
require_relative 'menu.rb'
require_relative 'menu_carriage.rb'
require_relative 'menu_route.rb'
require_relative 'menu_station.rb'
require_relative 'menu_train.rb'

menu = Menu.new
menu.start
