ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/user.rb'

class MakersBnB < Sinatra::Base

  enable :sessions

  get '/' do
    @username = session[:username]
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    session[:username] = params[:username]
    redirect '/'
  end

  run! if app_file == $0
end
