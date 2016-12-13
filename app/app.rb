ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user.rb'
require_relative './models/space'
require_relative 'datamapper_setup'

class MakersBnB < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @user = current_user
    erb :index
  end

  get '/sign-up' do
    erb :'sign_up/sign_up'
  end

  post '/sign-up' do
    user = User.new(params)

    if user.save
      session[:user_id] = user.id
      redirect '/' unless user.nil?
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'sign_up/sign_up'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye you cool, cool winner!"
    redirect to '/'
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
