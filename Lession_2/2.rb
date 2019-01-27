arr = (10..100).to_a
arr.delete_if { |x| x % 5 != 0 }

arr2 = Array.new
(10..100).each { |n| arr2.push(n) if n % 5 == 0 }

arr3 = (10..100).step(5).to_a
