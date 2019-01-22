puts "Как вас зовут?"
name = gets.chomp.capitalize
puts "Какой у вас рост?"
height = gets.chomp.to_i
ideal_weight = height - 110
puts ideal_weight > 0 ? "#{name}, ваш идеальный вес #{ideal_weight}" : "#{name} у вас идеальный вес!"
