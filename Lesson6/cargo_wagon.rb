
class CargoWagon < Wagon

  def initialize(number)
    @number = number
    @type = "Cargo"
    validate!
  end

end

