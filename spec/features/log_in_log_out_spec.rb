feature "User sign in" do

  let!(:user) do
    create_user
  end

  scenario 'with correct credentials' do
    log_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.username.capitalize}"
  end
end

feature "User sign out" do
  before(:each) do
    create_user
  end

  scenario "while being signed in" do
    log_in(username: 'CoolWinner', password: 'cool99')
    click_button "Log Out"
    expect(page).to have_content "Goodbye you cool, cool winner!"
    expect(page).not_to have_content "Welcome, CoolWinner"
  end

end
