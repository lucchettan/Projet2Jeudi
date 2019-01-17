
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
name = page.xpath('//*[@class="list_nom"]').collect(&:text)
name = name.join("").split(" ").each_slice(2).map(&:first)
##  surname = name.join("").split(" ").each_with_index {|el,index| arr1.delete_at(index) if index % 2 > 1 }
##noms = page.xpath('//*[@class="list_nom"]').collect(&:text)
#surname = page.take(%2) 

print name.count   ##probleme une depute a deux noms separes qui fait planter la separation 1/2



####SOLUTION ###
##def get_deputy_email
##	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
##	deputy_list_a = page.xpath('//*[@id="deputes-list"]//li/a/text()')
##	deputy_names_a = deputy_list_a.map { |single_deputy_information| single_deputy_information.to_s.split.drop(1) }
##	binding.pry
##	deputy_contact_a = deputy_names_a.map { |first_name, last_name|
##		email = first_name.downcase + '.' + last_name.downcase + '@assemblee-nationale.fr'
##		Hash[first_name: first_name, last_name: last_name, email: email]
##	}
##	# binding.pry
##end

##def perform
	get_deputy_email
##end

##puts perform