puts "Давайте решим квадратное уравнение.\nВведите \"a\""
a = gets.chomp.to_i

puts "Введите \"b\""
b = gets.chomp.to_i

puts "Введите \"с\""
c = gets.chomp.to_i

d = b**2 - 4 * a * c

if d < 0
  puts "Уравнение решений не имеет, так как дискриминант меньше нуля #{d}"
elsif d == 0
  x = -b / (2 * a)
  puts "Один корень, x =#{x}, дискриминант равен #{d}"
elsif d > 0
  f = Math.sqrt(d)
  x_one = (-b + f) / (2 * a)
  x_two = (-b - f) / (2 * a)
  puts "Два корня, x1 =#{x_one} x2 =#{x_two}, дискриминант равен #{d}"
else
  puts "Такого не может быть"
end
