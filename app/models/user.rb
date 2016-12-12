require 'bcrypt'
require 'dm-validations'

class User
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String
  property :email, String
  property :password_hash, Text

  validates_confirmation_of :password
  validates_presence_of :email

  @@count = 0

def initialize(params)
  self.username = params[:username]
  self.email = params[:email]
  self.password = params[:password]
  self.password_confirmation = params[:password_confirmation]
  @@count += 1
end

def count
  @count
end

def password=(password)
  @password = password
  @password_hash = Password.create(password)
end

end
