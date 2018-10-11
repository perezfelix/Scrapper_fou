require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_deputy(deputy_url)
  deputy = {}
  page = Nokogiri::HTML(open(deputy_url))
  id = page.xpath("//*[@id='haut-contenu-page']/article/div[2]/h1").text.split
  deputy[:gender] = id[0]
  deputy[:firstname] = id[1]
  deputy[:lastname] = id[2]
  deputy[:mail] = page.xpath("//*[@id='deputes-contact']/section/dl/dd[1]/a/@href").text.split(':')[1]
  deputy
end

def get_all_the_urls_of_deputies(website_url, page)
  urls = []
  page = Nokogiri::HTML(open(website_url + page))
  page.xpath("//*[@id='deputes-list']/div/ul/li/a/@href").each do |deputy|
    urls << website_url + deputy.text
  end
  urls
end

def get_all_deputies(website_url, page)
  deputies = []
  urls = get_all_the_urls_of_deputies(website_url, page)
  urls.each do |url|
    p contact = get_deputy(url)
    deputies << contact
  end
  deputies
end

url = "http://www2.assemblee-nationale.fr"
page = "/deputes/liste/alphabetique"

puts get_all_deputies(url, page)