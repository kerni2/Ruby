# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethod
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, type, other_parameter = nil)
      value = { name: name, type: type, other_parameter: other_parameter }
      instance_variable_set(:@validations, (@validations || []).push(value))
    end

    def inherited(instance)
      instance.instance_variable_set(:@validations, @validations)
    end
  end

  module InstanceMethod
    def validate!
      self.class.validations.each { |validate| start_validation(validate) }
    end

    def start_validation(check)
      name = instance_variable_get("@#{check[:name]}".to_sym)
      raise "#{check[:name]} not correct" if check[:type] == :presence && (name.nil? || name.to_s.empty?)
      raise "#{check[:name]} not valid format" if check[:type] == :format && name !~ check[:other_parameter]
      raise "#{check[:name]} not valid class" if check[:type] == :type && !name.instance_of?(check[:other_parameter])

      true
    end

    def validate?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
