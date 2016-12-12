RSpec.feature 'adding a new space' do
  scenario 'a user can fill in their details when adding a new space' do
    visit '/spaces/new'
    expect(page.status_code).to eq (200)
    expect(page).to have_content ('Add your space to rent below!')
  end

  scenario 'a user can add a new space' do
    visit '/spaces/new'
    fill_in 'space_name', with: 'My space'
    fill_in 'space_description', with: "It's very nice."
    fill_in 'price', with: '50'
    click_button 'Add space'
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('Your space has been added!')
  end


end
