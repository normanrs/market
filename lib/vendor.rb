class Vendor
	attr_reader :name, :inventory

	def initialize(name, inventory = {})
    @name = name
    @inventory = inventory
	end

  def check_stock(item)
    stock = @inventory[item]
    stock = 0 if @inventory[item] == nil
    stock
  end

  def stock(item, num)
    @inventory[item] = check_stock(item) + num
  end
end
