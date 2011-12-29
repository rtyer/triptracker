require_relative "../test_helper"
require 'rack/test'

module AcceptanceHelper
  require 'capybara/dsl'  
  include Capybara
  include Rack::Test::Methods
  include TestHelper

  def app() TripTracker end

  Capybara.app = TripTracker
end
