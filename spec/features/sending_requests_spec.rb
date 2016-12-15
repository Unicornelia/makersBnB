feature 'sending a request' do
  let!(:user) do
    create_user
  end

  before do
    log_in(username: user.username, password: user.password)
    add_first_space
  end

  scenario 'making a request' do
    visit 'spaces/First%20space'
    expect(page.status_code).to eq(200)
    click_button 'Send booking request'
    expect(page).to have_content('Booking request sent!')
  end

end
