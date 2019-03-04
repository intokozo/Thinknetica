module Validate
  def validate(name_valid, type_valid, *option)
    case type_valid.to_sym
    when :presence
      presence_method(name_valid)
    when :format
      format_method(name_valid, option)
    when :type
      type_method(name_valid, option)
    else
      raise ArgumentError 'Неправильный ввод, такого метода нет'
    end
  end

  def presence_method(name_valid)
    raise ArgumentError 'Значение не должно быть пустым' if name_valid.to_s.empty?
  end

  def format_method(name, option = /^[a-zа-я0-9-]+$/i)
    raise ArgumentError 'Значение неверного формата' unless name =~ option
  end

  def type_method(name, type)
    raise ArgumentError 'Значение неверного типа' unless name.is_a?(type.capitalize)
  end

  def validate!
  end
  def valid?
  end
end
