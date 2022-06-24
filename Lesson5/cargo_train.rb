# Класс CargoTrain:
class CargoTrain < Train

  def initialize(number)
    @number = number
    @type = "Cargo"
    @wagons = []
    register_instance
  end


end

