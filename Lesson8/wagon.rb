# frozen_string_literal: true

require_relative 'modules/firmname'
require_relative 'modules/valid'

class Wagon
  include FirmName
  include Valid
  attr_accessor :number, :capacity, :busy_volume

  WAGON_FORMAT = /^\d+$/.freeze

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @busy_volume = 0
    @type = []
    validate!
  end

  attr_reader :type

  def show_busy_volume
    @busy_volume
  end

  def free_volume
    @capacity.to_i - @busy_volume.to_i
  end

  protected

  def validate!
    errors = []
    errors << 'Номер не может быть пустым' if number.nil? || number.to_s.empty?
    errors << 'Неверный формат номера' if number !~ WAGON_FORMAT
    raise errors.join('.') unless errors.empty?
  end
end
