require 'sinatra/base'

class makersBnB < Sinatra::Base
  get '/' do
    'Hello makersBnB!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
