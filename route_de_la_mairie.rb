require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)
  contact = {}
  page = Nokogiri::HTML(open(url))
  contact[:name] = page.xpath("/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a").text
  contact[:email] = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  contact
end

def get_all_the_urls_of_val_doise_townhalls(url, page)
  urls = []
  page = Nokogiri::HTML(open(url + page))
  page.xpath("//a[@class = 'lientxt']/@href").each do |town|
    urls << url + town.text[2..-1]
  end
  urls
end

def get_all_the_emails_of_val_doise_townhalls(website_url, page)
  contacts = []
  town_urls = get_all_the_urls_of_val_doise_townhalls(website_url, page)
  town_urls.each do |town_url|
    p contact = get_the_email_of_a_townhal_from_its_webpage(town_url)
    contacts << contact
  end
  contacts
end

puts get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")
puts get_all_the_emails_of_val_doise_townhalls("http://annuaire-des-mairies.com/", "val-d-oise.html"))