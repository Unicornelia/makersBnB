require 'bcrypt'
require 'dm-validations'

class User
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String
  property :email, String, required: true, unique: true
  property :password_hash, Text


  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

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
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end

  end
end
