require 'nokogiri'
require 'open-uri'
require 'date'

tide_html = Nokogiri::HTML(open("http://www.mobilegeographics.com:81/locations/7064.html"))
tide_html.css('pre').to_s.each_line.each do |line|
  field = line.split
  if field[6] == "Slack,"
    date = Date.parse field[0]
    time = "#{field[1]} #{field[2]}"
    kts = field[4]
    event = "#{field[7]} #{field[8]}"
    puts "#{date} #{time} #{kts} #{event}" if date == Date.today
  end
end
