class ApplicationController < ActionController::Base
  # protect_from_forgery
  include ApplicationHelper
  require 'bcrypt'
  require 'addressable/uri'
end
