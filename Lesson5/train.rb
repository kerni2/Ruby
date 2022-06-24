#require_relative 'modules/firmname.rb'
#require_relative 'modules/instance_counter.rb'
# Класс Train (Поезд):
class Train
  include FirmName
  include InstanceCounter

  attr_accessor :number, :type, :route, :wagons, :station_now, :index_station_now

  @@train_instances = []

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = []
    @route = []
    @station_now = station_now
    @index_station_now = index_station_now
    @@train_instances << self
    register_instance
  end

  def self.find(need_name)
    find_name = nil
    if @@train_instances.empty?
      return find_name
    else
      @@train_instances.each { |x| find_name = x if x.number == need_name }
      return find_name
    end
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

private

# Управлять своей скоростью может только экземпляр класса Поезд
# Может тормозить (сбрасывать скорость до нуля)
  def train_stop
    @speed = 0
  end

# Может набирать скорость
  def train_go(set)
    @speed = set
  end


end

