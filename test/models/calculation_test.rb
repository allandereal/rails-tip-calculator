require "test_helper"

class CalculationTest < ActiveSupport::TestCase
  include ApplicationHelper

  test "can compile correct tip per person" do
    calculation = calculations(:one)
    assert_equal 4.2765, calculation.tip_per_person
  end

  test "can compile correct total per person" do
    calculation = calculations(:one)
    total = money_format calculation.total_per_person
    assert_equal "32.79", total
  end

  test "can not save calculation without number of people" do
    calculation = Calculation.new(bill: 2.3, tip: 20)
    assert_not calculation.save
  end
end
