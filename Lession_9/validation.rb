module Validate
  def self.included(base)
    base.extend ClassMethods
  end

  def validate!
    self.class.presence_method(@validation)
    self.class.format_method(@validation, @regx)
    self.class.type_method(@validation, @type_valid)
  end

  def valid?
    self.class.validate!
    true
  rescue StandardError
    false
  end

  module ClassMethods
    def validate(name_valid, type_valid, *option)
      validate_choise(name_valid, type_valid, *option)
    rescue StandardError => error
      puts "Ошибка: #{error.message}"
    end

    def validate_choise(name_valid, type_valid, *option)
      case type_valid.to_sym
      when :presence
        presence_method(name_valid)
      when :format
        format_method(name_valid, option)
      when :type
        type_method(name_valid, option)
      else
        raise 'Неправильный ввод, такого метода нет'
      end
    end

    def presence_method(name_valid)
      @validation = name_valid
      raise 'Значение не должно быть пустым' if name_valid.to_s.empty?
    end

    def format_method(name, option = /^[a-zа-я0-9-]+$/i)
      @regx ||= option
      raise 'Значение неверного формата' unless name =~ option
    end

    def type_method(name, type)
      @type_valid = type
      raise 'Значение неверного типа' unless name.class == type
    end
  end
end
