# Bad

class Balance
  attr_reader :amount, :currency, :owner

  def initialize(amount, currency, owner)
    @amount = amount
    @currency = currency
    @owner = owner
  end
end

Balance.new(1000, 'USD', 'John')

# Good

class Balance
  attr_reader :amount, :currency, :owner

  def initialize(amount:, currency:, owner:)
    @amount = amount
    @currency = currency
    @owner = owner
  end
end

Balance.new(amount: 1000, currency: 'USD', owner: 'John')
Balance.new(currency: 'USD', owner: 'John', amount: 1000)