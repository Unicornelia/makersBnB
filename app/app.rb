ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'

require_relative 'datamapper_setup'

require_relative 'server'
require_relative 'controllers/users'

require './app/models/space'
