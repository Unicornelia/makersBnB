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

end
