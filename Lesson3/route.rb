# Класс Route (Маршрут):

class Route
# Имеет начальную и конечную станцию, а также список промежуточных станций. 
# Начальная и конечная станции указываются при создании маршрута, 
# а промежуточные могут добавляться между ними.

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @route_station = [start_station, end_station]  
  end  

# Может добавлять промежуточную станцию в список

  def add_station(station_name)
    @route_station.pop
    @route_station << station_name
    @route_station << @end_station
  end

# Может удалять промежуточную станцию из списка

  def delete_station(station_name)
    @route_station.delete(station_name)
  end

# Может выводить список всех станций по-порядку от начальной до конечной

  def show_station
    puts "Текущий маршрут:"
    @route_station.each { |x| puts x }
  end

  def route_train
    @route_station
  end

end
