class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'

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

  get '/spaces/:space_name' do
    @space = Space.first(space_name: params[:space_name])
    erb :'/spaces/space'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
