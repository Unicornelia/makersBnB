feature 'filtering spaces by availability' do


  scenario 'start date chosen by user will limit the spaces that can be viewed' do
    log_in
    add_first_space
    add_second_space
    fill_in 'requested_date', with: Date.new(2017, 01, 15)
    click_button 'Filter available spaces'
    expect(current_path).to eq '/filtered-spaces'
    expect(page).to have_content 'First space'
    expect(page).not_to have_content 'Second space'
  end

end
