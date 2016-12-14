feature 'filtering spaces by availability' do


  scenario 'start date chosen by user will limit the spaces that can be viewed' do
    add_first_space
    add_second_space
    fill_in 'start_date', with: '15/01/2017'
    fill_in 'end_date', with: '17/01/2017'
    click_button 'Filter available spaces'
    expect(page).to have_content 'First space'
    expect(page).not_to have_content 'Second space'
  end

end
