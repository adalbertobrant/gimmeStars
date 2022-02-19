require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

puts "Github Username "
userName = gets.chomp

puts "GitHub Password - will not show in the terminal"

system 'stty -echo'
passName = gets.chomp
system 'stty echo'

driver.navigate.to "https://www.github.com/login"

sleep 3

user = driver.find_element(:xpath, '//input[@name="login"]')
pass = driver.find_element(:xpath, '//input[@name="password"]')
submit = driver.find_element(:xpath, '//input[@name="commit"]')


user.send_keys userName
pass.send_keys passName

submit.click()
sleep 3
puts driver.title

if driver.title == 'GitHub'
  puts "Who is going to receive some Stars ?"
  userStar =  gets.chomp
  driver.navigate.to "https://github.com/#{userStar}?tab=repositories"
  sleep 2
  puts " "
  puts driver.title
  puts "======================= STAR Giver  =============================="
  puts " "
  listRepos = driver.find_elements(:xpath,'//div[@id="user-repositories-list"]//ul[@data-filterable-for="your-repos-filter"]')

  listAllRepos = driver.find_elements(:xpath, '//li[@class="col-12 d-flex width-full py-4 border-bottom color-border-muted public source"]')

  #listAllRepos.each do |x| 
  # puts " "
  # puts x.text
  # puts " "
  #end
 
  count = 0
#  begin
    buttons = driver.find_elements(:xpath, '//button[@value="Star"]')

    buttons.each do |s|
      s.click
      count += 1
    puts "#{userStar} received #{count} stars"
    end
    puts "==========================================="
  
 # rescue
	if count == 0 
    	puts "All #{buttons.length} already has stars"
	end
  
	if count > 0 && count < buttons.length
		puts "#{count} repos received stars"
	end
  #end
end
sleep 10



