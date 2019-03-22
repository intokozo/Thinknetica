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

  def presence_method(name_valid, _option)
    raise 'Значение не должно быть пустым' if name_valid.to_s.empty?
  end

  def format_method(name, option = /^[a-zа-я0-9-]+$/i)
    raise 'Значение неверного формата' unless name =~ option
  end

  def type_method(name, type)
    raise 'Значение неверного типа' unless name.class == type
  end

  module ClassMethods
    def validations
      @validations || []
    end

    def validate(name_valid, type_valid, *option)
      @validations << { name_valid: name_valid, type_valid: type_valid, option: option }
    rescue StandardError => error
      puts "Ошибка: #{error.message}"
    end
  end
end
