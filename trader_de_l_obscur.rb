require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

def trader_de_lombre

	hash_array = {}
	arrayprice = []
	arrayname = []
	pages = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	currencyname = pages.css (".currency-name-container")
		
	price = pages.css("a.price")
	
	price.each  do |price| 
		priceusd =  price['data-usd']
		arrayprice << priceusd


	end


		currencyname.each do |namec|
			namecur = namec.text	
			arrayname << namecur
	

		 end


puts Hash[arrayname.zip(arrayprice)]
end


trader_de_lombre