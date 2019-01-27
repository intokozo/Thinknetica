hsh = Hash.new
y = 1

("a".."z").each { |elm|
   hsh[elm] = y
   y += 1
}

hsh.each {| key, value |
   %w{a e y u i o}.include?(key) ? next : hsh.delete(key) }

hsh.each { |x, y| print "#{x} = #{y}; "}
