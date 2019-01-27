hsh = {}

("a".."z").each.with_index(1) do |elm, index|
  hsh[elm] = index + 1 if %w(a e o u i).include?(elm)
end

hsh.each { |x, y| print "#{x} = #{y}; "}
