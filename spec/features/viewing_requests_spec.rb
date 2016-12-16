
feature "requests " do

    let!(:user) do
    create_user
  end

  scenario "seeing your requests" do
    log_in(username: user.username, password: user.password)
    click_link('View requests')
    expect(page.status_code).to eq (200)
    expect(page).to have_content "Requests"
  end

  scenario "see a new request" do
    add_first_space
    visit 'spaces/First%20space'
    click_button 'Send booking request'
    expect(page).to have_content("First space")
    expect(page).to have_content("CoolWinner")
  end

  scenario "viewing a request on your space" do
    add_first_space
    click_button "Log Out"
    sign_up
    visit 'spaces/First%20space'
    click_button "Send booking request"
    click_button "Log Out"
    log_in
    click_link "View requests"
    expect(page).to have_content("Chrixs")
  end


end
