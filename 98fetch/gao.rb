require 'gruff'

array = []
file = File.new("out.txt", "r")
file.each do |line|
	array << line.split(', ')
end

array.reverse!
# puts array
time = []
data = []
array.each do |item|
	time << item[0]
	data << [4]
end

g = Gruff::Line.new
g.data("reply", data)
g.labels = time

g.write('test.png')
