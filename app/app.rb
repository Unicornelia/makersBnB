ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'datamapper_setup'

require_relative 'server'
require_relative 'controllers/spaces'
require './app/models/user.rb'
