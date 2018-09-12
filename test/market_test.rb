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
    actual = market.vendor_names
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
  end

  # pry(main)> market.vendors_that_sell("Peaches")
  # #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe134910650...>]
  #
  # pry(main)> market.vendors_that_sell("Banana Nice Cream")
  # #=> [#<Vendor:0x00007fe1349bed40...>]
end
