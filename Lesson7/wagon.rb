require_relative 'modules/firmname.rb'
require_relative 'modules/valid.rb'

class Wagon
  include FirmName
  include Valid
  attr_accessor :number, :capacity, :busy_volume

  WAGON_FORMAT = /^\d+$/

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @busy_volume = 0
    @type = []
    validate!
  end

  def type
    @type
  end

  def show_busy_volume
    @busy_volume
  end

  def free_volume
    @capacity.to_i - @busy_volume.to_i
  end

protected

  def validate!
    errors = []
    errors << "Номер не может быть пустым" if number.nil? || number.to_s.length < 1
    errors << "Неверный формат номера" if number !~ WAGON_FORMAT
    raise errors.join('.') unless errors.empty?
  end

end

