describe "confirming requests" do

  scenario 'before a booking is confirmed, booking request status is "awaiting confirmation"' do
    book_a_space
    click_link 'View requests'
    expect(page).to have_content "Booking status: false"
  end

  scenario 'accepting a booking sets the booking request status to "confirmed"' do
    confirm_booking
    click_button('Log Out')
    visit "/sessions/new"
    fill_in "username", :with => "Chrixs"
    fill_in "password", :with => "1234"
    click_button "Log In" 
    click_link('View requests')
    expect(page).to have_content "Booking status: true"
  end
end
