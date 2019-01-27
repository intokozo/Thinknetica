purchase = {}

loop do
  puts "Введите название товара:"
  title = gets.chomp.capitalize
  break if title == "Stop"

  puts "Введите цену товара:"
  price = gets.chomp.to_f

  puts "Введите количество товара:"
  amount = gets.chomp.to_f

  purchase[title] = { price: price, amount: amount }
end

cost_all = 0

purchase.each do |t,pa|
  cost = pa[:price] * pa[:amount]
  puts "Вы приобрели #{t} на сумму #{cost}"
  cost_all += cost
end

puts "Вы приобрели всего товара на сумму #{cost_all}"
