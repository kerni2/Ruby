# Класс PassengerTrain:
class PassengerTrain < Train

  def initialize(number)
    @number = number
    @type = "Passenger"
    @wagons = []
    register_instance
  end


end

