a = [1,2,3]
b = ['a','b','c']
result = []
a.each do |number| 
  b.each do |letter|
    result.push("#{number}#{letter}")
  end
end
result.join(", ")
puts result 
