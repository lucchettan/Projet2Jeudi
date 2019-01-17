require 'nokogiri'
require 'open-uri'


# Fetch and parse HTML document
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


#page.xpath rappel le lien xpath tire sur la page au dessus (lien de l page)
cryptocurrencies = page.xpath('//*[@class="text-left col-symbol"]').collect(&:text)
cryptovalue = page.xpath('//*[@class="price"]').collect(&:text)
##p en debut de ligne sort les donnees dans un array et puts donne une liste
 #&: = .each do { |x| x .eoknvreb }

A = Hash[cryptocurrencies.zip(cryptovalue)]
A.each {|k, v| A[k] = (v.delete"$").to_f}

annuaire = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

get_townhall_urls = annuaire.xpath('//*[@class="lientxt"]').collect(&:text)


# essai = page.css('tr')[3]('td')[1].text


urlableiges = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/ableiges.html"))
def get_townhall_email(urlableiges)
puts	urlableiges.css(('tr')[3],('td')[1]).text
end
get_townhall_email(urlableiges)