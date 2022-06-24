

class Rail

  attr_accessor :rail_stations, :rail_trains, :rail_routes #:station_name
  def initialize
    @rail_stations = []
    @rail_trains = []
    @rail_routes = []
  end

#- Создавать станции
  def create_station
    puts "Введите название станции:"
    station_name = gets.chomp.to_s
      if station_name == nil
        puts "Неверный ввод"
      else
        @rail_stations << Station.new(station_name)
        puts "Done"
      end

  end

#- Создавать поезда
  def create_passenger_train
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
    @rail_trains << PassengerTrain.new(train_number)
    puts "Done"
  end  

  def create_cargo_train
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
    @rail_trains << CargoTrain.new(train_number)
    puts "Done"
  end  

#- Добавлять вагоны к поезду
  def train_add_wagon
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if need_train(train_number) == nil
        puts "Нет поезда с таким номером"
      elsif need_train(train_number).type == "Passenger"
        puts "Введите номер пассажирского вагона:"
        need_train(train_number).wagons << PassengerWagon.new(gets.chomp.to_s)
        puts "Done"
      else need_train(train_number).type == "Cargo"
        puts "Введите номер грузового вагона:"
        need_train(train_number).wagons << CargoWagon.new(gets.chomp.to_s)
        puts "Done"
      end
  end

#- Отцеплять вагоны от поезда
  def train_delete_wagon
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if need_train(train_number) == nil
        puts "Нет поезда с таким номером"
      elsif need_train(train_number).type == "Passenger"
        puts "Введите номер пассажирского вагона:"
        need_train(train_number).wagons.pop
        puts "Done"
      else need_train(train_number).type == "Cargo"
        puts "Введите номер грузового вагона:"
        need_train(train_number).wagons.pop
        puts "Done"
      end
  end

  def need_train(number)
    rail_train = rail_trains.filter { |x| x.number == number }.first
  end

#- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  def create_route
    puts "Введите название начальной станции:"
    start = gets.chomp.to_s
    puts "Введите название начальной станции:"
    stop = gets.chomp.to_s  
    puts "Введите номер маршрута:"
    number = gets.chomp.to_s      
    @rail_routes << Route.new(start, stop, number)      
    puts "Done"
  end

  def add_station_to_route
    puts "Введите название станции:"
    station = gets.chomp.to_s
    puts "Введите номер маршрута:"
    route_number = gets.chomp.to_s
      if need_route(route_number) == nil
        puts "Нет маршрута с таким номером"
      else 
        need_route(route_number).route_station.insert(-2, station)
        puts "Done"
      end
  end

  def delete_station_from_route
    puts "Введите название станции:"
    station = gets.chomp.to_s
    puts "Введите номер маршрута:"
    route_number = gets.chomp.to_s
      if need_route(route_number) == nil
        puts "Нет маршрута с таким номером"
      elsif need_route(route_number).start_station == station || need_route(route_number).end_station == station 
        puts "Нельзя удалить начальную и конечную станции"
      elsif need_route(route_number).start_station == nil
        puts "Нет такой станции"
      else 
        need_route(route_number).route_station.delete(station)
        puts "Done"
      end
  end

  def need_route(number)
    route = rail_routes.filter { |x| x.number == number }.first
  end


#- Назначать маршрут поезду
  def train_add_route
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
    puts "Введите номер маршрута:"
    route_number = gets.chomp.to_s 
    train = need_train(train_number)      
      if train == nil
        puts "Нет поезда с таким номером"
      elsif need_route(route_number) == nil
        puts "Нет маршрута с таким номером"
      else 
        train.route = need_route(route_number).route_station
        train.station_now = train.route.first
        train.index_station_now = 0
        puts "Done"
      end
  end  

#- Перемещать поезд по маршруту вперед
  def train_move_next
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
    train = need_train(train_number)
      if train == nil
        puts "Нет поезда с таким номером"
      elsif train.route == nil
        puts "Нет маршрута у поезда"
      elsif train.route.last == train.station_now
        puts "Конец маршрута"
      else 
        train.index_station_now += 1
        train.station_now = train.route[train.index_station_now]
        puts "Done"
      end
  end  

#- Перемещать поезд по маршруту назад
  def train_move_back
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
    train = need_train(train_number)
      if train == nil
        puts "Нет поезда с таким номером"
      elsif train.route == nil
        puts "Нет маршрута у поезда"
      elsif train.route.first == train.station_now
        puts "Начало маршрута"
      else 
        train.index_station_now -= 1
        train.station_now = train.route[train.index_station_now]
        puts "Done"
      end
  end  

#- Просматривать список станций и список поездов на станции

  def show_stations
    puts "Станции: "
    rail_stations.each { |x| puts "#{x.station_name}" }
  end

  def show_trains
    puts "Поезда: "    
    rail_trains.each { |x| puts "Номер: #{x.number} Тип: #{x.type} Станция: #{x.station_now} Маршрут: #{x.route}" }
  end

  def show_routes
    puts "Маршруты: "
    rail_routes.each { |x| puts "Номер: #{x.number}  Станции: #{x.route_station}" }
  end

  def menu
    puts "1. Создать станцию"
    puts "2. Создать пассажирский поезд"
    puts "3. Создать грузовой поезд"    
    puts "4. Создать маршрут"
    puts "5. Добавить станцию в маршрут"
    puts "6. Удалить станцию из маршрута"
    puts "7. Назначить маршрут поезду "
    puts "8. Добавить вагон к поезду"
    puts "9. Отцепить вагон от поезда"
    puts "10. Переместить поезд по маршруту вперед"
    puts "11. Переместить поезд по маршруту назад"
    puts "12. Просмотреть список станций"
    puts "13. Просмотреть список поездов, их типа и станции нахождения"
    puts "14. Просмотреть маршруты"    
    puts "15. Меню"
    puts "16. Выход" 
  end

end



