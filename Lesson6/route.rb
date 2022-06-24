# Класс Route (Маршрут):

class Route
  include InstanceCounter
  include Valid

  attr_accessor :number, :route_station, :end_station, :start_station
# Имеет начальную и конечную станцию, а также список промежуточных станций. 
# Начальная и конечная станции указываются при создании маршрута, 
# а промежуточные могут добавляться между ними.
  NAME_FORMAT = /^[а-я]+$/i

  def initialize(start_station, end_station, number)
    @number = number
    @start_station = start_station
    @end_station = end_station
    @route_station = [start_station, end_station] 
    validate! 
    register_instance
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


protected

  def validate!
    errors = []
    errors << "Название станции не может быть пустым" if start_station.nil? || end_station.nil?
    errors << "Название станции должно содержать не менее 2 русских букв" if start_station.length < 2 || end_station.length < 2
    errors << "Название начальной и конечной станции не может повторяться" if start_station == end_station
    errors << "Неверное название станции" if start_station !~ NAME_FORMAT || end_station !~ NAME_FORMAT
    errors << "Номер не может быть пустым" if number.nil? || number.length < 1     
    raise puts errors.join('. ') unless errors.empty?
  end

end


