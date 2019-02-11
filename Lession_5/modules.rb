module Manufacturer_company
  attr_accessor :manufacturer_company
end

module InstanceCounter
  @@count = 0

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @@count
    end
  end

  module InstanceMethods
    def register_instance
      @@count += 1
    end
  end
end
