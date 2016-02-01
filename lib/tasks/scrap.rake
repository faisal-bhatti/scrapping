task :scrapping =>:environment do
   require "selenium-webdriver" 
    #... see webdriver ruby api docs here: http://selenium.googlecode.com/svn/trunk/docs/api/rb/_index.html
    #... Most usefull classes are Driver and Element, check them out for a good start
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to "https://cignaforhcp.cigna.com/web/secure/chcp/windowmanager#tab-hcp.pg.patientsearch$1"
    
    username = driver.find_element(:name, 'username')
    username.send_keys "skedia105"

    password = driver.find_element(:name, 'password')
    password.send_keys "Empclaims100"

    element = driver.find_element(:id, 'button1')
    element.send_keys "Empclaims100" 
    element.submit
    # driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
    sleep(5)
    #tab-hcp.pg.patientsearch
    href_search = driver.find_elements(:class,'patients')
    href_search[1].click

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

    sleep(3)
    link = driver.find_elements(:class,'oep-managed-link')[5]
    link.click

    puts driver.title
    tables = driver.find_elements(:class,'collapseTable')
    puts tables[0]
    # tables.each do |tbl|
    #   p tbl.inspect
    #   p "*"90
    # end
    driver.quit
end  # end of environment

# ee = driver.find_elements(:class,'btn-submit-form-patient-search')