def sign_up
  visit "/sign_up"
  fill_in "username", :with => "Chrixs"
  fill_in "email", :with => "helloworld@gmail.com"
  fill_in "password", :with => "1234"
  click_button "submit"
end
