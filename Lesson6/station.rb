#require_relative 'modules/instance_counter.rb'
# Класс Station (Станция):
class Station
  include InstanceCounter
  include Valid

  attr_accessor :train_list, :station_name
  NAME_FORMAT = /^[а-я]+$/i
  @@station_instances = []
# Имеет название, которое указывается при ее создании
  def initialize(station_name)
    @station_name = station_name
    validate!
    @@station_instances << self
    @train_list = {}
    register_instance
  end
# Может принимать поезда (по одному за раз)
  def get_train(train_name)
    @train_list[train_name.number] = train_name.type
  end
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
  def get_list
    @train_list.each { |x, y| puts x }
  end
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def train_by_type(need_type)
    @train_list.each { |x, y| puts x if y == need_type }
  end
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def train_go(train_name)
    @train_list.delete(train_name.number)
  end

  def show_station_instances
    @@station_instances.each { |x| puts x }
  end

  def self.all
    @@station_instances.each { |x| puts x }
  end


protected

  def validate!
    errors = []
    errors << "Название станции не может быть пустым" if station_name.nil?
    errors << "Название станции должно содержать не менее 2 русских букв" if station_name.length < 2
    errors << "Неверное название станции" if station_name !~ NAME_FORMAT
    raise puts errors.join('. ') unless errors.empty?
  end

end
