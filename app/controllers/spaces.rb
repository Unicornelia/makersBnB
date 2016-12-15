require_relative '../models/space'

class MakersBnB < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/list_of_spaces'
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name], space_description: params[:space_description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date])
    flash.next[:confirmation] = "Your space has been added!"
    redirect('/spaces')
  end

  post '/filtered-spaces' do
    session[:start_date] = params[:start_date]
    session[:end_date] = params[:end_date]
    redirect('/filtered-spaces')
  end

  get '/filtered-spaces' do
    spaces = Space.all
    date_from = session[:start_date].split("-")
    date_to = session[:end_date].split("-")
    date_f = Date.new(date_from[0].to_i, date_from[1].to_i, date_from[2].to_i)
    date_t = Date.new(date_to[0].to_i, date_to[1].to_i, date_to[2].to_i)
    @spaces = spaces.select {|space| (space.start_date <= date_f) && (space.end_date >= date_t)}
    erb :'/spaces/filtered_spaces'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  get '/spaces/:space_name' do
    @space = Space.first(space_name: params[:space_name])
    erb :'/spaces/space'
  end
end
