require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

wait = Selenium::WebDriver::Wait.new(:timeout => 30)

puts " Nome de usuario github "
userName = gets.chomp
puts " Senha github"
passName = gets.chomp

driver.navigate.to "https://www.github.com/login"

sleep 10

user = driver.find_element(:xpath, '//input[@name="login"]')
pass = driver.find_element(:xpath, '//input[@name="password"]')
submit = driver.find_element(:xpath, '//input[@name="commit"]')


user.send_keys userName
pass.send_keys passName

submit.click()
sleep 3
puts driver.title
sleep 3
if driver.title == 'GitHub'
  puts "Entre o nome do usuário"
  userStar =  gets.chomp
  driver.navigate.to "https://github.com/#{userStar}?tab=repositories"
  sleep 3
  puts " "
  puts driver.title
end
sleep 3



