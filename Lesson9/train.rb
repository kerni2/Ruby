# frozen_string_literal: true

require_relative 'modules/firmname'
require_relative 'modules/instance_counter'
require_relative 'modules/validation'
require_relative 'modules/accessors'

class Train
  include FirmName
  include InstanceCounter
  include Validation
  extend Accessors

  attr_accessor :number, :type, :route, :wagons, :station_now, :index_station_now

  NUMBER_FORMAT = /^([а-я]|\d){3}-?([а-я]|\d){2}$/i.freeze
  @@train_instances = []

  attr_accessor_with_history :a1, :a2, :a3
  strong_attr_accessor :a4, String

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number, type, _wagons)
    @number = number
    @type = type
    @wagons = []
    @route = []
    @station_now = station_now
    @index_station_now = index_station_now
    validate!
    @@train_instances << self
    register_instance
  end

  def self.find(need_name)
    @@train_instances.find { |x| x.number == need_name }
  end

  def train_speed
    puts @speed
  end

  def number_of_wagon
    puts "Количество вагонов: #{wagons}"
  end

  def add_route(route_name)
    @route = route_name.route_train
    @current_station = @route[0]
    @index_station = 0
  end

  def move_next
    @index_station += 1
    @curr_station = @route[@index_station]
  end

  def move_before
    @index_station -= 1
    @current_station = @route[@index_station]
  end

  def station_before
    @route[@index_station - 1]
  end

  def station_next
    @route[@index_station + 1]
  end

  def train_passenger_block
    @wagons.each(&train_passenger_proc)
  end

  def train_passenger_proc
    proc { |x| puts "#{x.number} | #{x.type} | #{x.show_busy_volume} | #{x.free_volume}" }
  end

  def train_cargo_block
    @wagons.each(&train_cargo_proc)
  end

  def train_cargo_proc
    proc { |x| puts "#{x.number} | #{x.type} | #{x.show_busy_volume} | #{x.free_volume}" }
  end

  protected

  def train_stop
    @speed = 0
  end

  def train_go(set)
    @speed = set
  end

  def old_validate!
    errors = []
    errors << 'Номер не может быть пустым' if number.nil?
    errors << 'Номер должен содержать не менее 5 русских букв или цифр' if number.length < 5
    errors << 'Неверный формат номера' if number !~ NUMBER_FORMAT
    raise errors.join('.') unless errors.empty?
  end
end
