# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/valid'

class Station
  include InstanceCounter
  include Valid

  attr_accessor :train_list, :station_name, :train_on_station

  NAME_FORMAT = /^[а-я]+$/i.freeze
  @@station_instances = []

  def initialize(station_name)
    @station_name = station_name
    validate!
    @@station_instances << self
    @train_list = {}
    @train_on_station = []
    register_instance
  end

  def get_train(train_name)
    @train_list[train_name.number] = train_name.type
  end

  def show_list
    @train_list.each { |x, _y| puts x }
  end

  def train_by_type(need_type)
    @train_list.each { |x, y| puts x if y == need_type }
  end

  def train_go(train_name)
    @train_list.delete(train_name.number)
  end

  def show_station_instances
    @@station_instances.each { |x| puts x }
  end

  def self.all
    @@station_instances.each { |x| puts x }
  end

  def station_block
    @train_on_station.each(&station_proc)
  end

  def station_proc
    proc { |x| puts "номер: #{x.number}, тип: #{x.type}, количество вагонов: #{x.wagons.length}" }
  end

  protected

  def validate!
    errors = []
    errors << 'Название станции не может быть пустым' if station_name.nil?
    errors << 'Название станции должно иметь больше букв' if station_name.length < 2
    errors << 'Неверное название станции' if station_name !~ NAME_FORMAT
    raise errors.join('.') unless errors.empty?
  end
end
