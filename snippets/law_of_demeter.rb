# Bad
class Address
  attr_reader :city
  # and many other fields
end

class Bulding
  attr_reader :address
  # and many other fields
end

class BuildingSerializer
  attr_reader :building

  def city
    building.address && building.address.city
  end
  # and many other methods
end

# Good

class Address
  attr_reader :city
  # and many other fields
end

class Bulding
  attr_reader :address
  # and many other fields

  def address_city
    address && address.city
  end
end

class BuildingSerializer
  attr_reader :building

  def city
    building.address_city
  end
  # and many other methods
end
