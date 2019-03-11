module Validate
  def self.included(base)
    base.extend ClassMethods
  end

  def validate!
    self.class.validations.each do |val|
      send(
        "#{val[:type_valid]}_method".to_sym,
        instance_variable_get("@#{val[:name_valid]}"),
        val[:option]
      )
    end
  end

  def valid?
    self.class.validate!
    true
  rescue StandardError
    false
  end

  module ClassMethods
    def validate(name_valid, type_valid, *option)
       @validations = validations << { name_valid: name_valid, type_valid: type_valid, option: option }
      validate_choise(name_valid, type_valid, *option)
    rescue StandardError => error
      puts "Ошибка: #{error.message}"
    end

    def validate_choise(name_valid, type_valid, *option)
      case type_valid.to_sym
      when :presence
        presence_method(name_valid, _option)
      when :format
        format_method(name_valid, option)
      when :type
        type_method(name_valid, option)
      else
        raise 'Неправильный ввод, такого метода нет'
      end
    end

    def presence_method(name_valid, _option)
      raise 'Значение не должно быть пустым' if name_valid.to_s.empty?
    end

    def format_method(name, option = /^[a-zа-я0-9-]+$/i)
      raise 'Значение неверного формата' unless name =~ option
    end

    def type_method(name, type)
      raise 'Значение неверного типа' unless name.class == type
    end
  end
end
