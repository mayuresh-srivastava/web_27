
require 'open-uri'
words = open('http://www.codequizzes.com/challenges/names.txt') {|f| f.read }
#words = File.read("/home/ubuntu/workspace/names.txt")
word_array = words.split(" ")

palindromes = []
word_array.each do |x|
if x.length > 1
palindromes << x if x == x.reverse
end
end
puts palindromes
