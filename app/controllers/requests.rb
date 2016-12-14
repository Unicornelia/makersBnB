require_relative '../models/request'

class MakersBnB < Sinatra::Base

  get '/requests/manager' do
    erb :'requests/manager'
  end

  post '/requests' do
  request = current_user.requests.new(requested_date: '02/12/2016', confirmed: false, space_id: params[:space_id])
    if request.save
      flash.next[:request_sent] = "Booking request sent!"
    else
      redirect('/requests/manager')
    end
  end

end
