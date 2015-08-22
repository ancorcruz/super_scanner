require 'forwardable'

module SuperScanner
  class PricingRule
    extend Forwardable

    def initialize(unit_price, special_price: NullDiscount.new)
      @unit_price, @special_price = unit_price, special_price
    end

    def price_for(amount)
      price_before_adjustment_for(amount) + adjustment_for(amount)
    end

    private

    def_delegator :@special_price, :apply_for, :adjustment_for

    def price_before_adjustment_for(amount)
      @unit_price * amount
    end
  end
end
