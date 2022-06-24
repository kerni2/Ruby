# Класс CargoTrain:
class CargoTrain < Train

  attr_accessor :number, :type, :wagons

  def initialize(number)
    @number = number
    @type = "Cargo"
    @wagons = []
    validate!
    register_instance
  end


end

