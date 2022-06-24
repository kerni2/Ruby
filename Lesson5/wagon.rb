#require_relative 'modules/firmname.rb'

class Wagon
  include FirmName

  def initialize(number)
    @number = number
    @type = []
  end

end

