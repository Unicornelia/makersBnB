require_relative '../models/request'

class MakersBnB < Sinatra::Base

  get '/requests/manager' do
    @requests = Request.all
    erb :'requests/manager'
  end

  post '/requests' do
  request = current_user.requests.new(requested_date: session[:requested_date], confirmed: false, space_id: params[:space_id])
  # require 'pry'; binding.pry
    if request.save
      flash.next[:request_sent] = "Booking request sent!"
      redirect('/requests/manager')
    else
      flash.now[:request_not_sent] = "Booking request could not be sent!"
      redirect('/spaces')
    end
    end

    post '/requests/confirm' do
      @confirmed_request = Request.first(id: params[:request_id])
      @confirmed_request.update(:confirmed => true)
      redirect('/requests/manager')
    end

end
