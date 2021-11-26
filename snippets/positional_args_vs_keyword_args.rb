# Bad

class Balance
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end
end

Balance.new(1000, 'USD')

# Good

class Balance
  attr_reader :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end
end

Balance.new(amount: 1000, currency: 'USD')
Balance.new(currency: 'USD', amount: 1000)