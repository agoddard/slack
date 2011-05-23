require 'nokogiri'
require 'open-uri'

tide_html = Nokogiri::HTML(open("http://www.mobilegeographics.com:81/locations/7064.html"))
tide_html.css('pre').to_s.each_line.each do |line|
field = line.split(' ')
	if field[6] == "Slack,"
		puts "#{field[0]} #{field[1]} #{field[2]} #{field[4]} kts #{field[7]} #{field[8]}"
	end
end

