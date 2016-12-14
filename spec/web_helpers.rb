def sign_up(email: 'helloworld@gmail.com', password: '1234', password_confirmation: '1234')
  visit "/sign-up"
  expect(page.status_code).to eq(200)
  fill_in "username", :with => "Chrixs"
  fill_in "email", :with => email
  fill_in "password", :with => password
  fill_in 'password_confirmation', :with => password_confirmation
  click_button "Sign Up"
end

def log_in(*)
  visit "/sessions/new"
  fill_in "username", :with => "CoolWinner"
  fill_in "password", :with => "cool99"
  click_button "Log In"
end

def add_first_space
  visit '/spaces/new'
  fill_in 'space_name', with: 'First space'
  fill_in 'space_description', with: "It's first."
  fill_in 'price', with: '60'
  fill_in 'start_date', with: '01/01/2017'
  fill_in 'end_date', with: '02/02/2017'
  click_button 'Add a space'
end

def add_second_space
  visit '/spaces/new'
  fill_in 'space_name', with: 'Second space'
  fill_in 'space_description', with: "It's second."
  fill_in 'price', with: '12'
  fill_in 'start_date', with: '01/03/2017'
  fill_in 'end_date', with: '02/04/2017'
  click_button 'Add a space'
end
