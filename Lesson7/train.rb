require_relative 'modules/firmname.rb'
require_relative 'modules/instance_counter.rb'
require_relative 'modules/valid.rb'
# Класс Train (Поезд):
class Train
  include FirmName
  include InstanceCounter
  include Valid

  attr_accessor :number, :type, :route, :wagons, :station_now, :index_station_now
  NUMBER_FORMAT = /^([а-я]|\d){3}\-?([а-я]|\d){2}$/i
  @@train_instances = []

  def initialize(number, type, wagons)
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

# Может возвращать текущую скорость

  def train_speed
    puts @speed
  end

# Может возвращать количество вагонов
  def number_of_wagon
    puts "Количество вагонов: #{wagons}"
  end

# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  def add_route(route_name)
    @route = route_name.route_train
    @current_station = @route[0]
    @index_station = 0
  end
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def move_next
    @index_station += 1
    @curr_station = @route[@index_station]
  end

  def move_before
    @index_station -= 1
    @current_station = @route[@index_station]
  end
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def station_before
    @route[@index_station-1]
  end

  def station_next
    @route[@index_station+1]
  end

  def train_passenger_block
    @wagons.each(&train_passenger_proc)
  end

  def train_passenger_proc
    proc { |x| puts "номер вагона: #{x.number}, тип вагона: #{x.type}, занято мест: #{x.show_busy_volume}, свободно мест: #{x.free_volume}" }
  end

  def train_cargo_block
    @wagons.each(&train_cargo_proc)
  end

  def train_cargo_proc
    proc { |x| puts "номер вагона: #{x.number}, тип вагона: #{x.type}, занятый объем: #{x.show_busy_volume}, свободный объем: #{x.free_volume}" }
  end

protected

# Управлять своей скоростью может только экземпляр класса Поезд
# Может тормозить (сбрасывать скорость до нуля)
  def train_stop
    @speed = 0
  end

# Может набирать скорость
  def train_go(set)
    @speed = set
  end

  def validate!
    errors = []
    errors << "Номер не может быть пустым" if number.nil?
    errors << "Номер должен содержать не менее 5 русских букв или цифр" if number.length < 5
    errors << "Неверный формат номера" if number !~ NUMBER_FORMAT
    raise errors.join('.') unless errors.empty?
  end

end

