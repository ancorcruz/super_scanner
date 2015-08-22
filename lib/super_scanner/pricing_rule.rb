module SuperScanner
  class PricingRule
    def initialize(unit_price)
      @unit_price = unit_price
    end

    def price_for(amount)
      @unit_price * amount
    end
  end
end
