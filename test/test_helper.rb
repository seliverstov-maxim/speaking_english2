ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  include FactoryGirl::Syntax::Methods
  include Wrong
end
