require_relative 'modules/firmname.rb'
require_relative 'modules/valid.rb'

class Wagon
  include FirmName
  include Valid
  attr_accessor :number

  WAGON_FORMAT = /^\d+$/

  def initialize(number)
    @number = number
    @type = []
    validate!
  end


protected

  def validate!
    errors = []
    errors << "Номер не может быть пустым" if number.nil? || number.to_s.length < 1 
    errors << "Неверный формат номера" if number !~ WAGON_FORMAT
    raise puts errors.join('. ') unless errors.empty?
  end

end

