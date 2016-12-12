require 'spec_helper'
require 'web_helpers'
require './app/models/user'

feature User do

  scenario "Expects to redirect to index page after sign_up" do
    sign_up
    expect(current_path).to include "/"
    expect(page).to have_content('Welcome')
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Chrixs')
    expect(User.first.email).to eq('helloworld@gmail.com')
  end

  scenario 'Requires matching passwords, aka confirmation' do
    expect { sign_up(password_confirmation: '1234').not_to change(User, :count) }
  end


end
