
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
    log_in(username: user.username, password: user.password)
    add_space
    visit 'spaces/My%20space'
    click_button 'Send booking request'
    expect(page).to have_content("My space")
    expect(page).to have_content("CoolWinner")
  end

end
