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
	
end
