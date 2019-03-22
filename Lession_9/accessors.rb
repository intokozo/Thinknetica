module Acсessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      accessor(name)
    end
  end

  def accessor(name)
    var_name = "@#{name}".to_sym
    arr_name = "@#{name}_history".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}_history") { instance_variable_get(arr_name) || [] }
    define_method("#{name}=") do |value| instance_variable_set(var_name, value)
      instance_variable_set(arr_name, instance_eval("#{name}_history") << value)
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name.to_sym) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise ArgumentError, "Класс не соответствует #{type}" unless value.is_a? type
      instance_variable_set(var_name, value)
    end
  end
end
