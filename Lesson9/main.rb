# frozen_string_literal: true

require_relative 'wagon'
require_relative 'rail'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'station'
require_relative 'route'
require_relative 'modules/firmname'
require_relative 'modules/instance_counter'
require_relative 'modules/validation'
require_relative 'modules/accessors'

railroad = Rail.new
railroad.menu

loop do
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
    railroad.show_wagon_train
  when 16
    railroad.show_station_train
  when 17
    railroad.add_train_station
  when 18
    railroad.fill_wagon
  when 19
    railroad.menu
  when 20
    break
  end
    rescue StandardError => e
    puts "#{e.message}, возврат в главное меню."
end
