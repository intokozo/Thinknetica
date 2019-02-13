module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

    def instances
      @instances ||= 0
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.instances += 1 #.count вместо обращения к переменной, запускался
    end                         # метод, возвращающий nil, у которого нет метода '+'
  end
end
