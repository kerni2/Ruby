# frozen_string_literal: true

require_relative 'modules/firmname'
require_relative 'modules/validation'
require_relative 'modules/accessors'

class Wagon
  include FirmName
  include Validation
  extend Accessors

  attr_accessor :number, :capacity, :busy_volume

  WAGON_FORMAT = /^\d+$/.freeze

  attr_accessor_with_history :a1, :a2, :a3
  strong_attr_accessor :a4, String

  validate :number, :presence
  validate :number, :format, WAGON_FORMAT

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

  def old_validate!
    errors = []
    errors << 'Номер не может быть пустым' if number.nil? || number.to_s.empty?
    errors << 'Неверный формат номера' if number !~ WAGON_FORMAT
    raise errors.join('.') unless errors.empty?
  end
end
