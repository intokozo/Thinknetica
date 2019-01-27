fib = [0, 1]

i = 0

while fib[i] < 100
  puts fib[i]
  n = fib[i] + fib[i + 1]
  fib.push(n)
  i += 1
end
