require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :space_name, String, :required => true
  property :space_description, Text
  property :price, String, :required => true
  property :start_date, Date
  property :end_date, Date

  def available?(requested_date)
    return true if requested_date >= self.start_date && requested_date < self.end_date
    false
  end

  belongs_to :user
  has n, :requests

end
