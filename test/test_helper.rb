require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    #returns true if user logged in
    !session[:user_id].nil?
  end
  
  #Change later if adding "remember me"
  def log_in_as(user, options = {})
    password    = options[:password]    || 'password'
    #remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email:       user.email,
                                  password:    password }
    #  post login_path, session: { email:       user.email,
    #                              password:    password,
    #                              remember_me: remember_me }
    else
      session[:user_id] = user.id
    end
  end
  
  private
    
    def integration_test?
      #post_via_redirect defined in
      #ActionController::Integration::Session
      #returns true only in integration test environment
      defined?(post_via_redirect)
    end
end
