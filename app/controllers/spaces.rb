require_relative '../models/space'

class MakersBnB < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/list_of_spaces'
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name], space_description: params[:space_description], price: params[:price])
    flash.next[:confirmation] = "Your space has been added!"
    redirect('/spaces')
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  get '/spaces/:space_name' do
    @space = Space.first(space_name: params[:space_name])
    erb :'/spaces/space'
  end
end
