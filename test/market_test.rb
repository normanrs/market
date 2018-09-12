require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/vendor.rb'
require_relative '../lib/market.rb'

class MarketTest <  Minitest::Test
  def test_it_exists
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
  end

  def test_it_has_name
    market = Market.new("South Pearl Street Farmers Market")
    actual = market.name
    expected = "South Pearl Street Farmers Market"
    assert_equal expected, actual
  end

  def test_starts_with_no_vendors
    market = Market.new("South Pearl Street Farmers Market")
    actual = market.vendors
    expected = []
    assert_equal expected, actual
  end

  def test_it_can_add_vendors_with_stock
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    actual = market.vendors.count
    expected = 3
    assert_equal expected, actual
  end

  def test_it_can_add_vendors_with_stock
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    actual = market.vendors
    expected = [vendor_1, vendor_2, vendor_3]
    assert_equal expected, actual
  end

  def test_it_can_find_vendors_that_sell_item
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    assert_equal [vendor_1, vendor_3], market.vendors_that_sell("Peaches")
    assert_equal [vendor_2], market.vendors_that_sell("Banana Nice Cream")
  end

  def test_it_can_return_sorted_item_list
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    actual = market.sorted_item_list
    expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]
    assert_equal expected, actual
  end


end
