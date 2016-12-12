def sign_up(email: 'helloworld@gmail.com', password: '1234', password_confirmation: '1234')
  visit "/sign_up"
  expect(page.status_code).to eq(200)
  fill_in "username", :with => "Chrixs"
  fill_in "email", :with => email
  fill_in "password", :with => password
  fill_in 'password_confirmation', :with => password_confirmation
  click_button "Sign Up"
end
