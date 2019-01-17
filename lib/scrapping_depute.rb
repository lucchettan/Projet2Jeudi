
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

puts page.css('li').text