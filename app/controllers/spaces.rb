require_relative '../models/space'

class MakersBnB < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/list_of_spaces'
  end

  post '/spaces' do

    # @filename = params[:file][:filename]
    # file = params[:file][:tempfile]
    # File.open(".app/public/images/#{@filename}", 'wb') do |f|
    #   f.write(file.read)
    # end

    current_user.spaces.create(space_name: params[:space_name], space_description: params[:space_description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date])
    @space = Space.all
    flash.next[:confirmation] = "Your space has been added!"
    redirect('/spaces')
  end

  post '/filtered-spaces' do
    session[:requested_date] = params[:requested_date]
    redirect('/filtered-spaces')
  end

  get '/filtered-spaces' do
    spaces = Space.all
    date_requested = session[:requested_date].split("-")
    formatted_requested_date = Date.new(date_requested[0].to_i, date_requested[1].to_i, date_requested[2].to_i)
    @spaces = spaces.select {|space| (formatted_requested_date >= space.start_date) && (formatted_requested_date <= space.end_date) }
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
