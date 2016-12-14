feature 'adding a new space' do
  scenario 'a user can fill in their details when adding a new space' do
    visit '/spaces/new'
    expect(page.status_code).to eq (200)
    expect(page).to have_content ('Add your space to rent below!')
  end

  scenario 'a user can add a new space' do
    add_first_space
    expect { add_first_space }.to change(Space, :count).by(1)
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('Your space has been added!')
  end

  scenario 'a user can see their newly created space on the "spaces" page once they have created it' do
    add_first_space
    expect(page).to have_content('First space')
    expect(page).to have_content("It's first.")
    expect(page).to have_content('£60 per night')
  end

  scenario 'a user can add more than one space' do
    add_first_space
    expect(page).to have_content('First space')
    add_second_space
    expect(page).to have_content('Second space')
  end

end
