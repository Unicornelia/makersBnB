def sign_up(email: 'helloworld@gmail.com', password: '1234', password_confirmation: '1234')
  visit "/sign-up"
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

def create_user
  User.create(email: 'cool@winners.com',
  password: 'cool99',
  password_confirmation: 'cool99',
  username: 'CoolWinner')
end

def sign_up_two(email: 'hi@hi.com', password: '1234', password_confirmation: '1234')
  visit "/sign-up"
  fill_in "username", :with => "Mike"
  fill_in "email", :with => email
  fill_in "password", :with => password
  fill_in 'password_confirmation', :with => password_confirmation
  click_button "Sign Up"
end

def add_first_space
  create_user
  log_in
  visit '/spaces/new'
  fill_in 'space_name', with: 'First space'
  fill_in 'space_description', with: "It's first."
  fill_in 'price', with: '60'
  fill_in 'start_date', with: Date.new(2017, 01, 01)
  fill_in 'end_date', with: Date.new(2017, 02, 02)
  click_button 'Add a space'
end

def add_second_space
  visit '/spaces/new'
  fill_in 'space_name', with: 'Second space'
  fill_in 'space_description', with: "It's second."
  fill_in 'price', with: '12'
  fill_in 'start_date', with: Date.new(2017, 03, 01)
  fill_in 'end_date', with: Date.new(2017, 04, 02)
  click_button 'Add a space'
end

def book_a_space
  add_first_space
  click_button "Log Out"
  sign_up
  visit '/spaces'
  fill_in 'requested_date', with: Date.new(2017, 01, 10)
  click_button 'Filter available spaces'
  visit '/spaces/First%20space'
  click_button "Send booking request"
end

def confirm_booking
  book_a_space
  click_button "Log Out"
  log_in
  click_link "View requests"
  click_button "Confirm booking"
end
