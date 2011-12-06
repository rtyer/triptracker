require 'minitest/unit'

# Must use this class as the base class for your tests
class SequelTestCase < MiniTest::Unit::TestCase
  include TestHelper
  
  def run(*args, &block)
    Sequel::Model.db.transaction(:rollback=>:always){super}
  end
end