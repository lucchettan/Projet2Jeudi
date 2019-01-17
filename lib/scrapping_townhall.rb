
require 'nokogiri'
require 'open-uri'

#get_townhall_urls = annuaire.xpath('//*[@class="lientxt"]').collect(&:text)
#urltown = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/ableiges.html"))
$page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
 	
def link_maire 
	 $page.xpath('//a[@class="lientxt"]').collect{|x| x['href'].delete(".html") + ".html"}
	$links = link_maire.map { |p| Nokogiri::HTML(open("http://annuaire-des-mairies.com" + p))}
end

## $links.each.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
						###analyse cote css le chemin xpath de la zone recherchee 
							###et la ressort en texte

def get_townhall_email
city_95 = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
p city_95.css("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
#trouve l’adresse mail de la ville avernes:
#clic droit sur le mail puis inspecter
#puis dans l’inspecteur, click droit : copy Xpath
end

def get_townhall_urls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
$city = page.xpath('//a[@class="lientxt"]').collect{|ville| ville.text.downcase.gsub(" ", "_") }
#Sort le nom des villes en downcase avec un "_"
return link_maire = page.xpath('//a[@class="lientxt"]').collect{|x| x['href']}.each{|x| x.slice!(0)}
#Sort la fin du lien de chaque ville en "/95/wy-dit-joli-village.html"
end


def get_townhall_email(get_townhall_urls)
link_city = get_townhall_urls.map{|p| "http://annuaire-des-mairies.com" + p}
#Sort chaque lien de ville
arr_mails = []
result_mail = link_city.each{|link| arr_mails.push(Nokogiri::HTML(open(link)).css("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text)}
hash =Hash[$city.zip(arr_mails)]
p hash
end

get_townhall_email(get_townhall_urls)