module SuperScanner
  class Checkout
    PricingRuleNotFound = Class.new(StandardError)

    def initialize(pricing_rules)
      @pricing_rules = pricing_rules
      @scanned_items = Hash.new(0)
    end

    def total
      scanned_items.inject(0) do |total, (item, amount)|
        total += price_for(item, amount)
      end
    end

    def scan(item)
      scanned_items[item] += 1
    end

    private

    attr_reader :pricing_rules, :scanned_items

    def price_for(item, amount)
      pricing_rule_for(item).price_for(amount)
    end

    def pricing_rule_for(item)
      pricing_rules.fetch(item) do
        fail PricingRuleNotFound, %{Pricing rule not found for "#{item}"}
      end
    end
  end
end
