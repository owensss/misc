require 'nokogiri'
require 'open-uri'

# find last

# open first page
doc = Nokogiri::HTML(open("http://www.cc98.org/onlineshow.asp"))
page_array = []
doc.xpath('//table/tr/td/a').each  do |td|
	page_array << td if td.content.match(/\[([0-9]+)\]/)
end

last = /[0-9]+/.match page_array[-1].text
last = last[0].to_i

# fetch all data
1.upto last do |i|  # test
	doc = Nokogiri::HTML(open("http://www.cc98.org/onlineshow.asp?action=usersearch&usersearch=&page=#{i}"))
	doc.xpath('//table/tr/th/../..').each do |table|
		table.xpath('./tr/td/..').each do |tr|
			tr.xpath('./td').each do |td|
				if td.next_element then
					print td.text+", "
				else
					print td.text
				end
			end
			puts
		end
	end
end
