# frozen_string_literal: true

class CargoWagon < Wagon
  attr_accessor :type

  def initialize(number, capacity)
    super
    @type = 'Cargo'
    validate!
  end

  def take_volume(amount)
    raise puts 'Нет достаточного свободного объема' if @capacity < @busy_volume + amount

    @busy_volume += amount
  end
end
