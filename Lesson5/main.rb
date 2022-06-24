
require_relative 'wagon.rb'
require_relative 'rail.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_wagon.rb'
require_relative 'passenger_wagon.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'modules/firmname.rb'
require_relative 'modules/instance_counter.rb'

railroad = Rail.new
railroad.menu


while true
  input = gets.chomp.to_i
  case input
  when 1
    railroad.create_station
  when 2
   railroad.create_passenger_train
  when 3
   railroad.create_cargo_train
  when 4
   railroad.create_route
  when 5
   railroad.add_station_to_route
  when 6
   railroad.delete_station_from_route
  when 7
   railroad.train_add_route
  when 8
   railroad.train_add_wagon
  when 9
   railroad.train_delete_wagon
  when 10
   railroad.train_move_next
  when 11
   railroad.train_move_back
  when 12
   railroad.show_stations
  when 13
   railroad.show_trains
  when 14
   railroad.show_routes 
  when 15
   railroad.menu  
  when 16
   break   
  end
end

