ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/user.rb'
require_relative 'datamapper_setup'

class MakersBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @user = current_user
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(params)
    session[:user_id] = user.id
    redirect '/' unless user.nil?
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
