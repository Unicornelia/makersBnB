class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
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


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
