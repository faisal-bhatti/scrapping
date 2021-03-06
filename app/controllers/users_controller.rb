class UsersController < ApplicationController

	def search_data
  	require "selenium-webdriver"
    # head = Headless.new
    # head.start
    
    driver = Selenium::WebDriver.for :phantomjs, :args => ['--ignore-ssl-errors=true']
    # driver = Selenium::WebDriver.for :firefox
    driver.navigate.to "https://cignaforhcp.cigna.com/web/secure/chcp/windowmanager#tab-hcp.pg.patientsearch$1"
    
    username = driver.find_element(:name, 'username')
    username.send_keys "skedia105"

    password = driver.find_element(:name, 'password')
    password.send_keys "Empclaims100"

    element = driver.find_element(:id, 'button1')
    element.send_keys "Empclaims100" 
    element.submit
    # driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    
    sleep(3)
    href_search = driver.find_elements(:class,'patients')
    href_search[1].click
    
    
    sleep(1)  
    member_id = driver.find_element(:name, 'memberDataList[0].memberId')
    member_id.send_keys "102216035"
    dob = driver.find_element(:name, 'memberDataList[0].dobDate')
    dob.send_keys "1/9/1957"
    first_name = driver.find_element(:name, 'memberDataList[0].firstName')
    first_name.send_keys "DEVIKA"
    last_name = driver.find_element(:name, 'memberDataList[0].lastName')
    last_name.send_keys "SHAH"
    ee = driver.find_elements(:class,'btn-submit-form-patient-search')[0]
    ee.submit

    sleep(1)
    link = driver.find_elements(:class,'oep-managed-link')[5]
    link.click
    

    # puts driver.title
    sleep(2)
    tables = driver.find_elements(:class,'collapseTable')
    @table1 = tables[0].attribute('innerHTML').gsub("\t","").gsub("\n","")
    @table2 = tables[1].attribute('innerHTML').gsub("\t","").gsub("\n","")
    @table3 = tables[2].attribute('innerHTML').gsub("\t","").gsub("\n","")
    @table4 = tables[3].attribute('innerHTML').gsub("\t","").gsub("\n","")
    @table5 = tables[4].attribute('innerHTML').gsub("\t","").gsub("\n","")
    @table6 = tables[5].attribute('innerHTML').gsub("\t","").gsub("\n","")

    driver.quit 
    # head.destroy
    # redirect_to users_path
  end
end
