require 'sinatra/base'

class MakersBnB < Sinatra::Base
  get '/' do
    'Hello makersBnB!'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
