require 'selenium-webdriver'

driver = Selenium::WebDriver.for:chrome

puts "==========GIMME SOME STARS============"

puts "This program need your userName and password to work"

puts "Enter your github username"
ownerName = gets.chomp

puts "Enter your github passowrd"
ownerPass = gets.chomp



puts "Enter github username"

userName = gets.chomp


driver.get "https://github.com/#{userName}?tab=repositories"

listRepos = driver.find_elements(:xpath,'//div[@id="user-repositories-list"]//ul[@data-filterable-for="your-repos-filter"]')

listAllRepos = driver.find_elements(:xpath, '//li[@class="col-12 d-flex width-full py-4 border-bottom color-border-muted public source"]')

#listAllRepos.each do |x| 
# puts " "
# puts x.text
# puts " "
#end
 
buttons = driver.find_elements(:xpath, '//button[@value="Star"]')

buttons.each do |s|
  s.click
end






