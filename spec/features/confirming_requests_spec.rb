describe "confirming requests" do
  scenario 'accepting a booking removes the booking request' do
    add_first_space
    click_button "Log Out"
    sign_up
    visit 'spaces/First%20space'
    click_button "Send booking request"
    click_button "Log Out"
    log_in
    click_link "View requests"
    click_link "Confirm booking"
    expect(page).not_to have_content "Chrixs"
  end
end
