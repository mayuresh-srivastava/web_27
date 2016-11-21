h = Hash.new(1)
h[:x] ||= 2
h[:x] = h[:x] || 2
puts h[:x]
puts h 

