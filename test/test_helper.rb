ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'authlogic/test_case'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...

  def log_in(user_sym)
    activate_authlogic
    UserSession.create(users(user_sym))
  end

  def log_out
    activate_authlogic
    UserSession.find.destroy
  end

  def register_as_foobar
    post "/users", :user => {:name => "foobar",
      :email => "foobar@demo.com", :password => "help",
      :password_confirmation => "help"}
  end

  def auth_as_foobar
    post "/user_sessions", :user_session => {:email => "foobar@demo.com", :password => "help"}
  end

end
