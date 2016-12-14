class MakersBnB < Sinatra::Base

  get '/requests/manager' do
    erb :'requests/manager'
  end
end
