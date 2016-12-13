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
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to include "/sign_up"
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an email address' do
   expect { sign_up(email: nil) }.not_to change(User, :count)
   expect(current_path).to eq('/sign_up')
   expect(page).to have_content('Email must not be blank')
 end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end


end
