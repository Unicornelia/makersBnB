require 'data_mapper'
require 'dm-postgres-adapter'

class Request
  include DataMapper::Resource

  property :id, Serial
  property :requested_date, Date, :required => true
  property :confirmed, Boolean

  belongs_to :user
  belongs_to :space

  def booking_status
     @status = self.confirmed ? "Confirmed!" : "Awaiting confirmation"
  end

end
