require_relative 'vendor.rob'

class Market
	attr_reader :name, :vendors

	def initialize(name, vendors = [])
    @name = name
    @vendors = vendors
	end


end
