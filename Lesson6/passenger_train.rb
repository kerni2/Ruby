# Класс PassengerTrain:
class PassengerTrain < Train

  def initialize(number)
    @number = number
    @type = "Passenger"
    @wagons = []
    validate!
    register_instance
  end


end

