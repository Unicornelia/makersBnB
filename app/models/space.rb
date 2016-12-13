require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :space_name, String
  property :space_description, Text
  property :price, String
  property :start_date, Date
  property :end_date, Date

  def available?(requested_date)
    return true if requested_date >= self.start_date && requested_date < self.end_date
    false
end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
