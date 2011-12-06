require_relative '../test_helper'

class Sanity < MiniTest::Unit::TestCase
  def test_truth
    assert_equal true, true
  end
end