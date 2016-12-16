feature 'sending a request' do
  let!(:user) do
    create_user
  end

  before do
    log_in(username: user.username, password: user.password)
    add_first_space
  end

  scenario 'making a request' do
    book_a_space
    expect(page).to have_content('Booking request sent!')
  end

  scenario 'cannot book a space on a date that has already been been confirmed' do
    add_first_space
    click_button 'Log Out'
    sign_up
    visit '/spaces'
    fill_in 'requested_date', with: Date.new(2017, 01, 10)
    click_button 'Filter available spaces'
    visit '/spaces/First%20space'
    click_button "Send booking request"
    click_button 'Log Out'
    log_in
    click_link "View requests"
    click_button "Confirm booking"
    click_button 'Log Out'
    sign_up_two
    visit '/spaces'
    fill_in 'requested_date', with: Date.new(2017, 01, 10)
    click_button 'Filter available spaces'
    visit '/spaces/First%20space'
    click_button "Send booking request"
    expect(page).to have_content("This space is no longer available on the selected date")
  end

end
