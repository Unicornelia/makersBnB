def add_space
  visit '/spaces/new'
  fill_in 'space_name', with: 'My space'
  fill_in 'space_description', with: "It's very nice."
  fill_in 'price', with: '50'
  fill_in 'start_date', with: '01/01/2001'
  fill_in 'end_date', with: '02/02/2001'
  click_button 'Add a space'
end
