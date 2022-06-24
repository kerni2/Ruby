# frozen_string_literal: true

class PassengerTrain < Train
  attr_accessor :number, :type, :wagons

  def initialize(number)
    @number = number
    @type = 'Passenger'
    @wagons = []
    validate!
    register_instance
  end
end
