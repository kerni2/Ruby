module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances
    end

    def append_instance
      if @instances == nil
        @instances = 0
      end
      @instances += 1
    end

  end

  module InstanceMethods

    protected

    def register_instance
      self.class.append_instance
    end
  end
end