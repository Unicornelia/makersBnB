describe User do

  let!(:user) do
    User.create(email: 'cool@winners.com',
    password: 'cool99',
    password_confirmation: 'cool99',
    username: 'CoolWinner')
  end


  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, 'wrong_stupid_password')).to be_nil
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

end
