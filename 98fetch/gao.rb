require 'gruff'

array = []
file = File.new("dump.txt", "r")
file.each do |line|
	array << line.split(', ')
end

array.reverse!


time = {}
click = []
active_user = []
posts = []
reply = []
reg = []

names = {"click" => click, "active_user" => active_user, "posts" => posts, "reply" => reply, "reg" => reg}

array.each_with_index do |item, i|
	p item[0], time[i] = item[0] if item[0].match(/\d{4}-1-1$/)
	click << item[1].to_i
	active_user << item[2].to_i
	posts << item[3].to_i
	reply << item[4].to_i
	reg << item[5].to_i

end

g = []

names.each_key do |str|
	g = Gruff::Line.new("#{array.size}x#{click.size}")
	g.marker_font_size = 7
	g.legend_font_size = 7
	g.title_font_size = 7
	g.legend_box_size = 7
	g.labels = time
	g.data(str, names[str])
	g.write(str+".png")
end
