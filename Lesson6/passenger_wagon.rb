
class PassengerWagon < Wagon

  def initialize(number)
    @number = number
    @type = "Passenger"
    validate!
  end

end

