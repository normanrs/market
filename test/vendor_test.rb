require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/vendor.rb'

class VendorTest <  Minitest::Test
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end
  
  def test_it_has_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    actual = vendor.name
    expected = "Rocky Mountain Fresh"
    assert_equal expected, actual
  end

  def test_inventory_default_empty
    vendor = Vendor.new("Rocky Mountain Fresh")
    actual = vendor.inventory
    expected = {}
    assert_equal expected, actual
  end

  def test_check_stock_default_0
    vendor = Vendor.new("Rocky Mountain Fresh")
    actual = vendor.check_stock("Peaches")
    expected = 0
    assert_equal expected, actual
  end

  def test_it_can_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    actual = vendor.inventory["Peaches"]
    expected = 30
    assert_equal expected, actual
  end

  def test_it_has_new_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    actual = vendor.check_stock("Peaches")
    expected = 30
    assert_equal expected, actual
  end

  def test_it_can_total_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    actual = vendor.inventory["Peaches"]
    expected = 55
    assert_equal expected, actual
  end

  def test_it_can_add_tomatoes
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)
    actual = vendor.inventory
    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, actual
  end

end
