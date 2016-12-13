def add_space
  visit '/spaces/new'
  fill_in 'space_name', with: 'My space'
  fill_in 'space_description', with: "It's very nice."
  fill_in 'price', with: '50'
  click_button 'Add a space'
end
