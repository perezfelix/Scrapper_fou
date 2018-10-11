require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
	mail = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	mail.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	puts node.text
	end
end

def get_all_the_urls_of_val_doise_townhalls

end

get_the_email_of_a_townhal_from_its_webpage