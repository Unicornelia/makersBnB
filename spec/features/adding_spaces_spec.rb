feature 'adding a new space' do
  scenario 'a user can fill in their details when adding a new space' do
    visit '/spaces/new'
    expect(page.status_code).to eq (200)
    expect(page).to have_content ('Add your space to rent below!')
  end

  scenario 'a user can add a new space' do
    add_space
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('Your space has been added!')
  end

  scenario 'a user can see their newly created space on the "spaces" page once they have created it' do
    add_space
    expect(page).to have_content('My space')
    expect(page).to have_content("It's very nice.")
    expect(page).to have_content('£50 per night')
  end

end
