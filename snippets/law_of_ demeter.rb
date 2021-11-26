# Bad
class Address
  attr_reader :city
end

class Bulding
  attr_reader :address
end

def building_city(building)
  building.address && building.address.city
end

# Good

class Address
  attr_reader :city
end

class Bulding
  attr_reader :address

  def address_city
    address && address.city
  end
end

def building_city(building)
  building.address_city
end
