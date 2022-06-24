

class Rail

  attr_accessor :rail_stations, :rail_trains, :rail_routes
  def initialize
    @rail_stations = []
    @rail_trains = []
    @rail_routes = []
  end

#- Создавать станции
  def create_station
    puts "Введите название станции:"
    station_name = gets.chomp.to_s
      if Station.new(station_name).valid?
        @rail_stations << Station.new(station_name)
        puts "Создана станция с названием: #{station_name}"
      else
        Station.new(station_name).validate!
      end
  end

#- Создавать поезда
  def create_passenger_train
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if PassengerTrain.new(train_number).valid?
        @rail_trains << PassengerTrain.new(train_number)
        puts "Создан пассажирский поезд с номером: #{train_number}"
      else
        PassengerTrain.new(train_number).validate!
      end
  end

  def create_cargo_train
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if CargoTrain.new(train_number).valid?
        @rail_trains << CargoTrain.new(train_number)
        puts "Создан грузовой поезд с номером: #{train_number}"
      else
        CargoTrain.new(train_number).validate!
      end
  end

#- Добавлять вагоны к поезду
  def train_add_wagon
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if need_train(train_number) == nil
        puts "Нет поезда с таким номером"
      elsif need_train(train_number).type == "Passenger"
        puts "Введите номер пассажирского вагона:"
        wagon_number = gets.chomp.to_s
        puts "Введите количество мест пассажирского вагона:"
        wagon_seats = gets.chomp.to_i
        new_wagon = PassengerWagon.new(wagon_number, wagon_seats)
          if new_wagon.valid? || wagon_seats.to_i > 0
            need_train(train_number).wagons << new_wagon
            puts "Добавлен пассажирский вагон с номером: #{wagon_number} и количеством мест: #{wagon_seats}"
          else
            new_wagon.validate!
          end
      else need_train(train_number).type == "Cargo"
        puts "Введите номер грузового вагона:"
        wagon_number = gets.chomp.to_s
        puts "Введите общий объем грузового вагона:"
        wagon_volume = gets.chomp.to_i
        new_wagon = CargoWagon.new(wagon_number, wagon_volume)
          if new_wagon.valid? || wagon_volume.to_i > 0
            need_train(train_number).wagons << new_wagon
            puts "Добавлен грузовой вагон с номером: #{wagon_number} и общим объемом: #{wagon_volume}"
          else
            new_wagon.validate!
          end
      end
  end

#- Отцеплять вагоны от поезда
  def train_delete_wagon
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if need_train(train_number) == nil
        puts "Нет поезда с таким номером"
      elsif need_train(train_number).type == "Passenger"
        need_train(train_number).wagons.pop
        puts "Пассажирский вагон отцеплен"
      else need_train(train_number).type == "Cargo"
        need_train(train_number).wagons.pop
        puts "Грузовой вагон отцеплен"
      end
  end

  def need_train(number)
    rail_train = rail_trains.filter { |x| x.number == number }.first
  end

#- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  def create_route
    puts "Введите название начальной станции:"
    start = gets.chomp.to_s
    puts "Введите название конечной станции:"
    stop = gets.chomp.to_s
    puts "Введите номер маршрута:"
    number = gets.chomp.to_s
      if Route.new(start, stop, number).valid?
      @rail_routes << Route.new(start, stop, number)
        puts "Создан маршрут с номером: #{number} от станции: #{start} до станции: #{stop}"
      else
        Route.new(start, stop, number).validate!
      end
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
        puts "Поезду #{train_number} назначен маршрут #{route_number}"
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

  def show_wagon_train
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if need_train(train_number) == nil
        puts "Нет поезда с таким номером"
      elsif need_train(train_number).type == "Passenger"
        puts "Пассажирский поезд с вагонами:"
        need_train(train_number).train_passenger_block
      else need_train(train_number).type == "Cargo"
        puts "Грузовой поезд с вагонами:"
        need_train(train_number).train_cargo_block
      end
  end

  def show_station_train
    puts "Введите название станции:"
    station_enter = gets.chomp.to_s
      if need_station(station_enter) == nil
        puts "Нет такой станции"
      else
        puts "Поезда на станции #{station_enter}:"
        need_station(station_enter).station_block
      end
  end

  def need_station(station)
    rail_station = rail_stations.filter { |x| x.station_name == station }.first
  end

  def add_train_station
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
    puts "Введите название станции:"
    station_enter = gets.chomp.to_s
    train = need_train(train_number)
    station = need_station(station_enter)
      if train == nil
        puts "Нет поезда с таким номером"
      elsif station == nil
        puts "Нет такой станции"
      else
        station.train_on_station << train
        puts "Станции #{station_enter} назначен поезд #{train_number}"
      end
  end

  def fill_wagon
    puts "Введите номер поезда:"
    train_number = gets.chomp.to_s
      if need_train(train_number) == nil
        puts "Нет поезда с таким номером"
      elsif need_train(train_number).type == "Passenger"
        puts "Введите номер пассажирского вагона:"
        wagon_number = gets.chomp.to_s
        rail_passenger_wagon = need_train(train_number).wagons.filter { |x| x.number == wagon_number }.first
          if rail_passenger_wagon == nil
            puts "Нет такого пассажирского вагона"
          else
            rail_passenger_wagon.take_volume
            puts "Пассажирский вагон #{wagon_number} увеличил количество занятых мест"
          end
      else need_train(train_number).type == "Cargo"
        puts "Введите номер грузового вагона:"
        wagon_number = gets.chomp.to_s
        rail_cargo_wagon = need_train(train_number).wagons.filter { |x| x.number == wagon_number }.first
          if rail_cargo_wagon == nil
            puts "Нет такого грузового вагона"
          else
            puts "Введите на какое значение занять объем:"
            need_volume = gets.chomp.to_i
            rail_cargo_wagon.take_volume(need_volume)
            puts "Грузовой вагон #{wagon_number} увеличил занятый объем на #{need_volume}"
          end
      end
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
    puts "13. Просмотреть список поездов, их тип и станции нахождения"
    puts "14. Просмотреть маршруты"
    puts "15. Просмотреть список вагонов у поезда"
    puts "16. Просмотреть список поездов на станции"
    puts "17. Добавить поезд на станцию"
    puts "18. Занять объем/место в грузовом/пассажирском вагоне"
    puts "19. Меню"
    puts "20. Выход"
  end

end



