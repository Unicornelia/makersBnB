ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './models/space'

class MakersBnB < Sinatra::Base
  get '/' do
    'Hello makersBnB!'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name], space_description: params[:space_description], price: params[:price])
    redirect('/spaces')
  end

  get '/spaces' do
    erb :'/spaces/list_of_spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
