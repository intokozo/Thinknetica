module Acсessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      accessor(name)
      history_array(name)
    end
  end

  def accessor(name)
    var_name = "@#{name}".to_sym
    define_method(name.to_sym) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
  end

  def history_array(name)
    array = ["@#{name}_history".to_sym]
    define_method("@#{name}_history".to_sym) { instance_variable_get(array) }
    array << instance_variable_get("@#{name}".to_sym)
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name.to_sym) { instance_variable_get(var_name) }
    raise ArgumentError, "Класс не соответствует #{type}" unless var_name.is_a? type.capitalize
    define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
  end
end
