describe "confirming requests" do

  scenario 'before a booking is confirmed, booking request status is "awaiting confirmation"' do
    book_a_space
    click_link 'View requests'
    expect(page).to have_content "Booking status: Awaiting confirmation"
  end

  scenario 'accepting a booking removes confirm button and sets the booking request status to "confirmed"' do
    confirm_booking
    expect(page).not_to have_content("Confirm booking")
    click_button('Log Out')
    visit "/sessions/new"
    fill_in "username", :with => "Chrixs"
    fill_in "password", :with => "1234"
    click_button "Log In"
    click_link('View requests')
    expect(page).to have_content "Booking status: Confirmed!"
  end
end
