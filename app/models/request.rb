require 'data_mapper'
require 'dm-postgres-adapter'

class Request
  include DataMapper::Resource

  property :id, Serial
  property :requested_date, Date
  property :confirmed, Boolean

  belongs_to :user
  belongs_to :space
end
