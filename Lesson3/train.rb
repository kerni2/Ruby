# Класс Train (Поезд):
class Train
  attr_accessor :number, :type, :route 
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, 
# эти данные указываются при создании экземпляра класса
  def initialize(number, type, number_of_wagons)
    @number = number
    @type = type
    @number_of_wagons = number_of_wagons

  end
# Может набирать скорость
  def train_go(sp)
    @speed = sp
  end

# Может возвращать текущую скорость
  def train_speed
    puts @speed
  end
# Может тормозить (сбрасывать скорость до нуля)
  def train_stop
    @speed = 0
  end
# Может возвращать количество вагонов
  def number_of_vagon
    puts "Количество вагонов: #{number_of_wagons}"
  end  

# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def add_vagon
    if @speed == 0
      @number_of_wagons += 1
    else
      puts "Сначала остановите поезд"
    end
  end

  def remove_vagon
    if @speed == 0
      @number_of_wagons -= 1
    else
      puts "Сначала остановите поезд"
    end
  end

# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  def add_route(route_name)
    @route = route_name.route_train
    @curr_station = @route[0]
    @index_station = 0
  end
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def move_next
    @index_station += 1
    @curr_station = @route[@index_station]
  end

  def move_before
    @index_station -= 1
    @curr_station = @route[@index_station]
  end  
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def station_before
    @route[@index_station-1]
  end

  def station_next
    @route[@index_station+1]
  end

  def station_now
    @curr_station
  end


end

