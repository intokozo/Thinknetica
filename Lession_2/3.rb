fibon = [0, 1]

loop do
  n = fibon[-1] + fibon[-2]
  break if n >= 100
  fibon.push(n)
end
