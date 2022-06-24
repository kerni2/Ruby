# Класс Station (Станция):
class Station
  attr_accessor :train_list, :station_name
# Имеет название, которое указывается при ее создании
  def initialize(station_name)
    @station_name = station_name
    @train_list = {}
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

end
