ENV.store("RACK_ENV", "test")

require "config/boot"
require "committee_helper"
require "committee"

RSpec.configure do |config|
  config.filter_run_when_matching :focus

  config.include Rack::Test::Methods
  config.include Committee::Test::Methods
  config.include CommitteeHelper

  def app
    Acme::Application
  end
end
