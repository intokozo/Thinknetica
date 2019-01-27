puts "Введите число"
date = gets.chomp.to_i
if date < 1 || date >31
  puts "Ввели некорректные данные, попробуем еще раз"
  return
end

puts "Введите месяц"
month = gets.chomp.to_i
if month < 1 || month >12
  puts "Ввели некорректные данные, попробуем еще раз"
  return
end

puts "Введите год"
year = gets.chomp.to_i

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
  d[1] = 29
end

all_days = days[0...month].sum
puts "С начала года дней прошло: #{all_days}"
