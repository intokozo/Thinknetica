puts "Введите длинну первой стороны треугольника"
  a = gets.chomp.to_f

puts "Введите длинну второй стороны треугольника"
  b = gets.chomp.to_f

puts "Введите длинну третьей стороны треугольника"
  c = gets.chomp.to_f

d = [a, b, c]
  h = d.max
  c1, c2 = d.min(2)

right = (h**2 == c1**2 + c2**2)
isosceles = (c1 == c2 || c1 == h || c2 == h)
equal = (c1 == c2 && c1 == h)

case

  when right

    if isosceles
      puts "Треугольник прямоугольный и равнобедренный"
    else
      puts "Треугольник прямоугольный"
    end

  when equal
      puts "Треугольник равнобедренный и равносторонний, но не прямоугольный"

  else
      puts "Треугольник не прямоугольный"

end
