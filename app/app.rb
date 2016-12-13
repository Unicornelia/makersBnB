ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user.rb'
require_relative './models/space'
require_relative 'datamapper_setup'

class MakersBnB < Sinatra::Base

  register Sinatra::Flash
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
    user = User.new(params)

    if user.save
      session[:user_id] = user.id
      redirect '/' unless user.nil?
    else
      flash.now[:errors] = user.errors.full_messages
      erb :sign_up
    end
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name], space_description: params[:space_description], price: params[:price])
    flash.next[:confirmation] = "Your space has been added!"
    redirect('/spaces')
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/list_of_spaces'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
