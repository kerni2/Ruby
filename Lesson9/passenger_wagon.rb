# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_accessor :type

  def initialize(number, capacity)
    super
    @type = 'Passenger'
    validate!
  end

  def take_volume
    raise puts 'Нет мест' if @busy_volume == @capacity

    @busy_volume += 1
  end
end
