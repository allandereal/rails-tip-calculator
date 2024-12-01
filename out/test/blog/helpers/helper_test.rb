require "test_helper"

class HelperTest < ActiveSupport::TestCase
  include ApplicationHelper

  test "can format float into money" do
    money = money_format 4.2765
    assert_equal "4.27", money
  end
end
