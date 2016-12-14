require 'web_helpers'


feature "requests " do
  let!(:user) do
    User.create(email: 'cool@winners.com',
    password: 'cool99',
    password_confirmation: 'cool99',
    username: 'CoolWinner')
  end


  scenario "seeing your requests" do
    log_in(username: user.username, password: user.password)
    click_link('View requests')
    expect(page.status_code).to eq (200)
    expect(page).to have_content "Requests"
  end
end
