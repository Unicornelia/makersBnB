require 'web_helpers'


feature "User sign in" do

  let!(:user) do
    User.create(email: 'cool@winners.com',
    password: 'cool99',
    password_confirmation: 'cool99',
    username: 'CoolWinner')
  end

  scenario 'with correct credentials' do
    log_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
