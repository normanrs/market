require_relative 'vendor.rb'

class Market
	attr_reader :name, :vendors

	def initialize(name, vendors = [])
    @name = name
    @vendors = vendors
	end

	def add_vendor(vendor_in)
		@vendors << vendor_in
	end

	def vendor_names
		@vendors.map do |vendor|
			vendor.name
		end
	end

	def vendors_that_sell(item_in)
		found_vendors = []
		@vendors.each do |vendor|
      found_vendors << vendor if (vendor.inventory.keys).include? item_in
    end
		found_vendors
	end

	def sorted_item_list
		all_items = []
		unique_items = []
		vendors.each do |vendor|
			all_items << vendor.inventory.keys
		end
		unique_items = (all_items.flatten).uniq
		unique_items.sort
	end
end
