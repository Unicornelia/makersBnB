require 'spec_helper'
require 'web_helpers'
require './app/models/user'

feature User do

  scenario "Expects to redirect to index page after sign_up" do
    sign_up
    expect(current_path).to include "index"
  end
end
