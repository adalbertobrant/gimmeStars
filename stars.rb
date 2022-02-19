require 'open-uri'
require 'nokogiri'

puts "Entre o nome do usuário"
userName = gets.chomp

doc = Nokogiri::HTML(URI.open("http://www.github.com/#{userName}?tab=repositories"))

puts doc
